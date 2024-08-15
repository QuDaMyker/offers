import 'package:offers/models/offer.dart';
import 'package:offers/repositories/api.dart';
import 'package:offers/repositories/log.dart';

class ApiImpl implements Api {
  Log log;

  ApiImpl(this.log);
  @override
  Future<Offer?> createOffer(Offer offer) {
    // TODO: implement createOffer
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOffer(int id) {
    // TODO: implement deleteOffer
    throw UnimplementedError();
  }

  @override
  Future<List<Offer>?> getAllOffer({required int pageId, int pageSize = 5}) {
    // TODO: implement getAllOffer
    throw UnimplementedError();
  }

  @override
  Future<Offer?> getOfferById(int id) {
    // TODO: implement getOfferById
    throw UnimplementedError();
  }

  @override
  Future<Offer?> updateOffer(Offer offer) {
    // TODO: implement updateOffer
    throw UnimplementedError();
  }
}
