import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/products/controllers/transaction_controller.dart';
import 'package:atma_kitchen/pages/products/widgets/order_card.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListPage extends StatelessWidget {
  final controller = Get.put(TransactionController());
  OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: searchAppBar(
              context, 'Search Products', controller.filterTransaction),
          body: Column(
            children: [
              // SizedBox(
              //     height: 50,
              //     child: filterList([
              //       'All',
              //       'Pending',
              //       'Completed',
              //       'Cancelled',
              //       'asdsdas',
              //       'asdasdasdf',
              //       'adavasd'
              //     ])),
              controller.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: PaddingConstants.PADDING_DEFAULT,
                              vertical: PaddingConstants.PADDING_SMALL),
                          itemCount: controller.result.value.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                orderCard(
                                    context, controller.result.value[index]),
                                const SizedBox(
                                  height: PaddingConstants.PADDING_SMALL,
                                )
                              ],
                            );
                          }),
                    ),
            ],
          )),
    );
  }
}
