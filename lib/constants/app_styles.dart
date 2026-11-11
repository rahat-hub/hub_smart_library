import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  // Splash Screen Text Styles
  static TextStyle splashTopBadge = GoogleFonts.hindSiliguri(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF90E0EF),
    letterSpacing: 0.3,
  );

  static TextStyle splashTitle = GoogleFonts.hindSiliguri(
    fontSize: 32.0,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    letterSpacing: 0.5,
    height: 1.2,
  );

  static TextStyle splashSubtitle = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF7FE5D9),
    letterSpacing: 2.2,
  );

  static TextStyle splashTagline = GoogleFonts.hindSiliguri(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFD1E4F8),
  );

  static TextStyle chipText = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle syncTitle = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFB5E4FE),
  );

  static TextStyle syncPercentage = GoogleFonts.hindSiliguri(
    fontSize: 13.5,
    fontWeight: FontWeight.w700,
    color: AppColors.mintAccent,
  );

  static TextStyle getStartedButton = GoogleFonts.hindSiliguri(
    fontSize: 16.5,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF071F36),
  );

  static TextStyle biometricNote = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF94B5D6),
  );

  static TextStyle footerText = GoogleFonts.hindSiliguri(
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
    color: const Color(0x99B3D0EC),
  );

  // Login Screen Text Styles
  static TextStyle appBarTitle = GoogleFonts.hindSiliguri(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: AppColors.slateHeading,
  );

  static TextStyle universityBadge = GoogleFonts.hindSiliguri(
    fontSize: 11.5,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF0D9488),
    letterSpacing: 1.5,
  );

  static TextStyle welcomeHeading = GoogleFonts.hindSiliguri(
    fontSize: 28.0,
    fontWeight: FontWeight.w800,
    color: AppColors.slateHeading,
    height: 1.2,
  );

  static TextStyle loginSubtitle = GoogleFonts.hindSiliguri(
    fontSize: 13.5,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
    height: 1.4,
  );

  static TextStyle tabActive = GoogleFonts.hindSiliguri(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: AppColors.navyPrimary,
  );

  static TextStyle tabInactive = GoogleFonts.hindSiliguri(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle fieldLabel = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w600,
    color: AppColors.slateHeading,
  );

  static TextStyle fieldHint = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.slateMuted,
  );

  static TextStyle inputText = GoogleFonts.hindSiliguri(
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    color: AppColors.slateHeading,
  );

  static TextStyle forgotPin = GoogleFonts.hindSiliguri(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: AppColors.linkBlue,
  );

  static TextStyle rememberMe = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle loginButton = GoogleFonts.hindSiliguri(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle smartCardTitle = GoogleFonts.hindSiliguri(
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
    color: AppColors.navyDark,
  );

  static TextStyle smartCardSubtitle = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.slateSubtitle,
  );

  static TextStyle scanAction = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
    color: AppColors.navyPrimary,
  );

  static TextStyle dividerText = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateMuted,
  );

  static TextStyle eduIdButton = GoogleFonts.hindSiliguri(
    fontSize: 14.5,
    fontWeight: FontWeight.w700,
    color: AppColors.navyDark,
  );

  static TextStyle registerPrompt = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle registerAction = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF0F766E),
  );

  static TextStyle helpDeskTitle = GoogleFonts.hindSiliguri(
    fontSize: 13.5,
    fontWeight: FontWeight.w700,
    color: AppColors.navyDark,
  );

  static TextStyle helpDeskInfo = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );
}
