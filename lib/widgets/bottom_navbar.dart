import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/pages/main_screen/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Obx bottomNavBar(BuildContext context, MainScreenController controller) {
  return Obx(
    () => NavigationBar(
      selectedIndex: controller.currentIndex.value,
      onDestinationSelected: controller.changeIndex,
      animationDuration: const Duration(milliseconds: 800),
      indicatorColor: AppColors.kPrimaryLighter,
      destinations: [
        NavigationDestination(
          icon: Icon(controller.currentIndex.value == 0
              ? Icons.home
              : Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(controller.currentIndex.value == 1
              ? Icons.receipt_long
              : Icons.receipt_long_outlined),
          label: 'Order',
        ),
        NavigationDestination(
          icon: Icon(controller.currentIndex.value == 2
              ? Icons.account_circle
              : Icons.account_circle_outlined),
          label: 'Profile',
        ),
      ],
    ),
  );
}
