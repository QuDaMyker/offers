import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:offers/common/constants.dart';
import 'package:offers/models/offer.dart';
import 'package:offers/util/helper.dart';
import 'package:offers/widgets/common_widgets/common_button.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({
    super.key,
    this.image,
    required this.offer,
    this.height,
    this.width,
  });
  final String? image;
  final Offer offer;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 150,
      width: width ?? 100,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: AppColors.borderColor,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 5,
            child: _buildTopComponent(),
          ),
          Expanded(
            flex: 2,
            child: _buildBottomComponent(),
          ),
        ],
      ),
    );
  }

  Container _buildBottomComponent() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: _buildTitle(),
          ),
          Expanded(
            child: _buildDiscountPrice(),
          ),
          Expanded(
            flex: 3,
            child: _buildDescription(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonButton(
                  onTap: () {},
                  title: 'Buy now',
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: Container(
            child: Text(
              offer.description,
              style: TextStyle(),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
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
          style: const TextStyle(
            decoration: TextDecoration.lineThrough,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        Icon(
          Icons.arrow_forward,
          applyTextScaling: false,
          color: AppColors.black.withOpacity(0.5),
          size: 24,
        ),
        Text(
          discountedPriceHandle,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Row _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          offer.title,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
          maxLines: 2,
        ),
      ],
    );
  }

  Stack _buildTopComponent() {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildImage(),
        _buildDiscountPercent(),
      ],
    );
  }

  Align _buildDiscountPercent() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: const Text(
          '30%',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Container _buildImage() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: AppImages.imgDemo2,
      ),
    );
  }
}
