import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/auth/controllers/register_controller.dart';
import 'package:atma_kitchen/pages/auth/register/password_register_page.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:atma_kitchen/widgets/form/form_field.dart';
import 'package:atma_kitchen/widgets/form/form_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class AddressRegisterPage extends StatelessWidget {
  final RegisterController controller = Get.find();
  AddressRegisterPage({super.key});

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
                formTitle(context, "What's your detail delivery address?"),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                baseFormFieldValidator(
                    controller: controller.labelAddressController,
                    hintText: "Address label (ex: Home, Office, etc)",
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Address label cannot be empty';
                      }
                      if (value.length < 3) {
                        return 'Address label must be at least 3 characters';
                      }
                      return null;
                    }),
                baseFormFieldValidator(
                    controller: controller.addressController,
                    hintText: "Address detail (ex: Main street, 123A...)",
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Address label cannot be empty';
                      }
                      if (value.length < 3) {
                        return 'Address label must be at least 3 characters';
                      }
                      return null;
                    }),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                formHint(context,
                    "We will deliver the goods to your front door, so we need your detailed address. No worries we kept your address to our self."),
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
              Get.to(() => PasswordRegisterPage());
            }
          },
        ),
      ),
    );
  }
}
