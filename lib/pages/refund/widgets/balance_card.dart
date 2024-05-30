import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/utils.dart';
import 'package:atma_kitchen/pages/refund/input_account_no.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget balanceCard(BuildContext context, double balance) => Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: PaddingConstants.PADDING_DEFAULT),
      child: Container(
        width: double.infinity,
        height: HeightConstants.PROFILE_CARD_HEIGHT,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(RadiusConstants.RADIUS_DEFAULT),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingConstants.PADDING_DEFAULT,
                vertical: PaddingConstants.PADDING_SMALL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Balance",
                      style: TextStyle(
                          fontSize: TextConstants.TEXT_SMALL,
                          color: Colors.grey),
                    ),
                    balance == 0
                        ? Container()
                        : FilledButton(
                            onPressed: () {
                              Get.to(() => InputAccountNo());
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                minimumSize: const Size(
                                    32, HeightConstants.SMALL_BUTTON_HEIGHT)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Withdraw",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: TextConstants.TEXT_SMALL),
                                ),
                                const SizedBox(
                                    width: PaddingConstants.PADDING_2XS),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: AppColors.white,
                                  size: 14,
                                ),
                              ],
                            ))
                  ],
                ),
                const SizedBox(width: PaddingConstants.PADDING_XS),
                Text(
                  currencyFormat(balance),
                  style: const TextStyle(
                    fontSize: TextConstants.TEXT_3XL,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )),
      ),
    );
