import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offers/common/enum/load_staus.dart';
import 'package:offers/models/offer.dart';
import 'package:offers/repositories/api.dart';

part 'list_offer_state.dart';

class ListOfferCubit extends Cubit<ListOfferState> {
  Api api;
  ListOfferCubit(this.api) : super(const ListOfferState.init());

  Future<void> loadData() async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
  }

  Future<void> deleteOffer(String id) async {}
  Future<void> addOffer(Offer offer) async {}
  Future<void> editOffer(Offer offer) async {}
}
