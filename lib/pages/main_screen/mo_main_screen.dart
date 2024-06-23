import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/pages/auth/widgets/baseListTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoMainScreen extends StatelessWidget {
  const MoMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Welcome, Manager of Operations',
            style: TextStyle(
                fontSize: TextConstants.TEXT_DEFAULT,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            baseListTile(Icons.person, 'Employee Attendance', true, () {
              Get.toNamed(RoutesName.absent);
            }),
            baseListTile(Icons.inventory, 'Ingredients Usage Report', true, () {
              Get.toNamed(RoutesName.ingredientsUsageReport);
            }),
            baseListTile(Icons.soup_kitchen, 'Ingredients Stock Report', true,
                () {
              Get.toNamed(RoutesName.ingredientStock);
            }),
            baseListTile(Icons.book, 'Income & Expense Report', true, () {
              Get.toNamed(RoutesName.incomeExpenseReport);
            }),
          ],
        ));
  }
}
