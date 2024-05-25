import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:flutter/material.dart';

Container primaryAlert(
        String title, String message, IconData icon, Color iconColor) =>
    Container(
      width: double.infinity,
      height: HeightConstants.ALERT_HEIGHT,
      padding: const EdgeInsets.all(PaddingConstants.PADDING_XS),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryLighter,
        borderRadius: BorderRadius.circular(RadiusConstants.RADIUS_DEFAULT),
        border: Border.all(color: AppColors.kPrimary),
      ),
      child: Row(
        children: [
          Icon(icon, size: 60, color: iconColor),
          const SizedBox(width: PaddingConstants.PADDING_SMALL),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      fontSize: TextConstants.TEXT_SMALL,
                      color: AppColors.kPrimary,
                      fontWeight: FontWeight.w600,
                    )),
                Text(message,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: TextConstants.TEXT_SMALL,
                      color: AppColors.kPrimary,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          )
        ],
      ),
    );
