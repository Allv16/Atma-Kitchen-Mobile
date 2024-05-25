import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/models/auth/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController emailController = TextEditingController();
  HTTPService httpService = Get.find<HTTPService>();

  Future<BaseApiResponse> sendEmail() async {
    loading.value = true;
    var response = await httpService
        .post("reset-password", {"email": emailController.text});
    BaseApiResponse forgotPasswordResponse = BaseApiResponse.fromJson(response);
    loading.value = false;
    return forgotPasswordResponse;
  }
}
