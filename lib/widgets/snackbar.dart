import 'package:atma_kitchen/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

successSnackBar(String title, String message, Function callback) =>
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.kPrimaryLight,
      colorText: AppColors.white,
      borderWidth: 1,
      borderColor: AppColors.white,
      icon: Icon(
        Icons.notifications_outlined,
        color: AppColors.white,
      ),
    ).future.whenComplete(() => callback());

errorSnackBar(String title, String message, Function callback) => Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.error,
      colorText: AppColors.white,
      icon: Icon(
        Icons.warning_outlined,
        color: AppColors.white,
      ),
    ).future.then((value) => callback());
