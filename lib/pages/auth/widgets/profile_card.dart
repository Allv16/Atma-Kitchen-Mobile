import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/models/auth/profile.dart';
import 'package:atma_kitchen/pages/auth/widgets/profile_item_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Padding profileCard(BuildContext context, Profile profile) => Padding(
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
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.grey,
                        child: Image.asset(
                          'assets/images/auth/default_profile.png',
                        )),
                    const SizedBox(height: PaddingConstants.PADDING_2XS),
                    Text(
                      profile.user!.username!,
                      style: TextStyle(
                        fontSize: TextConstants.TEXT_SMALL,
                        color: AppColors.kPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: PaddingConstants.PADDING_DEFAULT),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outlined,
                          size: 16,
                        ),
                        const SizedBox(width: PaddingConstants.PADDING_2XS),
                        Text(
                          profile.fullname!,
                          style: const TextStyle(
                            fontSize: TextConstants.TEXT_SMALL,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        profile.gender == 'Laki-laki'
                            ? const Icon(Icons.male_outlined,
                                size: 12, color: Colors.blue)
                            : const Icon(Icons.female_outlined,
                                size: 12, color: Colors.pink)
                      ],
                    ),
                    profileItem(Icons.email_outlined, Colors.grey.shade900,
                        profile.user!.email!),
                    profileItem(
                        Icons.phishing_outlined, Colors.grey, profile.phone!),
                    profileItem(Icons.cake_outlined, Colors.grey,
                        DateFormat('dd MMM yyyy').format(profile.birthDate!)),
                    Row(
                      children: [
                        profileItem(Icons.attach_money_outlined,
                            AppColors.kPrimary, "Rp1.000.000"),
                        const SizedBox(width: PaddingConstants.PADDING_XS),
                        profileItem(Icons.stars_outlined, AppColors.kSecondary,
                            "${profile.points} Poin")
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
