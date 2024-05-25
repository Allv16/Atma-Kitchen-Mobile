import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:flutter/material.dart';

Container navigationPill(bool isActive) {
  return Container(
    width: 32,
    height: 8,
    decoration: BoxDecoration(
      borderRadius:
          const BorderRadius.all(Radius.circular(RadiusConstants.RADIUS_SMALL)),
      color: isActive ? AppColors.kPrimary : Colors.grey,
    ),
  );
}
