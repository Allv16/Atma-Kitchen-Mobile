import 'package:atma_kitchen/pages/auth/profile_page.dart';
import 'package:atma_kitchen/pages/main_screen/main_screen_controller.dart';
import 'package:atma_kitchen/pages/products/home_page.dart';
import 'package:atma_kitchen/pages/products/order_list_page.dart';
import 'package:atma_kitchen/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.put(MainScreenController());
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            HomePage(),
            OrderListPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(context, controller),
    );
  }
}
