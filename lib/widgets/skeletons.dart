import 'package:atma_kitchen/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

Skeletonizer profileCardSkeleton() => Skeletonizer.zone(
        child: Padding(
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
        child: const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: PaddingConstants.PADDING_DEFAULT,
                vertical: PaddingConstants.PADDING_SMALL),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Bone.circle(
                      size: 60,
                    ),
                    Bone.text(words: 1),
                  ],
                ),
                SizedBox(width: PaddingConstants.PADDING_DEFAULT),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: PaddingConstants.PADDING_2XS),
                    Bone.text(
                      width: 120,
                    ),
                    SizedBox(height: PaddingConstants.PADDING_2XS),
                    Bone.text(
                      width: 200,
                    ),
                    SizedBox(height: PaddingConstants.PADDING_2XS),
                    Bone.text(
                      width: 180,
                    ),
                    SizedBox(height: PaddingConstants.PADDING_2XS),
                    Bone.text(
                      width: 150,
                    ),
                    SizedBox(height: PaddingConstants.PADDING_2XS),
                    Bone.text(
                      width: 220,
                    ),
                  ],
                )
              ],
            )),
      ),
    ));

Skeletonizer balanceCardSkeleton() => Skeletonizer.zone(
        child: Padding(
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
        child: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: PaddingConstants.PADDING_DEFAULT,
              vertical: PaddingConstants.PADDING_SMALL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Bone.text(
                    words: 2,
                  ),
                  Bone.button(
                    words: 1,
                    height: 24,
                  )
                ],
              ),
              SizedBox(height: PaddingConstants.PADDING_DEFAULT),
              Bone.text(
                words: 1,
                style: TextStyle(
                  fontSize: TextConstants.TEXT_3XL,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    ));
