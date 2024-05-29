import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          ? RoutesName.login
          : RoutesName.onboarding1,
      initialBinding: InitBindings(),
    );
  }
}

class FlutterStausBarUtils {}
