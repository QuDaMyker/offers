import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:offers/models/offer.dart';
import 'package:offers/repositories/api.dart';
import 'package:offers/repositories/log.dart';

class ApiImpl implements Api {
  Log log;
  final String domain;
  final Dio dio;

  ApiImpl(this.log)
      : domain = dotenv.get('BASE_URL'),
        dio = Dio();

  @override
  Future<Offer?> createOffer(Offer offer) async {
    final String url = '$domain/offer-services/offers';
    Response response;

    try {
      final offerJson = offer.toJson();

      Map<String, dynamic> offerData = {
        "title": offer.title,
        "description": offer.description,
        "discountPercentage": offer.discountPercentage,
        "originalPrice": offer.originalPrice,
        "discountedPrice": offer.discountedPrice,
      };

      log.i('createOffer', offerJson);
      response = await dio.post(
        url,
        data: offerData,
      );

      if (response.statusCode == 200) {
        return Offer.fromJson(json.encode(response.data['result']));
      } else {
        log.e('createOffer', 'Failed to create offer: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log.e('Error creating offer', e.toString());
      return null;
    }
  }

  @override
  Future<void> deleteOffer(String id) async {
    final String url =
        '$domain/offer-services/offers/$id'; // Fixed URL formatting
    Response response;

    try {
      response = await dio.delete(url);

      if (response.statusCode == 200) {
        log.i('deleteOffer', 'Offer deleted successfully');
      } else {
        log.e('deleteOffer',
            'Failed to delete offer with status code: ${response.statusCode}');
      }
    } catch (e) {
      log.e('deleteOffer', e.toString());
    }
  }

  @override
  Future<List<Offer>?> getAllOffer({
    required int pageId,
    int pageSize = 5,
  }) async {
    final String url = '$domain/offer-services/offers?limit=10&offset=1';
    Response response;

    try {
      response = await dio.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> result = response.data['result'];

        final List<dynamic> offersData = result['offers'];

        final List<Offer> offers = offersData
            .map((item) => Offer.fromJson(json.encode(item)))
            .toList();

        return offers;
      } else {
        return null;
      }
    } catch (e) {
      log.e('getAllOffer', e.toString());
      return null;
    }
  }

  @override
  Future<Offer?> getOfferById(String id) async {
    final String url = '$domain/offer-services/offers/$id';
    Response response;

    try {
      response = await dio.get(url);

      if (response.statusCode == 200) {
        Offer offer = Offer.fromJson(json.encode(response.data['result']));

        return offer;
      } else {
        return null;
      }
    } catch (e) {
      log.e('getAllOffer', e.toString());
      return null;
    }
  }

  @override
  Future<Offer?> updateOffer(Offer offer) async {
    final String url = '$domain/offer-services/offers/${offer.id}';
    Response response;

    try {
      Map<String, dynamic> offerData = {
        "title": offer.title,
        "description": offer.description,
        "discountPercentage": offer.discountPercentage,
        "originalPrice": offer.originalPrice,
        "discountedPrice": offer.discountedPrice,
        "createdAt": offer.createdAt.toString(),
      };

      response = await dio.put(url, data: offerData);

      if (response.statusCode == 200) {
        Offer updatedOffer =
            Offer.fromJson(json.encode(response.data['result']));
        log.i('updateOffer', updatedOffer.toString());
        return updatedOffer;
      } else {
        log.e('updateOffer',
            'Failed to update offer with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log.e('updateOffer', e.toString());
      return null;
    }
  }
}
