import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offers/common/enum/load_status.dart';
import 'package:offers/models/offer.dart';
import 'package:offers/repositories/api.dart';
import 'package:offers/util/helper.dart';

part 'edit_offer_state.dart';

class EditOfferCubit extends Cubit<EditOfferState> {
  Offer? offer;
  Api api;

  EditOfferCubit(this.api, this.offer) : super(EditOfferState.init(offer));
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  Future<void> addOffer() async {
    if (formKeyLogin.currentState!.validate()) {
      formKeyLogin.currentState!.save();

      emit(state.copyWith(loadStatus: LoadStatus.Loading));

      Offer? offer = await api.createOffer(
        Offer(
          title: state.titleController.text.trim(),
          description: state.descriptionController.text.trim(),
          discountPercentage:
              double.parse(state.discountPercentageController.text.trim()),
          originalPrice:
              double.parse(state.originalPriceController.text.trim()),
          discountedPrice:
              double.parse(state.discountedPriceController.text.trim()),
          createdAt: DateTime.now(),
        ),
      );

      emit(
        state.copyWith(
          loadStatus: offer != null ? LoadStatus.Done : LoadStatus.Error,
        ),
      );
    } else {}
  }

  Future<void> editOffer(Offer offer) async {
    if (formKeyLogin.currentState!.validate()) {
      formKeyLogin.currentState!.save();

      emit(state.copyWith(loadStatus: LoadStatus.Loading));
      offer = offer.copyWith(
        title: state.titleController.text.trim(),
        description: state.descriptionController.text.trim(),
        discountPercentage:
            double.parse(state.discountPercentageController.text.trim()),
        originalPrice: double.parse(state.originalPriceController.text.trim()),
      );
      await api.updateOffer(offer);
      emit(state.copyWith(loadStatus: LoadStatus.Done));
    } else {}
  }

  void onChangePrice(String value) {
    try {
      double price = double.parse(state.originalPriceController.text.trim());
      double discount =
          double.parse(state.discountPercentageController.text.trim());

      double discountedPrice = price - (price * discount / 100);

      emit(
        state.copyWith(
          discountedPriceController: TextEditingController(
            text: discountedPrice.toStringAsFixed(2),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          discountedPriceController: TextEditingController(
            text: 'Error',
          ),
        ),
      );
    }
  }
}
