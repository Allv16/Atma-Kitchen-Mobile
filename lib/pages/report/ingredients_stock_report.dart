import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/report/controllers/ingredients_stock_report.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngredientsStockReport extends StatelessWidget {
  final controller = Get.put(IngredientStockReportController());
  IngredientsStockReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: emptyAppBar(context),
          body: Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingConstants.PADDING_DEFAULT,
                  vertical: PaddingConstants.PADDING_MEDIUM,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ingredients Stocks Report",
                      style: TextStyle(
                          fontSize: TextConstants.TEXT_LARGE,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                    const Text(
                      "Period:",
                      style: TextStyle(
                          fontSize: TextConstants.TEXT_SMALL,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                    if (controller.isLoading.value)
                      const Center(child: CircularProgressIndicator())
                    else if (controller.ingredientStock.value.isEmpty)
                      const Center(
                        child: Text('No Data Found'),
                      )
                    else
                      Table(
                        border: TableBorder.all(),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          const TableRow(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              children: [
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(
                                      PaddingConstants.PADDING_XS),
                                  child: Text('Ingredients Name'),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: EdgeInsets.all(
                                      PaddingConstants.PADDING_XS),
                                  child: Text('Stocks'),
                                )),
                              ]),
                          ...controller.ingredientStock.value
                              .map((e) => TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              PaddingConstants.PADDING_XS),
                                          child: Text(e.name!),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              PaddingConstants.PADDING_XS),
                                          child: Text('${e.stock} ${e.unit}'),
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ],
                      )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
