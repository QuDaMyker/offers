import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offers/common/enum/load_status.dart' as custom;
import 'package:offers/models/offer.dart';
import 'package:offers/repositories/api.dart';
import 'package:offers/repositories/log.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' hide LoadStatus;

part 'list_offer_state.dart';

class ListOfferCubit extends Cubit<ListOfferState> {
  Api api;
  Log log;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ListOfferCubit(this.api, this.log) : super(ListOfferState.init());

  Future<void> loadData({int pageId = 1}) async {
    emit(state.copyWith(loadStatus: custom.LoadStatus.Loading));

    List<Offer>? offers = await api.getAllOffer(pageId: pageId);

    if (offers != null) {
      if (pageId > 1) {
        emit(state.copyWith(
          loadStatus: custom.LoadStatus.Done,
          offers: [...offers, ...state.offers],
        ));
      } else {
        emit(state.copyWith(
          loadStatus: custom.LoadStatus.Done,
          offers: offers,
        ));
      }
      log.i('loadData', '$pageId ${state.offers.length}');
      return;
    }
    emit(state.copyWith(loadStatus: custom.LoadStatus.Done));
  }

  Future<void> deleteOffer(String id, Offer offer) async {
    await api.deleteOffer(id);
    final index = state.offers.indexOf(offer);
    if (index != -1) {
      final newOffers = List<Offer>.from(state.offers);
      newOffers.removeAt(index);
      emit(state.copyWith(offers: newOffers));
    }
  }

  Future<void> onRefresh() async {
    // return Future.delayed(const Duration(seconds: 2));
    print('onrefresh');
    await loadData(pageId: 1);
    refreshController.refreshCompleted();
  }

  Future<void> onLoading() async {
    emit(state.copyWith(pageId: state.pageId + 1));
    await loadData(pageId: state.pageId);
    refreshController.loadComplete();
  }

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
