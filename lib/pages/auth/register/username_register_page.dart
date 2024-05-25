import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/auth/controllers/register_controller.dart';
import 'package:atma_kitchen/pages/auth/register/email_register_page.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:atma_kitchen/widgets/form/form_field.dart';
import 'package:atma_kitchen/widgets/form/form_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

//TODO Implements username is unique
class UsernameRegisterPage extends StatelessWidget {
  final RegisterController controller = Get.find();
  UsernameRegisterPage({super.key});

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
                  formTitle(context, "What’s do you want to be called?"),
                  const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                  baseFormFieldValidator(
                      controller: controller.usernameController,
                      hintText: "Enter username",
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Full name cannot be empty';
                        }
                        if (value.length < 3) {
                          return 'Full name must be at least 3 characters';
                        }
                        if (value.length > 30) {
                          return 'Full name must be less than 30 characters';
                        }
                        return null;
                      }),
                  const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                  formHint(context,
                      "This is how it’ll appear on your profile and used to login. Make sure to remember it for your login credentials."),
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
                  var isUsernameAvailable =
                      await controller.isUsernameAvailable();
                  if (isUsernameAvailable != null && isUsernameAvailable) {
                    Get.to(() => EmailRegisterPage());
                  }
                }
              },
              isLoading: controller.loading.value),
        ),
      ),
    );
  }
}
