import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/models/product/product.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:atma_kitchen/widgets/pill.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.urlToImage!,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.kSecondary,
            padding: const EdgeInsets.symmetric(
                vertical: PaddingConstants.PADDING_XS),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: PaddingConstants.PADDING_DEFAULT),
              child: Text(product.productType!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: TextConstants.TEXT_MEDIUM,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingConstants.PADDING_DEFAULT),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      currencyFormat(product.price!),
                      style: TextStyle(
                        fontSize: TextConstants.TEXT_3XL,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kSecondary,
                      ),
                    ),
                    const SizedBox(width: PaddingConstants.PADDING_XS),
                    product.stock != null
                        ? secondaryPill("${product.stock!} in stock")
                        : Container()
                  ],
                ),
                Text(product.name!,
                    style: const TextStyle(
                      fontSize: TextConstants.TEXT_LARGE,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                Text(
                  product.description!,
                  style: TextStyle(
                    fontSize: TextConstants.TEXT_DEFAULT,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
