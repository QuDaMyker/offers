import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offers/common/constants.dart';
import 'package:offers/common/enum/load_staus.dart';
import 'package:offers/models/offer.dart';
import 'package:offers/widgets/common_widgets/common_button.dart';
import 'package:offers/widgets/common_widgets/common_text_field.dart';
import 'package:offers/widgets/common_widgets/noti_bar.dart';
import 'package:offers/widgets/screens/edit_offer/cubit/edit_offer_cubit.dart';

class EditOffer extends StatelessWidget {
  final Offer? offer;
  final bool addNew;
  const EditOffer({
    super.key,
    this.offer,
    required this.addNew,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditOfferCubit, EditOfferState>(
      listener: (context, state) {
        if (state.loadStatus == LoadStatus.Error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(notiBar("Update Offer Error", true));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildAppbar(context),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    addNew
                        ? const SizedBox()
                        : Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '#ID',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  offer!.id.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    CustomRow(
                      title: 'Title',
                      controller: state.titleController,
                      textInputType: TextInputType.text,
                    ),
                    CustomRow(
                      title: 'Description',
                      controller: state.descriptionController,
                      textInputType: TextInputType.text,
                    ),
                    CustomRow(
                      title: 'DiscountPercentage',
                      controller: state.discountPercentageController,
                      textInputType: TextInputType.number,
                      suffixText: '%',
                    ),
                    CustomRow(
                      title: 'OriginalPrice',
                      controller: state.originalPriceController,
                      textInputType: TextInputType.number,
                      suffixText: '\$',
                    ),
                    CustomRow(
                      title: 'DiscountedPrice',
                      controller: state.discountedPriceController,
                      textInputType: TextInputType.number,
                      suffixText: '\$',
                    ),
                    addNew
                        ? const SizedBox()
                        : CustomRow(
                            title: 'CreatedAt',
                            enable: false,
                            controller: state.createAtPriceController,
                          ),
                  ],
                ),
              ),
              CommonButton(
                backgroundColor: AppColors.textColor,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                title: addNew ? 'Add' : 'Update now',
                onTap: () {},
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Edit Offer'),
      backgroundColor: AppColors.white,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
      ],
      leading: const Icon(
        Icons.close,
        color: Colors.transparent,
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.title,
    this.controller,
    this.textStyle,
    this.enable,
    this.margin,
    this.textInputType,
    this.suffixText,
  });
  final bool? enable;
  final String title;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin;
  final TextInputType? textInputType;
  final String? suffixText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '#$title',
                style: textStyle ??
                    const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
              ),
            ),
          ),
          Expanded(
            child: CommonTextField(
              textInputType: textInputType,
              controller: controller,
              enable: enable,
              suffixText: suffixText,
            ),
          ),
        ],
      ),
    );
  }
}
