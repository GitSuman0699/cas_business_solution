import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class TTextButtonTheme {
  TTextButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightTextButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
    elevation: 0,
    foregroundColor: TColors.light,
    // backgroundColor: TColors.secondary,
    disabledForegroundColor: TColors.darkGrey,
    disabledBackgroundColor: TColors.buttonDisabled,
    padding: const EdgeInsets.symmetric(
        vertical: 12, horizontal: TSizes.buttonHeight),
    textStyle: TextStyle(
      fontSize: 14,
      color: TColors.textWhite,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    // shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
  ));

  /* -- Dark Theme -- */
  static final darkTextButtonTheme = TextButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.light,
      backgroundColor: TColors.primary,
      disabledForegroundColor: TColors.darkGrey,
      disabledBackgroundColor: TColors.darkerGrey,
      side: const BorderSide(color: TColors.primary),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.buttonHeight, horizontal: TSizes.buttonHeight),
      textStyle: TextStyle(
        fontSize: 16,
        color: TColors.textWhite,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );
}
