import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/auth/controllers/register_controller.dart';
import 'package:atma_kitchen/pages/auth/register/address_register_page.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:atma_kitchen/widgets/form/form_field.dart';
import 'package:atma_kitchen/widgets/form/form_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class BirtdayRegisterPage extends StatelessWidget {
  final RegisterController controller = Get.find();
  BirtdayRegisterPage({super.key});

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
                formTitle(context, "What’s your birth day?"),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                baseDatePickerField(
                  controller: controller.birthDateController,
                  hintText: "Enter Birth Date",
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                formHint(context,
                    "We need your birth date so we can give you special discount on your birthday, so you can enjoy your special day more exciting."),
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
              Get.to(() => AddressRegisterPage());
            }
          },
        ),
      ),
    );
  }
}
