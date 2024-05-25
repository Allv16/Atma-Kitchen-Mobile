import 'package:atma_kitchen/core/services/http_services.dart';
import 'package:atma_kitchen/models/auth/api_response.dart';
import 'package:atma_kitchen/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  //form
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController labelAddressController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  //Services
  HTTPService httpService = Get.find<HTTPService>();

  RxBool loading = false.obs;
  RxBool obscureText = true.obs;

  Future<bool?> isUsernameAvailable() async {
    loading.value = true;

    var response = await httpService
        .get("auth/usermame/is-available/${usernameController.text}");

    BaseApiResponse apiResponse = BaseApiResponse.fromJson(response);

    loading.value = false;

    if (!apiResponse.success!) {
      errorSnackBar(
          "Username already taken", "please change the username", () {});
    }

    return apiResponse.success;
  }

  Future<bool?> isEmailAvailable() async {
    loading.value = true;

    var response = await httpService
        .get("auth/email/is-available/${emailController.text}");

    BaseApiResponse apiResponse = BaseApiResponse.fromJson(response);

    loading.value = false;

    if (!apiResponse.success!) {
      errorSnackBar("Email already taken", "please change the Email", () {});
    }

    return apiResponse.success;
  }

  Future<BaseApiResponse> register() async {
    loading.value = true;

    if (titleController.text == "Mr.") {
      titleController.text = "Laki-laki";
    } else {
      titleController.text = "Perempuan";
    }

    var response = await httpService.post("register", {
      "username": usernameController.text,
      "password": passwordController.text,
      "email": emailController.text,
      "name": fullNameController.text,
      "phone": phoneController.text,
      "addressLabel": labelAddressController.text,
      "address": addressController.text,
      "birthDate": DateFormat('yyyy-MM-dd').format(DateTime.parse(
          DateFormat('dd MMM yyyy')
              .parse(birthDateController.text)
              .toString())),
      "gender": titleController.text
    });
    BaseApiResponse apiResponse = BaseApiResponse.fromJson(response);
    loading.value = false;
    return apiResponse;
  }

  Future<BaseApiResponse> resendEmail() async {
    loading.value = true;
    var response =
        await httpService.get("email/resend/${emailController.text}");
    BaseApiResponse apiResponse = BaseApiResponse.fromJson(response);
    loading.value = false;
    return apiResponse;
  }
}
