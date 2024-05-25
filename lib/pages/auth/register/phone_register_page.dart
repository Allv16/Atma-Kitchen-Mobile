import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/auth/controllers/register_controller.dart';
import 'package:atma_kitchen/pages/auth/register/birtday_register_page.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:atma_kitchen/widgets/form/form_field.dart';
import 'package:atma_kitchen/widgets/form/form_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class PhoneRegisterScreen extends StatelessWidget {
  final RegisterController controller = Get.find();
  PhoneRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(context),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingConstants.PADDING_DEFAULT),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formTitle(context, "What’s your phone number?"),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                baseFormFieldValidator(
                  controller: controller.phoneController,
                  hintText: "Enter Phone Number",
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number cannot be empty';
                    }
                    if (value.length < 10) {
                      return 'Phone number must be at least 10 characters';
                    }
                    if (value.length > 13) {
                      return 'Phone number must be less than 13 characters';
                    }
                    if (value.contains(RegExp(r'[a-zA-Z]'))) {
                      return 'Phone number cannot contain letters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                formHint(context,
                    "Phone number will be used to ensure our communication. For example when we send our delivery, the courier may need your further details of location."),
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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Get.to(() => BirtdayRegisterPage());
            }
          },
        ),
      ),
    );
  }
}
