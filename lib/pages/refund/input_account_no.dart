import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/refund/controllers/input_account_controller.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:atma_kitchen/widgets/form/form_field.dart';
import 'package:atma_kitchen/widgets/form/form_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class InputAccountNo extends StatelessWidget {
  final controller = Get.put(InputAccountController());
  InputAccountNo({super.key});

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
                formTitle(context, "What's your bank account number?"),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                baseFormFieldValidator(
                    controller: controller.accountNoController,
                    hintText: "Account Number",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Account number cannot be empty';
                      }
                      return null;
                    }),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                formHint(context,
                    "We will use this account number to send your withdrawal. Make sure it's correct."),
              ],
            ),
          )),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: PaddingConstants.PADDING_DEFAULT,
              right: PaddingConstants.PADDING_DEFAULT,
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  PaddingConstants.PADDING_2XL),
          child: FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.createRefund();
              }
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  const Size(double.infinity, HeightConstants.BUTTON_HEIGHT)),
            ),
            child: controller.isLoading.value
                ? const CircularProgressIndicator()
                : const Text("Submit"),
          )),
    );
  }
}
