import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/models/product/transaction.dart';
import 'package:atma_kitchen/pages/products/widgets/product_list.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:atma_kitchen/widgets/pill.dart';
import 'package:flutter/material.dart';

Container orderCard(BuildContext context, Transaction transaction,
    Function(String id) onClick) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(RadiusConstants.RADIUS_DEFAULT),
      boxShadow: List<BoxShadow>.generate(
        3,
        (index) => BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 3,
          spreadRadius: 0.5,
          offset: const Offset(0, 1),
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: PaddingConstants.PADDING_DEFAULT,
          vertical: PaddingConstants.PADDING_SMALL),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: IconSizeConstant.MEDIUM,
                  ),
                  const SizedBox(
                    width: PaddingConstants.PADDING_2XS,
                  ),
                  Text(dateToString(transaction.createdAt!))
                ],
              ),
              statusPill(transaction.status!)
            ],
          ),
          const Divider(),
          Column(
            children: transaction.transactionDetails!
                .map((product) => Column(
                      children: [
                        transactionProductList(product),
                        const SizedBox(
                          height: PaddingConstants.PADDING_2XS,
                        )
                      ],
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Total Purchases",
                      style: TextStyle(
                          fontSize: TextConstants.TEXT_2XS,
                          color: Colors.grey)),
                  Text(currencyFormat(transaction.payment!.total!),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: TextConstants.TEXT_SMALL)),
                ],
              ),
              transaction.status == "Delivered"
                  ? primarySmallButton(
                      context: context,
                      text: "Complete",
                      onPressed: () => onClick(transaction.id!))
                  : const SizedBox()
            ],
          )
        ],
      ),
    ),
  );
}
