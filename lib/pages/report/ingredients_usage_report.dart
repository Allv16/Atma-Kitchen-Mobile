import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/pages/report/controllers/ingredients_usage_report_controller.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngredientsUsageReport extends StatelessWidget {
  final controller = Get.put(IngredientsUsageReportController());
  IngredientsUsageReport({super.key});

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
                  "Ingredients Usage Report",
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
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: dateToString(
                                  controller.selectedDate.value.start),
                              style: const TextStyle(
                                  fontSize: TextConstants.TEXT_SMALL,
                                  color: Colors.black)),
                          const TextSpan(
                              text: ' - ',
                              style: TextStyle(
                                  fontSize: TextConstants.TEXT_SMALL,
                                  color: Colors.black)),
                          TextSpan(
                              text: dateToString(
                                  controller.selectedDate.value.end),
                              style: const TextStyle(
                                  fontSize: TextConstants.TEXT_SMALL,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          DateTimeRange? selectedDateRange =
                              await showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime.now(),
                                  initialDateRange:
                                      controller.selectedDate.value);
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
                else if (controller.ingredientsUsage.value.isEmpty)
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
                              child: Text('Ingredients Name'),
                            )),
                            TableCell(
                                child: Padding(
                              padding:
                                  EdgeInsets.all(PaddingConstants.PADDING_XS),
                              child: Text('Usage'),
                            )),
                          ]),
                      ...controller.ingredientsUsage.value
                          .map((e) => TableRow(
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          PaddingConstants.PADDING_XS),
                                      child: Text(e.ingredient!.name!),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          PaddingConstants.PADDING_XS),
                                      child: Text(
                                          '${e.usage} ${e.ingredient!.unit}'),
                                    ),
                                  ),
                                ],
                              ))
                          .toList(),
                    ],
                  )
              ],
            ),
          )),
    );
  }
}
