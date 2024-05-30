import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/models/auth/api_response.dart';
import 'package:atma_kitchen/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  HTTPService httpService = Get.find<HTTPService>();
  final box = GetStorage();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    usernameController.text = 'vivi';
    passwordController.text = '12345';
    super.onInit();
  }

  void login() async {
    loading.value = true;

    var response = await httpService.post('login', {
      'username': usernameController.text,
      'password': passwordController.text
    });
    LoginResponse loginResponse = LoginResponse.fromJson(response);
    if (loginResponse.success!) {
      box.write('token', loginResponse.token);
      successSnackBar("Login Success", 'Redirecting shortly..', () {
        switch (loginResponse.user!.roleId) {
          case 1:
            Get.offAllNamed(RoutesName.report);
            break;
          case 3:
            Get.offAllNamed(RoutesName.absent);
            break;
          case 4:
            box.write("customer_id", loginResponse.user!.customer!.id);
            Get.offAllNamed(RoutesName.mainScreen);
            break;
        }
      });
    } else {
      errorSnackBar('Login Failed', loginResponse.message!, () {});
    }

    loading.value = false;
  }
}
