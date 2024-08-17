import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:offers/common/enum/load_staus.dart';
import 'package:offers/models/offer.dart';
import 'package:offers/repositories/api.dart';
import 'package:offers/util/helper.dart';

part 'edit_offer_state.dart';

class EditOfferCubit extends Cubit<EditOfferState> {
  Offer? offer;
  Api api;

  EditOfferCubit(this.api, this.offer) : super(EditOfferState.init(offer));
}
