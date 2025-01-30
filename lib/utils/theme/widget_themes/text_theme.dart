import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    // Display
    headlineLarge: const TextStyle().copyWith(
      fontSize: 34.0, // Android: 34sp, iOS: 34pt
      fontWeight: FontWeight.bold,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 28.0, // Android: 28sp, iOS: 28pt
      fontWeight: FontWeight.w600,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24.0, // Android: 24sp, iOS: 24pt
      fontWeight: FontWeight.w600,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    // Title
    titleLarge: const TextStyle().copyWith(
      fontSize: 20.0, // Android: 20sp, iOS: 20pt
      fontWeight: FontWeight.w600,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0, // Android: 16sp, iOS: 17pt
      fontWeight: FontWeight.w500,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14.0, // Android: 14sp, iOS: 15pt
      fontWeight: FontWeight.w500,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    // Body
    bodyLarge: const TextStyle().copyWith(
      fontSize: 16.0, // Android: 16sp, iOS: 17pt
      fontWeight: FontWeight.w400,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0, // Android: 14sp, iOS: 15pt
      fontWeight: FontWeight.normal,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0, // Android: 12sp, iOS: 13pt
      fontWeight: FontWeight.w400,
      color: TColors.textWhite.withOpacity(0.5),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    // Label
    labelLarge: const TextStyle().copyWith(
      fontSize: 14.0, // Android: 14sp, iOS: 13pt
      fontWeight: FontWeight.w500,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0, // Android: 12sp, iOS: 12pt
      fontWeight: FontWeight.normal,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 10.0, // Android: 11sp, iOS: 11pt
      fontWeight: FontWeight.normal,
      color: TColors.textWhite,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: TColors.light,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: TColors.light,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: TColors.light,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: TColors.light,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: TColors.light,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: TColors.light,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: TColors.light,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: TColors.light,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: TColors.light.withOpacity(0.5),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: TColors.light,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: TColors.light.withOpacity(0.6),
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    ),
  );
}
