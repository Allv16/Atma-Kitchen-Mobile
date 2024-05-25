import 'package:atma_kitchen/core/constants.dart';
import 'package:flutter/material.dart';

ListTile baseListTile(
        IconData prefixIcon, String text, bool isTrailing, Function() ontap) =>
    ListTile(
      leading: Icon(prefixIcon),
      visualDensity: const VisualDensity(vertical: -3),
      title: Text(
        text,
        textAlign: TextAlign.left,
      ),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: PaddingConstants.PADDING_DEFAULT),
      trailing: isTrailing
          ? const Icon(
              Icons.chevron_right_outlined,
              size: 24,
            )
          : null,
      horizontalTitleGap: 12,
      onTap: () => {ontap()},
    );
