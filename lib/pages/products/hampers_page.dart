import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/products/controllers/hampers_controller.dart';
import 'package:atma_kitchen/pages/products/widgets/hampers_card.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HampersPage extends StatelessWidget {
  final controller = Get.put(HampersController());
  HampersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: emptyAppBar(context),
        body: Expanded(
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                  horizontal: PaddingConstants.PADDING_DEFAULT),
              child: controller.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hampers",
                          style: TextStyle(
                            fontSize: TextConstants.TEXT_LARGE,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: PaddingConstants.PADDING_SMALL,
                              mainAxisSpacing: PaddingConstants.PADDING_SMALL,
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .width /
                                  (MediaQuery.of(context).size.height / 1.4),
                            ),
                            itemCount: controller.hampers.value.length,
                            itemBuilder: (context, index) {
                              return hampersCard(
                                  context, controller.hampers.value[index]);
                            }),
                      ],
                    )),
        ),
      ),
    );
  }
}
