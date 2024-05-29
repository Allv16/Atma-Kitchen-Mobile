import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/pages/products/breads_page.dart';
import 'package:atma_kitchen/pages/products/cakes_page.dart';
import 'package:atma_kitchen/pages/products/controllers/prodcut_controller.dart';
import 'package:atma_kitchen/pages/products/drinks_page.dart';
import 'package:atma_kitchen/pages/products/hampers_page.dart';
import 'package:atma_kitchen/pages/products/snacks_page.dart';
import 'package:atma_kitchen/pages/products/widgets/category_card.dart';
import 'package:atma_kitchen/pages/products/widgets/product_card.dart';
import 'package:atma_kitchen/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(ProductController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar:
              searchAppBar(context, 'Search Porduct', controller.filterProduct),
          body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: PaddingConstants.PADDING_DEFAULT),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.calendar_today,
                      color: AppColors.kPrimary,
                      size: 16,
                    ),
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
                        text: 'Order on ',
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
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 30),
                          ));
                      if (date != null) {
                        controller.selectedDate.value = date;
                        controller.getProducts();
                      }
                    },
                  ),
                  controller.loading.value ||
                          controller.topProductsloading.value
                      ? const Center(child: CircularProgressIndicator())
                      : _buildContent(context, controller),
                ],
              ))),
    );
  }
}

Widget _buildContent(BuildContext context, ProductController controller) {
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              categoryCard('Cakes', 'assets/images/product/cakeClean.png', () {
                Get.to(() => CakesPage());
              }),
              categoryCard('Breads', 'assets/images/product/breadClean.png',
                  () {
                Get.to(() => BreadsPage());
              }),
              categoryCard('Drinks', 'assets/images/product/drinksClean.png',
                  () {
                Get.to(() => DrinksPage());
              }),
              categoryCard('Snacks', 'assets/images/product/snackClean.png',
                  () {
                Get.to(() => SnacksPage());
              }),
              categoryCard('Hampers', 'assets/images/product/hampersClean.png',
                  () {
                Get.to(() => HampersPage());
              }),
            ],
          ),
          controller.products.length != controller.result.value.length
              ? onSearchProducts(controller, context)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                    const Text("Top Products",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: PaddingConstants.PADDING_SMALL),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: PaddingConstants.PADDING_SMALL,
                          mainAxisSpacing: PaddingConstants.PADDING_SMALL,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.43),
                        ),
                        itemCount: controller.topProducts.value.length,
                        itemBuilder: (context, index) {
                          return productCard(
                              controller.topProducts.value[index]);
                        }),
                    const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                    const Text("Don't miss this too",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: PaddingConstants.PADDING_SMALL),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: PaddingConstants.PADDING_SMALL,
                          mainAxisSpacing: PaddingConstants.PADDING_SMALL,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.28),
                        ),
                        itemCount: controller.result.value.length,
                        itemBuilder: (context, index) {
                          return productCard(controller.result.value[index]);
                        }),
                  ],
                ),
        ],
      ),
    ),
  );
}

Widget onSearchProducts(ProductController controller, BuildContext context) {
  return controller.result.value.isEmpty
      ? Padding(
          padding:
              const EdgeInsets.symmetric(vertical: PaddingConstants.PADDING_XL),
          child: Center(
              child: Column(
            children: [
              Image.asset(
                'assets/images/product/ic_empty_box.png',
                height: 300,
              ),
              const Text("No Product Found",
                  style: TextStyle(
                      fontSize: TextConstants.TEXT_SMALL,
                      fontWeight: FontWeight.w500)),
            ],
          )),
        )
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
            const Text("Search Result",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: PaddingConstants.PADDING_SMALL),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: PaddingConstants.PADDING_SMALL,
                  mainAxisSpacing: PaddingConstants.PADDING_SMALL,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.3),
                ),
                itemCount: controller.result.value.length,
                itemBuilder: (context, index) {
                  return productCard(controller.result.value[index]);
                }),
          ],
        );
}
