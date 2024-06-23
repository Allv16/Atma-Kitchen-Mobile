import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/pages/auth/widgets/baseListTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerMainScreen extends StatelessWidget {
  const OwnerMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Welcome, Owner of Atma Kitchen',
            style: TextStyle(
                fontSize: TextConstants.TEXT_DEFAULT,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            baseListTile(Icons.list_alt, 'Income & Expenses Report', true, () {
              Get.toNamed(RoutesName.incomeExpenseReport);
            }),
            baseListTile(Icons.inventory, 'Ingredients Usage Report', true, () {
              Get.toNamed(RoutesName.ingredientsUsageReport);
            }),
            baseListTile(Icons.inventory, 'Ingredients Stock Report', true, () {
              Get.toNamed(RoutesName.ingredientStock);
            }),
          ],
        ));
  }
}
