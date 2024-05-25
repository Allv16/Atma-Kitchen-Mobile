import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:flutter/material.dart';

FilterChip filterPill(String text, {bool isSelected = false}) {
  return FilterChip(
    showCheckmark: false,
    shape: StadiumBorder(side: BorderSide(color: AppColors.grey, width: 1)),
    label: Text(
      text,
      style: TextStyle(
          color: isSelected ? AppColors.white : AppColors.black,
          fontSize: TextConstants.TEXT_XS),
    ),
    selected: isSelected,
    selectedColor: AppColors.kPrimaryLight,
    backgroundColor: AppColors.grey,
    onSelected: (value) {
      print(value);
    },
  );
}

Container statusPill(String text) {
  Color color = AppColors.success;
  Color textColor = AppColors.kPrimary;
  switch (text) {
    case 'On Process':
      color = AppColors.warning;
      textColor = AppColors.kSecondary;
      break;
    case 'Completed':
      color = AppColors.kPrimaryLighter;
      textColor = AppColors.kPrimary;
      break;
    case 'Cancelled':
      color = AppColors.error;
      textColor = AppColors.errorSurface;
      break;
    default:
      null;
  }
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: PaddingConstants.PADDING_SMALL,
        vertical: PaddingConstants.PADDING_2XS),
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(RadiusConstants.RADIUS_XS)),
    child: Text(
      text,
      style: TextStyle(fontSize: TextConstants.TEXT_XS, color: textColor),
    ),
  );
}

Container secondaryPill(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: PaddingConstants.PADDING_SMALL,
        vertical: PaddingConstants.PADDING_2XS),
    decoration: BoxDecoration(
        color: AppColors.warning,
        borderRadius: BorderRadius.circular(RadiusConstants.RADIUS_XS)),
    child: Text(
      text,
      style: TextStyle(
          fontSize: TextConstants.TEXT_XS, color: AppColors.kSecondary),
    ),
  );
}
