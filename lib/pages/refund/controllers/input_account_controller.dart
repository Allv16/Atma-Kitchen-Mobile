import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/pages/refund/controllers/refund_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InputAccountController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  RxBool isLoading = false.obs;
  TextEditingController accountNoController = TextEditingController();

  void createRefund() {
    isLoading = true.obs;

    httpService
        .post(
            'withdraw-request/${box.read("customer_id")}',
            {
              'nomor_rekening_tujuan': accountNoController.text,
            },
            token: box.read('token'))
        .then((response) {
      isLoading = false.obs;
      if (response != null) {
        Get.snackbar('Success', 'Refund request has been sent',
            backgroundColor: AppColors.kPrimaryLight,
            colorText: AppColors.white);
      }
    });

    isLoading = false.obs;
    onComplete();
  }

  void onComplete() {
    final RefundController refundController = Get.find();
    refundController.onRefresh();
    Get.back();
  }
}
