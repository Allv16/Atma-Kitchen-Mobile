import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

dangerConfirmationDialog(
    String title, String middleText, Function() onConfirm) {
  return Get.defaultDialog(
      title: title,
      middleText: middleText,
      textCancel: 'Cancel',
      textConfirm: 'Confirm',
      buttonColor: AppColors.error,
      cancelTextColor: AppColors.error,
      titlePadding:
          const EdgeInsets.only(top: PaddingConstants.PADDING_DEFAULT),
      titleStyle: TextStyle(
        color: AppColors.black,
        fontSize: TextConstants.TEXT_XL,
        fontWeight: FontWeight.w500,
      ),
      onConfirm: onConfirm);
}

defaultConfirmationDialog(
    String title, String middleText, Function() onConfirm) {
  return Get.defaultDialog(
      title: title,
      middleText: middleText,
      textCancel: 'Cancel',
      textConfirm: 'Confirm',
      buttonColor: AppColors.kPrimaryLight,
      cancelTextColor: AppColors.kPrimaryLight,
      titlePadding:
          const EdgeInsets.only(top: PaddingConstants.PADDING_DEFAULT),
      titleStyle: TextStyle(
        color: AppColors.black,
        fontSize: TextConstants.TEXT_XL,
        fontWeight: FontWeight.w500,
      ),
      onConfirm: onConfirm);
}
