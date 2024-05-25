import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/pages/onboarding/onboarding2_page.dart';
import 'package:atma_kitchen/pages/onboarding/widgets/navigation_pill.dart';
import 'package:atma_kitchen/pages/onboarding/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding1Page extends StatelessWidget {
  const Onboarding1Page({super.key});

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
                  Image.asset(
                    'assets/images/onboarding/onboarding_bg1.png',
                  ),
                  Image.asset(
                    'assets/images/onboarding/onboarding2Clean.png',
                    width: 343,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  navigationPill(true),
                  const SizedBox(width: PaddingConstants.PADDING_2XS),
                  navigationPill(false),
                  const SizedBox(width: PaddingConstants.PADDING_2XS),
                  navigationPill(false),
                ],
              ),
              const SizedBox(height: PaddingConstants.PADDING_SMALL),
              titleText("Welcome!"),
              const SizedBox(height: PaddingConstants.PADDING_XS),
              contentText(
                  "Welcome to Atma Kitchen! We’re thrilled to have you here. Get ready to explore our premium bakery products, made fresh for you. Remember, we’re just a tap away!"),
            ]),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingConstants.PADDING_DEFAULT,
              vertical: PaddingConstants.PADDING_LARGE),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton.filled(
                onPressed: () {
                  Get.to(() => const Onboarding2Page());
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
