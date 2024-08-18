import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:offers/common/constants.dart';
import 'package:offers/common/enum/load_status.dart' as custom;
import 'package:offers/models/offer.dart';
import 'package:offers/repositories/api.dart';
import 'package:offers/widgets/common_widgets/base_dialog.dart';
import 'package:offers/widgets/common_widgets/noti_bar.dart';
import 'package:offers/widgets/common_widgets/offer_item.dart';
import 'package:offers/widgets/screens/edit_offer/cubit/edit_offer_cubit.dart';
import 'package:offers/widgets/screens/edit_offer/edit_offer.dart';
import 'package:offers/widgets/screens/list_offer/cubit/list_offer_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
    return BlocConsumer<ListOfferCubit, ListOfferState>(
      listener: (context, state) {
        if (state.loadStatus == custom.LoadStatus.Error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(notiBar("Fetch Offer Error", true));
        }
      },
      builder: (contextCubit, state) {
        return Scaffold(
          floatingActionButton: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.textColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => editOffer(
                contextCubit: contextCubit,
                context: context,
                addNew: true,
              ),
              icon: Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
          ),
          backgroundColor: AppColors.bgColor,
          body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: state.refreshController,
            onRefresh: context.read<ListOfferCubit>().onRefresh,
            onLoading: context.read<ListOfferCubit>().onLoading,
            child: state.loadStatus == custom.LoadStatus.Loading &&
                    state.offers.isEmpty
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
                                onPressed: (context) => editOffer(
                                  contextCubit: contextCubit,
                                  context: context,
                                  offer: offer,
                                  addNew: false,
                                ),
                                backgroundColor: AppColors.editColor,
                                foregroundColor: AppColors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                              SlidableAction(
                                onPressed: (context) {
                                  showDialog(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    useSafeArea: true,
                                    builder: (ctx) => BaseDialog(
                                      message:
                                          'Do you want to delete this offer?',
                                      onOK: () async {
                                        await contextCubit
                                            .read<ListOfferCubit>()
                                            .deleteOffer(offer.id!, offer);
                                        Navigator.of(ctx).pop();
                                      },
                                      onCancel: () {
                                        Navigator.of(ctx).pop();
                                      },
                                    ),
                                  ).then((value) => null);
                                },
                                backgroundColor: AppColors.deleteColor,
                                foregroundColor: AppColors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: OfferItem(
                            onBuyNow: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                notiBar("Feature comming soon", false,
                                    duration:
                                        const Duration(milliseconds: 300)),
                              );
                            },
                            offer: offer,
                          ),
                        );
                      },
                    ),
                  ),
          ),
        );
      },
    );
  }
}

editOffer({
  required BuildContext contextCubit,
  required BuildContext context,
  Offer? offer,
  bool addNew = false,
}) {
  showModalBottomSheet(
    isDismissible: false,
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    builder: (ctx) {
      return BlocProvider(
        create: (context) => EditOfferCubit(context.read<Api>(), offer),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: EditOffer(
            offer: offer,
            addNew: addNew,
          ),
        ),
      );
    },
  ).whenComplete(() {
    contextCubit.read<ListOfferCubit>().loadData();
  });
}
