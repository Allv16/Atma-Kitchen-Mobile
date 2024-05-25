import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/models/product/product.dart';
import 'package:atma_kitchen/pages/products/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget productCard(Product product) {
  return GestureDetector(
    onTap: () {
      Get.to(() => ProductPage(
            product: product,
          ));
    },
    child: Container(
      width: HeightConstants.PRODUCT_CARD_WIDTH,
      decoration: BoxDecoration(
        color: AppColors.kSecondaryLighter,
        borderRadius: BorderRadius.circular(RadiusConstants.RADIUS_DEFAULT),
        // boxShadow: List<BoxShadow>.generate(
        //   3,
        //   (index) => BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 3,
        //     spreadRadius: 0.5,
        //     offset: const Offset(0, 1),
        //   ),
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: PaddingConstants.PADDING_SMALL),
        child: Column(children: [
          Image.network(
            product.urlToImage!,
            width: 120,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingConstants.PADDING_XS),
            child: Column(
              children: [
                const SizedBox(height: PaddingConstants.PADDING_XS),
                SizedBox(
                  height: 32,
                  child: Text(product.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[500]!,
                        fontSize: TextConstants.TEXT_XS,
                      )),
                ),
                const SizedBox(height: PaddingConstants.PADDING_2XS),
                Text(
                  currencyFormat(product.price!),
                  style: TextStyle(
                      color: AppColors.kSecondary,
                      fontSize: TextConstants.TEXT_SMALL,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: PaddingConstants.PADDING_2XS),
                product.stock == null
                    ? const SizedBox()
                    : Text(
                        '${product.stock} in stock',
                        style: TextStyle(
                            color: AppColors.kPrimary,
                            fontSize: TextConstants.TEXT_2XS,
                            fontWeight: FontWeight.bold),
                      )
              ],
            ),
          )
        ]),
      ),
    ),
  );
}
