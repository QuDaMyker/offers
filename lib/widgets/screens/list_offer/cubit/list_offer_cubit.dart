import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offers/common/enum/load_status.dart' as custom;
import 'package:offers/models/offer.dart';
import 'package:offers/repositories/api.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' hide LoadStatus;

part 'list_offer_state.dart';

class ListOfferCubit extends Cubit<ListOfferState> {
  final Api api;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ListOfferCubit(this.api) : super(ListOfferState.init());

  Future<void> loadData({int pageId = 1}) async {
    emit(state.copyWith(loadStatus: custom.LoadStatus.Loading));

    List<Offer>? offers = await api.getAllOffer(pageId: pageId);
    if (offers != null) {
      emit(state.copyWith(
        loadStatus: custom.LoadStatus.Done,
        offers: offers,
      ));
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

  void onRefresh() async {
    await loadData(pageId: 1);
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    refreshController.loadComplete();
  }

  @override
  Future<void> close() {
    state.refreshController.dispose();
    return super.close();
  }
}
