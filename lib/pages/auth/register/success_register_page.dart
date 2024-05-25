import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/models/auth/api_response.dart';
import 'package:atma_kitchen/pages/auth/controllers/register_controller.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:atma_kitchen/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SuccessRegisterPage extends StatelessWidget {
  final RegisterController controller = Get.find();
  SuccessRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: AppColors.kPrimary,
          appBar: AppBar(
            backgroundColor: AppColors.kPrimary,
            elevation: 0,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingConstants.PADDING_DEFAULT),
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Lottie.asset('assets/animations/auth/sending.json',
                  frameRate: FrameRate.max),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Text(
                "Registation Success!",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: TextConstants.TEXT_5XL,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              Text("Please check your email to verify your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: TextConstants.TEXT_DEFAULT,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  )),
              const SizedBox(height: PaddingConstants.PADDING_2XL),
              whiteOutlinedButton(
                  context: context,
                  text: "Back to Home",
                  onPressed: () => Get.offNamed(RoutesName.login)),
              const SizedBox(height: PaddingConstants.PADDING_2XS),
              const Divider(color: Colors.grey, thickness: 1),
              const SizedBox(height: PaddingConstants.PADDING_2XS),
              primaryOutlinedButton(
                  isLoading: controller.loading.value,
                  context: context,
                  text: "Didn't receive an email",
                  onPressed: () async {
                    BaseApiResponse response = await controller.resendEmail();
                    if (response.success!) {
                      successSnackBar("Email has been resend",
                          "Please check your email again.", () {});
                    } else {
                      errorSnackBar(
                          "Error resend email", response.message!, () {});
                    }
                  }),
            ],
          )),
    );
  }
}
