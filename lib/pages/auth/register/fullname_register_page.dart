import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/auth/controllers/register_controller.dart';
import 'package:atma_kitchen/pages/auth/register/username_register_page.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:atma_kitchen/widgets/form/form_field.dart';
import 'package:atma_kitchen/widgets/form/form_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class FullNameRegisterPage extends StatelessWidget {
  final controller = Get.put(RegisterController());
  FullNameRegisterPage({super.key});

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
                formTitle(context, "What's your full name?"),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                baseDropdownFormField(
                  items: ["Mr.", "Mrs.", "Ms."],
                  value: "Mr.",
                  onChanged: (value) {
                    controller.titleController.text = value!;
                  },
                ),
                baseFormFieldValidator(
                    controller: controller.fullNameController,
                    hintText: "Enter full name",
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
                      if (value.contains(RegExp(r'[0-9]'))) {
                        return 'Full name cannot contain numbers';
                      }
                      if (value.contains(RegExp(r'[^a-zA-Z\s]'))) {
                        return 'Full name cannot contain symbols';
                      }
                      return null;
                    }),
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
          context: context,
          text: 'Next',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Get.to(() => UsernameRegisterPage());
            }
          },
        ),
      ),
    );
  }
}
