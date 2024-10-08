import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:offers/common/constants.dart';
import 'package:offers/models/offer.dart';
import 'package:offers/util/helper.dart';
import 'package:offers/widgets/common_widgets/common_button.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({
    super.key,
    required this.offer,
    this.height,
    this.width,
    this.onTap,
    this.onBuyNow,
  });
  final Function()? onTap;
  final Function()? onBuyNow;
  final Offer offer;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 130),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1.5,
          color: AppColors.borderColor,
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: AppColors.gradientColors,
        ),
      ),
      height: height,
      width: width,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          splashColor: Colors.black.withOpacity(0.3),
          child: Container(
            child: ClipRect(
                child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildTitle(),
                            _buildDiscountPrice(),
                          ],
                        ),
                        _buildDiscountPercent(),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Text(
                        offer.description,
                        style: TextStyle(
                          color: AppColors.white,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    CommonButton(
                      backgroundColor: AppColors.textColor,
                      onTap: onBuyNow ?? () {},
                      title: 'Buy now',
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SingleChildScrollView(
          child: Container(
            child: Text(
              offer.description,
              style: TextStyle(
                color: AppColors.white,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        CommonButton(
          backgroundColor: AppColors.textColor,
          onTap: onBuyNow ?? () {},
          title: 'Buy now',
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ],
    );
  }

  Row _buildDiscountPrice() {
    String originalPriceHandle =
        Helper().formatCurrency(offer.originalPrice, '\$');
    String discountedPriceHandle =
        Helper().formatCurrency(offer.discountedPrice, '\$');
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          originalPriceHandle,
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            decorationColor: AppColors.white,
            decorationThickness: 1.5,
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: AppColors.white,
          ),
        ),
        Icon(
          Icons.arrow_forward,
          applyTextScaling: false,
          color: AppColors.textColor.withOpacity(0.9),
          size: 24,
        ),
        Text(
          discountedPriceHandle,
          style: TextStyle(
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.only(right: 60),
      child: Text(
        offer.title,
        style: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildDiscountPercent() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 55,
        height: 55,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Center(
          child: Text(
            '${offer.discountPercentage}%',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
