import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/models/auth/api_response.dart';
import 'package:atma_kitchen/pages/auth/controllers/forget_password_controller.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:atma_kitchen/widgets/form/form_field.dart';
import 'package:atma_kitchen/widgets/form/form_text.dart';
import 'package:atma_kitchen/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class ForgetPasswordPage extends StatelessWidget {
  final controller = Get.put(ForgetPasswordController());

  ForgetPasswordPage({super.key});

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
                  formTitle(context, 'Forgot Your password?'),
                  const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                  baseEmailFormField(
                    controller: controller.emailController,
                    hintText: "Enter your email address",
                  ),
                  const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                  formHint(context,
                      'We will send you a link to your email address to reset your password'),
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
              context: context,
              text: 'Send Email',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  BaseApiResponse response = await controller.sendEmail();
                  if (response.success!) {
                    await successSnackBar("Reset password email sent",
                        "Please check your email to reset your passwored", () {
                      Get.offNamed(RoutesName.login);
                    });
                  } else {
                    errorSnackBar("Reset password failed", response.message!,
                        () {
                      Get.back();
                    });
                  }
                }
              },
              isLoading: controller.loading.value),
        ),
      ),
    );
  }
}
