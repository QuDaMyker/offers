import 'package:offers/models/offer.dart';

abstract class Api {
  Future<Offer?> createOffer(Offer offer);
  Future<Offer?> getOfferById(String id);
  Future<List<Offer>?> getAllOffer({required int pageId, int pageSize = 5});
  Future<void> deleteOffer(String id);
  Future<Offer?> updateOffer(Offer offer);
}
