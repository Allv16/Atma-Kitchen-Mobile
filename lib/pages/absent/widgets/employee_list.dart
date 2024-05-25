import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/models/absent/absent.dart';
import 'package:atma_kitchen/models/absent/employee.dart';
import 'package:atma_kitchen/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ListTile employeeList(Employee employee, Function() onAbsent) {
  return ListTile(
    leading: const Icon(Icons.person),
    visualDensity: const VisualDensity(vertical: -3),
    title: Text(
      employee.name!,
      textAlign: TextAlign.left,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    trailing: const Icon(
      Icons.chevron_right_outlined,
      size: 24,
    ),
    horizontalTitleGap: 12,
    onTap: () => {
      defaultConfirmationDialog(
        'Confirm Absent',
        'Are you sure to absent ${employee.name!}?',
        () => {
          onAbsent(),
          Get.back(),
        },
      ),
    },
  );
}

ListTile employeeAbsentList(Absent absent, Function() onDeleteAbsent) {
  return ListTile(
    leading: Icon(
      Icons.person_remove,
      color: AppColors.errorSurface,
    ),
    visualDensity: const VisualDensity(vertical: -3),
    title: Text(
      absent.employee!.name!,
      textAlign: TextAlign.left,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    trailing: const Icon(
      Icons.close,
      size: 24,
    ),
    horizontalTitleGap: 12,
    onTap: () => {
      dangerConfirmationDialog(
        'Confirm Absent',
        'Are you sure to cancel absent ${absent.employee!.name!}?',
        () => {
          onDeleteAbsent(),
          Get.back(),
        },
      ),
    },
  );
}
