import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/refund/controllers/refund_controller.dart';
import 'package:atma_kitchen/pages/refund/widgets/balance_card.dart';
import 'package:atma_kitchen/pages/refund/widgets/list_refund.dart';
import 'package:atma_kitchen/widgets/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefundPage extends StatelessWidget {
  final controller = Get.put(RefundController());
  RefundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter + const Alignment(0, 6),
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF537578),
                            const Color(0xFF537578),
                            AppColors.kPrimary,
                            AppColors.kPrimary
                          ],
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomRight:
                                Radius.circular(RadiusConstants.RADIUS_DEFAULT),
                            bottomLeft: Radius.circular(
                                RadiusConstants.RADIUS_DEFAULT))),
                  ),
                  controller.isBalanceLoading.value
                      ? balanceCardSkeleton()
                      : balanceCard(context, controller.balance.value),
                ],
              ),
              const SizedBox(height: PaddingConstants.PADDING_5XL),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: PaddingConstants.PADDING_DEFAULT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Refund History",
                      style: TextStyle(
                        fontSize: TextConstants.TEXT_MEDIUM,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: PaddingConstants.PADDING_DEFAULT),
                    controller.isRefundLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : controller.refund.value.isEmpty
                            ? const Text("No refunds available")
                            : Column(
                                children: controller.refund.value
                                    .map((item) => Column(
                                          children: [
                                            listRefund(item),
                                            const SizedBox(
                                              height:
                                                  PaddingConstants.PADDING_2XS,
                                            )
                                          ],
                                        ))
                                    .toList(),
                              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
