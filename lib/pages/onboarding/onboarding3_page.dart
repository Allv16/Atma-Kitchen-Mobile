import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/onboarding/getting_started_page.dart';
import 'package:atma_kitchen/pages/onboarding/widgets/navigation_pill.dart';
import 'package:atma_kitchen/pages/onboarding/widgets/text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class Onboarding3Page extends StatelessWidget {
  const Onboarding3Page({super.key});

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
                    angle: -math.pi / 2,
                    child: Image.asset(
                      'assets/images/onboarding/onboarding_bg1.png',
                    ),
                  ),
                  Image.asset(
                    'assets/images/onboarding/onboarding3Clean.png',
                    width: 343,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  navigationPill(false),
                  const SizedBox(width: PaddingConstants.PADDING_2XS),
                  navigationPill(false),
                  const SizedBox(width: PaddingConstants.PADDING_2XS),
                  navigationPill(true),
                ],
              ),
              const SizedBox(height: PaddingConstants.PADDING_SMALL),
              titleText("Earn and Save More!"),
              const SizedBox(height: PaddingConstants.PADDING_XS),
              contentText(
                  "Unlock exciting discounts with our point system! Earn points with every purchase and watch them double on your birthday. Save more, enjoy more with Atma Kitchen. Start collecting your points today!"),
              const SizedBox(height: PaddingConstants.PADDING_LARGE),
            ]),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingConstants.PADDING_DEFAULT,
              vertical: PaddingConstants.PADDING_LARGE),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Back",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey,
                        color: Colors.grey)),
              ),
              IconButton.filled(
                onPressed: () {
                  Get.to(() => GettingStartedPage());
                },
                icon: const Icon(Icons.arrow_forward, size: 24),
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.all(PaddingConstants.PADDING_MEDIUM))),
              )
            ],
          ),
        ));
  }
}
