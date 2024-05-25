import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/auth/controllers/register_controller.dart';
import 'package:atma_kitchen/pages/auth/register/phone_register_page.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:atma_kitchen/widgets/form/form_field.dart';
import 'package:atma_kitchen/widgets/form/form_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class EmailRegisterPage extends StatelessWidget {
  final RegisterController controller = Get.find();
  EmailRegisterPage({super.key});

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
                  formTitle(context, "What’s your email address?"),
                  const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                  baseEmailFormField(
                    controller: controller.emailController,
                    hintText: "Enter email address",
                  ),
                  const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                  formHint(context,
                      "We’ll text you a code to verify if you’re really you. Also email can be used to recover your account incase you forgot your password."),
                  const SizedBox(height: PaddingConstants.PADDING_2XS),
                  formHintBold(context, "Can't change it later.")
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
              text: 'Next',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var isEmailAvaialble = await controller.isEmailAvailable();
                  if (isEmailAvaialble != null && isEmailAvaialble) {
                    Get.to(() => PhoneRegisterScreen());
                  }
                }
              },
              isLoading: controller.loading.value),
        ),
      ),
    );
  }
}
