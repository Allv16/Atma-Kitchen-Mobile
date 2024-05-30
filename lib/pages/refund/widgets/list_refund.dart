import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/models/refund/refund.dart';
import 'package:atma_kitchen/widgets/pill.dart';
import 'package:flutter/material.dart';

Widget listRefund(Refund refund) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateToString(refund.requestDate!),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            statusPill("On Process")
          ],
        ),
        const SizedBox(height: 10),
        Text(
          "Amount: ${currencyFormat(refund.amount!)}",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Account Number: ${refund.accountNumber!}",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
