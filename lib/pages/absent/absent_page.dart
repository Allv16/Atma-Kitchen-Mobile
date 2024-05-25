import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/pages/absent/controllers/absent_controller.dart';
import 'package:atma_kitchen/pages/absent/widgets/employee_list.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbsentPage extends StatelessWidget {
  final controller = Get.put(AbsentController());
  AbsentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: searchAppBar(
            context, 'Search Karyawan to Absent', controller.filterEmployee),
        body: controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.event_busy),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: dateTimeToDay(controller.selectedDate.value),
                            style: TextStyle(
                              fontSize: TextConstants.TEXT_DEFAULT,
                              color: AppColors.kPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                        text: 'Employee Absent on ',
                        style: const TextStyle(
                          fontSize: TextConstants.TEXT_SMALL,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: PaddingConstants.PADDING_DEFAULT),
                    trailing: const Icon(Icons.expand_more_outlined,
                        size: 24, color: Colors.black),
                    horizontalTitleGap: 12,
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: Get.context!,
                        initialDate: controller.selectedDate.value,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        controller.selectedDate.value = date;
                        controller.getAbsent();
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: controller.absents.value.isNotEmpty
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.absents.value.length,
                            itemBuilder: (context, index) {
                              return employeeAbsentList(
                                  controller.absents.value[index],
                                  () => controller.deleteAbsent(
                                      controller.absents.value[index].id!));
                            })
                        : const Center(
                            child: Text('No Absent on this Date',
                                style: TextStyle(
                                  fontSize: TextConstants.TEXT_SMALL,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ))),
                  ),
                  const SizedBox(height: PaddingConstants.PADDING_MEDIUM),
                  Divider(
                    color: AppColors.kPrimaryLighter,
                    thickness: 14,
                  ),
                  const SizedBox(height: PaddingConstants.PADDING_MEDIUM),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: PaddingConstants.PADDING_DEFAULT),
                    child: Text(
                      "Select Employee to Absent",
                      style: TextStyle(
                        fontSize: TextConstants.TEXT_DEFAULT,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.employees.value.length,
                    itemBuilder: (context, index) {
                      return employeeList(
                          controller.employees.value[index],
                          () => controller.absentEmployee(
                              controller.employees.value[index].id!));
                    },
                  )),
                ],
              ),
      ),
    );
  }
}
