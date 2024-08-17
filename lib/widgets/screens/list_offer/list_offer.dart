import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offers/common/constants.dart';
import 'package:offers/common/enum/load_staus.dart';
import 'package:offers/models/offer.dart';
import 'package:offers/repositories/api.dart';
import 'package:offers/widgets/common_widgets/noti_bar.dart';
import 'package:offers/widgets/common_widgets/offer_item.dart';
import 'package:offers/widgets/screens/list_offer/cubit/list_offer_cubit.dart';

class ListOffer extends StatelessWidget {
  const ListOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListOfferCubit(context.read<Api>())..loadData(),
      child: const Page(),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offer list page'),
      ),
      backgroundColor: AppColors.bgColor,
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<ListOfferCubit, ListOfferState>(
      listener: (context, state) {
        if (state.loadStatus == LoadStatus.Error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(notiBar("Fetch Offer Error", true));
        }
      },
      builder: (context, state) {
        return state.loadStatus == LoadStatus.Loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: (deviceWidth / 3) / (deviceHeight / 2.7),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),
                itemCount: state.offers.length,
                itemBuilder: (context, index) {
                  Offer offer = state.offers[index];
                  return OfferItem(
                    offer: offer,
                  );
                },
              );
      },
    );
  }
}
