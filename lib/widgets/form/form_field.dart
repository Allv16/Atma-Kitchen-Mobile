import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

TextFormField baseFormField(
    {required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: IconButton(
        onPressed: () {
          controller.clear();
        },
        icon: const Icon(Icons.cancel_outlined),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      return null;
    },
  );
}

TextFormField basePasswordFormField(
    {required TextEditingController controller,
    required String hintText,
    required bool isObscureText,
    required Function() onPressed,
    TextInputType keyboardType = TextInputType.emailAddress}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: keyboardType,
    obscureText: isObscureText,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: IconButton(
        onPressed: onPressed,
        icon: Icon(isObscureText
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      if (value.length < 5) {
        return 'Password must be at least 5 characters';
      }

      return null;
    },
  );
}

DropdownButtonFormField baseDropdownFormField<T>({
  required List<T> items,
  required T value,
  required Function(T?) onChanged,
}) {
  return DropdownButtonFormField<T>(
    value: value,
    items: items
        .map((e) => DropdownMenuItem<T>(
              value: e,
              child: Text(e.toString()),
            ))
        .toList(),
    onChanged: onChanged,
  );
}

TextFormField baseEmailFormField({
  required TextEditingController controller,
  required String hintText,
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: IconButton(
        onPressed: () {
          controller.clear();
        },
        icon: const Icon(Icons.cancel_outlined),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      if (!value.contains('@')) {
        return 'Please enter a valid email address';
      }
      return null;
    },
  );
}

TextFormField baseFormFieldValidator(
    {required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    FormFieldValidator<String>? validator}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: IconButton(
        onPressed: () {
          controller.clear();
        },
        icon: const Icon(Icons.cancel_outlined),
      ),
    ),
    validator: validator,
  );
}

TextFormField baseDatePickerField({
  required TextEditingController controller,
  required String hintText,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextFormField(
    readOnly: true,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: IconButton(
        onPressed: () {
          controller.clear();
        },
        icon: const Icon(Icons.cancel_outlined),
      ),
    ),
    onTap: () async {
      DateTime? date = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (date != null) {
        controller.text = DateFormat('dd MMM yyyy').format(date);
      }
    },
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      return null;
    },
  );
}
