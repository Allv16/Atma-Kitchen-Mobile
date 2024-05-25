import 'package:atma_kitchen/core/constants.dart';
import 'package:flutter/material.dart';

Widget categoryCard(String title, String image, Function onTap) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Column(
      children: [
        Image.asset(
          image,
          width: 64,
          height: title == 'Snacks' || title == 'Hampers' ? 63 : null,
        ),
        const SizedBox(height: PaddingConstants.PADDING_XS),
        Text(title, style: const TextStyle(fontSize: TextConstants.TEXT_SMALL)),
      ],
    ),
  );
}
