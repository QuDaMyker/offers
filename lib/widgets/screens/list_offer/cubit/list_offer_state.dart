// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_offer_cubit.dart';

class ListOfferState extends Equatable {
  final LoadStatus loadStatus;
  final List<Offer> offers;

  const ListOfferState({
    required this.loadStatus,
    required this.offers,
  });

  const ListOfferState.init({
    this.loadStatus = LoadStatus.Init,
    this.offers = const [],
  });
  @override
  List<Object> get props => [loadStatus, offers];

  ListOfferState copyWith({
    LoadStatus? loadStatus,
    List<Offer>? offers,
  }) {
    return ListOfferState(
      loadStatus: loadStatus ?? this.loadStatus,
      offers: offers ?? this.offers,
    );
  }
}
