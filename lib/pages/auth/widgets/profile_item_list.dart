import 'package:atma_kitchen/core/constants.dart';
import 'package:flutter/material.dart';

Row profileItem(IconData icon, Color iconColor, String text) => Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: iconColor,
        ),
        const SizedBox(width: PaddingConstants.PADDING_2XS),
        Text(
          text,
          style: const TextStyle(
              fontSize: TextConstants.TEXT_SMALL,
              fontWeight: FontWeight.w400,
              color: Colors.grey),
        ),
      ],
    );
