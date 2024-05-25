import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/pages/onboarding/widgets/text.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GettingStartedPage extends StatelessWidget {
  final box = GetStorage();
  GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingConstants.PADDING_DEFAULT),
          child: Column(children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.125),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: 0,
                  child: Image.asset(
                    'assets/images/onboarding/gettingstarted_bg.png',
                  ),
                ),
                Image.asset(
                  'assets/images/onboarding/gettingstarted.png',
                  width: 343,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
            const SizedBox(height: PaddingConstants.PADDING_SMALL),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                titleText("Getting Started,"),
              ],
            ),
            const SizedBox(height: PaddingConstants.PADDING_XS),
            contentText(
                "To ensure full functionality of this apps, we recommend you to register or login into an existing account. But if you don’t want to do that you can tap ‘Continue as Guest’ button."),
            const SizedBox(height: PaddingConstants.PADDING_LARGE),
            SizedBox(
                width: double.infinity,
                child: primaryFilledButton(
                    context: context,
                    text: "Login | Register",
                    onPressed: () {
                      box.write('boarding', true);
                      Get.offAllNamed(RoutesName.login);
                    })),
            const SizedBox(height: PaddingConstants.PADDING_SMALL),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    box.write('boarding', true);
                    Get.offAllNamed(RoutesName.home);
                  },
                  child: Text('Continue as Guest'),
                )),
          ]),
        ),
      ),
    );
  }
}
