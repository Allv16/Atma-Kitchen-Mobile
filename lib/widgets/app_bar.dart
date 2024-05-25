import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar emptyAppBar(BuildContext context) {
  return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      ));
}

AppBar searchAppBar(
    BuildContext context, String title, Function(String) onSearch) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: TextField(
      onChanged: (value) {
        onSearch(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: title,
      ),
    ),
  );
}
