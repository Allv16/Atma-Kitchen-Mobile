import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final box = GetStorage();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.kPrimary,
            primary: AppColors.kPrimary,
            secondary: AppColors.kSecondary,
            surface: AppColors.white,
            background: AppColors.white,
            error: AppColors.error,
          ),
          useMaterial3: true),
      getPages: appRoutes,
      initialRoute: box.read('boarding') == true
          ? RoutesName.mainScreen
          : RoutesName.onboarding1,
      initialBinding: InitBindings(),
    );
  }
}

class FlutterStausBarUtils {}
