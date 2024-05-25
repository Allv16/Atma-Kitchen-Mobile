import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/widgets/pill.dart';
import 'package:flutter/material.dart';

ListView filterList(List<String> filters, {int selectedIndex = 2}) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.fast),
    itemCount: filters.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingConstants.PADDING_2XS),
        child: filterPill(filters[index], isSelected: index == selectedIndex),
      );
    },
  );
}
