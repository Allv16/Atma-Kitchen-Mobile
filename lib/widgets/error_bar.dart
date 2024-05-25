import 'package:atma_kitchen/core/constants.dart';
import 'package:flutter/material.dart';

Widget errorBar(String message, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(RadiusConstants.RADIUS_DEFAULT),
      color: Theme.of(context).colorScheme.error,
    ),
    padding: const EdgeInsets.symmetric(
        horizontal: PaddingConstants.PADDING_DEFAULT,
        vertical: PaddingConstants.PADDING_SMALL),
    child: Row(
      children: [
        const Icon(Icons.error_outline),
        const SizedBox(width: PaddingConstants.PADDING_XS),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
