import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/models/auth/api_response.dart';
import 'package:atma_kitchen/pages/auth/controllers/register_controller.dart';
import 'package:atma_kitchen/pages/auth/register/success_register_page.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:atma_kitchen/widgets/form/form_field.dart';
import 'package:atma_kitchen/widgets/form/form_text.dart';
import 'package:atma_kitchen/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class PasswordRegisterPage extends StatelessWidget {
  final RegisterController controller = Get.find();
  PasswordRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: emptyAppBar(context),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingConstants.PADDING_DEFAULT),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  formTitle(context, "What's your password?"),
                  const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                  basePasswordFormField(
                    controller: controller.passwordController,
                    hintText: "Enter password",
                    keyboardType: TextInputType.text,
                    isObscureText: controller.obscureText.value,
                    onPressed: () {
                      controller.obscureText.value =
                          !controller.obscureText.value;
                    },
                  ),
                  const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                  formHint(context,
                      "This is how it’ll appear on your profile and shown when you make an order."),
                ],
              ),
            )),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: PaddingConstants.PADDING_DEFAULT,
              right: PaddingConstants.PADDING_DEFAULT,
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  PaddingConstants.PADDING_2XL),
          child: primaryFilledButton(
            isLoading: controller.loading.value,
            context: context,
            text: 'Register',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                BaseApiResponse response = await controller.register();
                if (response.success!) {
                  Get.offAll(() => SuccessRegisterPage());
                } else {
                  errorSnackBar("Register Failed", response.message!, () {});
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
