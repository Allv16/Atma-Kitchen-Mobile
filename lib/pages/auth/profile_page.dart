import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/pages/auth/controllers/profile_controller.dart';
import 'package:atma_kitchen/pages/auth/widgets/baseListTile.dart';
import 'package:atma_kitchen/pages/auth/widgets/profile_card.dart';
import 'package:atma_kitchen/widgets/alert.dart';
import 'package:atma_kitchen/widgets/dialog.dart';
import 'package:atma_kitchen/widgets/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(ProfileController());
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                  controller.isLoading.value
                      ? profileCardSkeleton()
                      : profileCard(context, controller.profile!),
                ],
              ),
              const SizedBox(height: PaddingConstants.PADDING_5XL),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: PaddingConstants.PADDING_DEFAULT),
                child: primaryAlert(
                    "Refund Available",
                    "You have some balance in your account. You can apply for a refund",
                    Icons.info,
                    AppColors.kPrimary),
              ),
              const SizedBox(height: PaddingConstants.PADDING_MEDIUM),
              Divider(
                color: AppColors.kPrimaryLighter,
                thickness: 14,
              ),
              const SizedBox(height: PaddingConstants.PADDING_2XS),
              baseListTile(Icons.receipt_long_outlined, "Order List", true,
                  () => {Get.toNamed(RoutesName.orderList)}),
              baseListTile(
                  Icons.house_outlined, "Address List", true, () => {}),
              baseListTile(
                  Icons.payment_outlined, "Balance Info", true, () => {}),
              baseListTile(
                  Icons.shield_outlined, "Manage Password", true, () => {}),
              baseListTile(
                  Icons.logout_outlined,
                  "Logout",
                  false,
                  () => {
                        dangerConfirmationDialog("Logout",
                            "Are you sure to logout?", controller.logout)
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
