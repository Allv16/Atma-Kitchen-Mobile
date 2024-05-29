import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/onboarding/onboarding3_page.dart';
import 'package:atma_kitchen/pages/onboarding/widgets/navigation_pill.dart';
import 'package:atma_kitchen/pages/onboarding/widgets/text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class Onboarding2Page extends StatelessWidget {
  const Onboarding2Page({super.key});

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
                    angle: math.pi / 2,
                    child: Image.asset(
                      'assets/images/onboarding/onboarding_bg1.png',
                    ),
                  ),
                  Image.asset(
                    'assets/images/onboarding/onboarding1Clean.png',
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
                  navigationPill(true),
                  const SizedBox(width: PaddingConstants.PADDING_2XS),
                  navigationPill(false),
                ],
              ),
              const SizedBox(height: PaddingConstants.PADDING_SMALL),
              titleText("Best Bakery In Town!"),
              const SizedBox(height: PaddingConstants.PADDING_XS),
              contentText(
                  "Located in the heart of Yogyakarta, Atma Kitchen is a bakery that offers a variety of delicious baked goods, varying from bread, cakes, pastries, and more. And we serve hampers for special occasions too!"),
              const SizedBox(height: PaddingConstants.PADDING_2XS),
              contentText(
                  "Experience the best bakery in town! At Atma Kitchen, all made with the freshest and finest ingredients. Pre-order your favorites and enjoy the taste of quality."),
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
                  Get.to(() => const Onboarding3Page());
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
