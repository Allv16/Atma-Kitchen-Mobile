import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("7f750883-546a-4133-bb4e-319257eb5bfe");
  OneSignal.Notifications.requestPermission(true);

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
          ? RoutesName.login
          : RoutesName.onboarding1,
      initialBinding: InitBindings(),
    );
  }
}

