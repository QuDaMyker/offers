import 'package:offers/models/offer.dart';

abstract class Api {
  Future<Offer?> createOffer(Offer offer);
  Future<Offer?> getOfferById(int id);
  Future<List<Offer>?> getAllOffer({required int pageId, int pageSize = 5});
  Future<void> deleteOffer(int id);
  Future<Offer?> updateOffer(Offer offer);
}
