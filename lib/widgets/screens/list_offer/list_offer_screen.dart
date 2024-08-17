import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:offers/common/constants.dart';
import 'package:offers/common/enum/load_staus.dart';
import 'package:offers/models/offer.dart';
import 'package:offers/repositories/api.dart';
import 'package:offers/widgets/common_widgets/noti_bar.dart';
import 'package:offers/widgets/common_widgets/offer_item.dart';
import 'package:offers/widgets/screens/edit_offer/edit_offer.dart';
import 'package:offers/widgets/screens/list_offer/cubit/list_offer_cubit.dart';

class ListOfferScreen extends StatelessWidget {
  const ListOfferScreen({super.key});

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
      // appBar: AppBar(
      //   title: const Text('Offer list page'),
      // ),
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
    return BlocConsumer<ListOfferCubit, ListOfferState>(
      listener: (context, state) {
        if (state.loadStatus == LoadStatus.Error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(notiBar("Fetch Offer Error", true));
        }
      },
      builder: (context, state) {
        return state.loadStatus == LoadStatus.Loading
            ? Center(
                child: loadingWidget(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: const Divider(),
                  ),
                  itemCount: state.offers.length,
                  itemBuilder: (context, index) {
                    Offer offer = state.offers[index];
                    return Slidable(
                      key: UniqueKey(),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: AppColors.editColor,
                            foregroundColor: AppColors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: AppColors.deleteColor,
                            foregroundColor: AppColors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: OfferItem(
                        onTap: () => showBottomSheetOffer(
                            context: context, offer: offer),
                        offer: offer,
                      ),
                    );
                  },
                ),
              );
      },
    );
  }

  showBottomSheetOffer({required BuildContext context, required Offer offer}) {
    showBottomSheet(
      context: context,
      builder: (ctx) {
        return EditOffer();
      },
    );
  }
}
