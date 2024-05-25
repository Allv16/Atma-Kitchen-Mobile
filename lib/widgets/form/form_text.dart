import 'package:atma_kitchen/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text formTitle(BuildContext context, String title) => Text(title,
    style: GoogleFonts.cormorant(
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ));

Text formHint(BuildContext context, String hint) => Text(hint,
    style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Colors.grey,
        ));
Text formHintBold(BuildContext context, String hint) => Text(hint,
    style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
        ));
