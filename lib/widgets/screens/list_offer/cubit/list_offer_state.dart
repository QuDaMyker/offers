// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_offer_cubit.dart';

class ListOfferState extends Equatable {
  final custom.LoadStatus loadStatus;
  final List<Offer> offers;
  final int pageId;

  const ListOfferState({
    required this.loadStatus,
    required this.offers,
    required this.pageId,
  });

  factory ListOfferState.init() {
    return ListOfferState(
      pageId: 1,
      loadStatus: custom.LoadStatus.Init,
      offers: [
        // Offer(
        //   id: '1',
        //   title: 'title',
        //   description: 'description',
        //   discountPercentage: 10,
        //   originalPrice: 100,
        //   discountedPrice: 90,
        //   createdAt: DateTime.now(),
        // ),
        // Offer(
        //   id: '1',
        //   title: 'title',
        //   description: 'description',
        //   discountPercentage: 10,
        //   originalPrice: 100,
        //   discountedPrice: 90,
        //   createdAt: DateTime.now(),
        // ),
        // Offer(
        //   id: '1',
        //   title: 'title',
        //   description: 'description',
        //   discountPercentage: 10,
        //   originalPrice: 100,
        //   discountedPrice: 90,
        //   createdAt: DateTime.now(),
        // ),
        // Offer(
        //   id: '1',
        //   title: 'title',
        //   description: 'description',
        //   discountPercentage: 10,
        //   originalPrice: 100,
        //   discountedPrice: 90,
        //   createdAt: DateTime.now(),
        // ),
        // Offer(
        //   id: '1',
        //   title: 'title',
        //   description: 'description',
        //   discountPercentage: 10,
        //   originalPrice: 100,
        //   discountedPrice: 90,
        //   createdAt: DateTime.now(),
        // ),
        // Offer(
        //   id: '1',
        //   title: 'title',
        //   description: 'description',
        //   discountPercentage: 10,
        //   originalPrice: 100,
        //   discountedPrice: 90,
        //   createdAt: DateTime.now(),
        // ),
        // Offer(
        //   id: '1',
        //   title: 'title',
        //   description: 'description',
        //   discountPercentage: 10,
        //   originalPrice: 100,
        //   discountedPrice: 90,
        //   createdAt: DateTime.now(),
        // ),
      ],
    );
  }

  @override
  List<Object> get props => [loadStatus, offers, pageId];

  ListOfferState copyWith(
      {custom.LoadStatus? loadStatus, List<Offer>? offers, int? pageId}) {
    return ListOfferState(
      pageId: pageId ?? this.pageId,
      loadStatus: loadStatus ?? this.loadStatus,
      offers: offers ?? this.offers,
    );
  }
}
