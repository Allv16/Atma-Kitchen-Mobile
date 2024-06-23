import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/pages/report/controllers/income_expense_report_controller.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class IncomeExpenseReport extends StatelessWidget {
  final controller = Get.put(IncomeExpenseReportController());
  IncomeExpenseReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: emptyAppBar(context),
        body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingConstants.PADDING_DEFAULT,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Income & Expense Report",
                  style: TextStyle(
                      fontSize: TextConstants.TEXT_LARGE,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                const Text(
                  "Period:",
                  style: TextStyle(
                      fontSize: TextConstants.TEXT_SMALL, color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                        DateFormat('MMM yyyy')
                            .format(controller.selectedDate.value),
                        style: const TextStyle(
                            fontSize: TextConstants.TEXT_DEFAULT,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    IconButton(
                        onPressed: () async {
                          DateTime? selectedDateRange = await showDatePicker(
                              context: context,
                              initialDate: controller.selectedDate.value,
                              firstDate: DateTime(2015),
                              lastDate: DateTime(2100));
                          if (selectedDateRange != null) {
                            controller.selectedDate.value = selectedDateRange;
                            controller.fetchReport();
                          }
                        },
                        padding: const EdgeInsets.symmetric(
                            horizontal: PaddingConstants.PADDING_XS),
                        icon: const Icon(Icons.arrow_drop_down_circle_rounded))
                  ],
                ),
                const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                if (controller.isLoading.value)
                  const Center(child: CircularProgressIndicator())
                else if (controller.incomeExpense.value.isEmpty)
                  const Center(
                    child: Text('No Data Found'),
                  )
                else
                  Table(
                    border: TableBorder.all(),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      const TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          children: [
                            TableCell(
                                child: Padding(
                              padding:
                                  EdgeInsets.all(PaddingConstants.PADDING_XS),
                              child: Text('Type'),
                            )),
                            TableCell(
                                child: Padding(
                              padding:
                                  EdgeInsets.all(PaddingConstants.PADDING_XS),
                              child: Text('Income'),
                            )),
                            TableCell(
                                child: Padding(
                              padding:
                                  EdgeInsets.all(PaddingConstants.PADDING_XS),
                              child: Text('Expense'),
                            )),
                          ]),
                      ...controller.incomeExpense.value
                          .map((e) => TableRow(
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          PaddingConstants.PADDING_XS),
                                      child: Text(e.type!),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          PaddingConstants.PADDING_XS),
                                      child: Text(
                                          currencyFormat(e.income!.toDouble())),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          PaddingConstants.PADDING_XS),
                                      child: Text(currencyFormat(
                                          e.expense!.toDouble())),
                                    ),
                                  ),
                                ],
                              ))
                          .toList(),
                    ],
                  )
              ],
            )),
      ),
    );
  }
}
