import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/models/product/hampers.dart';
import 'package:atma_kitchen/pages/products/widgets/product_list.dart';
import 'package:flutter/material.dart';

Widget hampersCard(BuildContext context, Hampers hampers) {
  return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      decoration: BoxDecoration(
        color: AppColors.kSecondaryLighter,
        borderRadius: BorderRadius.circular(RadiusConstants.RADIUS_DEFAULT),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: PaddingConstants.PADDING_SMALL,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  hampers.hampers!.urlToImage!,
                  width: 120,
                ),
                Text(
                  hampers.hampers!.name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[500]!,
                    fontSize: TextConstants.TEXT_DEFAULT,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: PaddingConstants.PADDING_SMALL),
              child: Column(
                children: [
                  const SizedBox(
                    height: PaddingConstants.PADDING_XS,
                  ),
                  Text(
                    currencyFormat(hampers.hampers!.price!),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.kSecondary,
                      fontSize: TextConstants.TEXT_LARGE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Stock: 20",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[400]!,
                      fontSize: TextConstants.TEXT_XS,
                    ),
                  ),
                  Divider(color: Colors.grey[300]!),
                  const SizedBox(
                    height: PaddingConstants.PADDING_2XS,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Products:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.grey[500]!,
                        fontSize: TextConstants.TEXT_XS,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  ...hampers.items!
                      .map((item) => Column(
                            children: [
                              productList(item),
                              const SizedBox(
                                height: PaddingConstants.PADDING_2XS,
                              )
                            ],
                          ))
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ));
}
