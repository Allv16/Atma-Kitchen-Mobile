import 'package:atma_kitchen/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text titleText(String text) => Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.cormorant(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
    );

Text contentText(String text) => Text(text,
    textAlign: TextAlign.justify,
    style: const TextStyle(
      fontSize: TextConstants.TEXT_SMALL,
      color: Colors.grey,
    ));
