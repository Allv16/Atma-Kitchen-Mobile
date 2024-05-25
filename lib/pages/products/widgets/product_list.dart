import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/models/product/product.dart';

import 'package:atma_kitchen/models/product/transaction_details.dart';
import 'package:flutter/material.dart';

Row transactionProductList(TransactionDetails details) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          details.product!.urlToImage!,
          height: 40,
          width: 48,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: PaddingConstants.PADDING_SMALL),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(details.product!.name!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(
            '${details.quantity} item',
            style: const TextStyle(
                color: Colors.grey, fontSize: TextConstants.TEXT_XS),
          ),
        ],
      ),
    ],
  );
}

Row productList(Product product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          product.urlToImage!,
          height: 32,
          width: 36,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: PaddingConstants.PADDING_2XS),
      Expanded(
        child: Text(
          product.name!,
          style: const TextStyle(fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
