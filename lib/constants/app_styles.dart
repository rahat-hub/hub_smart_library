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

  // Dashboard Styles
  static TextStyle universityLogoSub = GoogleFonts.hindSiliguri(
    fontSize: 10.5,
    fontWeight: FontWeight.w700,
    color: AppColors.tealBrand,
    letterSpacing: 1.2,
  );

  static TextStyle smartLibraryLogoTitle = GoogleFonts.hindSiliguri(
    fontSize: 16.5,
    fontWeight: FontWeight.w800,
    color: AppColors.slateHeading,
    letterSpacing: -0.3,
    height: 1.1,
  );

  static TextStyle heroSessionTag = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF7DD3FC),
  );

  static TextStyle heroGreeting = GoogleFonts.hindSiliguri(
    fontSize: 21.0,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    height: 1.2,
  );

  static TextStyle heroGreetingTablet = GoogleFonts.hindSiliguri(
    fontSize: 25.0,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    height: 1.2,
  );

  static TextStyle heroStudentId = GoogleFonts.hindSiliguri(
    fontSize: 12.5,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFBAE6FD),
    letterSpacing: 0.5,
  );

  static TextStyle digitalPassButton = GoogleFonts.hindSiliguri(
    fontSize: 11.5,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle heroStatLabel = GoogleFonts.hindSiliguri(
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFD1E6FF),
  );

  static TextStyle heroStatValue = GoogleFonts.hindSiliguri(
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static TextStyle searchInput = GoogleFonts.hindSiliguri(
    fontSize: 13.5,
    fontWeight: FontWeight.w500,
    color: AppColors.slateHeading,
  );

  static TextStyle searchHint = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    color: AppColors.slateMuted,
  );

  static TextStyle sectionTitle = GoogleFonts.hindSiliguri(
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
    color: AppColors.slateHeading,
  );

  static TextStyle sectionAction = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
    color: AppColors.tealBrand,
  );

  static TextStyle bookTitle = GoogleFonts.hindSiliguri(
    fontSize: 14.5,
    fontWeight: FontWeight.w700,
    color: AppColors.slateHeading,
    height: 1.25,
  );

  static TextStyle bookAuthor = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle ratingText = GoogleFonts.hindSiliguri(
    fontSize: 11.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle availableTag = GoogleFonts.hindSiliguri(
    fontSize: 11.5,
    fontWeight: FontWeight.w600,
    color: AppColors.availableGreenText,
  );

  static TextStyle borrowBtn = GoogleFonts.hindSiliguri(
    fontSize: 11.5,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle rulesBannerTitle = GoogleFonts.hindSiliguri(
    fontSize: 14.5,
    fontWeight: FontWeight.w700,
    color: AppColors.slateHeading,
  );

  static TextStyle rulesBannerSubtitle = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle catalogCount = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: AppColors.slateSubtitle,
  );

  // Book Details Text Styles
  static TextStyle detailsScreenTitle = GoogleFonts.hindSiliguri(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: AppColors.slateHeading,
  );

  static TextStyle breadcrumbText = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w600,
    color: AppColors.slateHeading,
  );

  static TextStyle breadcrumbSub = GoogleFonts.hindSiliguri(
    fontSize: 12.5,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle publisherTag = GoogleFonts.hindSiliguri(
    fontSize: 11.0,
    fontWeight: FontWeight.w700,
    color: AppColors.tealBrand,
    letterSpacing: 0.8,
  );

  static TextStyle detailsBookTitle = GoogleFonts.hindSiliguri(
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    color: AppColors.slateHeading,
    height: 1.2,
  );

  static TextStyle detailsAuthor = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle ratingTextDetails = GoogleFonts.hindSiliguri(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: AppColors.slateHeading,
  );

  static TextStyle metaLabel = GoogleFonts.hindSiliguri(
    fontSize: 11.5,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle metaValue = GoogleFonts.hindSiliguri(
    fontSize: 13.5,
    fontWeight: FontWeight.w700,
    color: AppColors.slateHeading,
  );

  static TextStyle shelfTitle = GoogleFonts.hindSiliguri(
    fontSize: 14.5,
    fontWeight: FontWeight.w700,
    color: AppColors.slateHeading,
  );

  static TextStyle shelfLocationText = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w600,
    color: AppColors.navyPrimary,
  );

  static TextStyle descriptionBody = GoogleFonts.hindSiliguri(
    fontSize: 13.5,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF334155),
    height: 1.5,
  );

  static TextStyle toggleReadMore = GoogleFonts.hindSiliguri(
    fontSize: 12.5,
    fontWeight: FontWeight.w700,
    color: AppColors.navyPrimary,
  );

  static TextStyle scheduleHeader = GoogleFonts.hindSiliguri(
    fontSize: 14.5,
    fontWeight: FontWeight.w700,
    color: AppColors.slateHeading,
  );

  static TextStyle scheduleLabel = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle submitButtonText = GoogleFonts.hindSiliguri(
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle bookmarkLinkText = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w600,
    color: AppColors.navyPrimary,
  );

  // Borrowed Books & Fine Text Styles
  static TextStyle semesterUserText = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle activeMemberBadge = GoogleFonts.hindSiliguri(
    fontSize: 11.0,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF15803D),
  );

  static TextStyle metricCardLabel = GoogleFonts.hindSiliguri(
    fontSize: 11.5,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle metricCardValue = GoogleFonts.hindSiliguri(
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    color: AppColors.slateHeading,
    letterSpacing: -0.3,
  );

  static TextStyle segmentTabActive = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
    color: AppColors.navyPrimary,
  );

  static TextStyle segmentTabInactive = GoogleFonts.hindSiliguri(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle borrowedBookTitle = GoogleFonts.hindSiliguri(
    fontSize: 15.5,
    fontWeight: FontWeight.w800,
    color: AppColors.slateHeading,
    height: 1.2,
  );

  static TextStyle borrowedBookAuthor = GoogleFonts.hindSiliguri(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.slateSubtitle,
  );

  static TextStyle policyTitle = GoogleFonts.hindSiliguri(
    fontSize: 13.5,
    fontWeight: FontWeight.w700,
    color: AppColors.slateHeading,
  );

  static TextStyle policyBody = GoogleFonts.hindSiliguri(
    fontSize: 11.5,
    fontWeight: FontWeight.w400,
    color: AppColors.slateSubtitle,
    height: 1.45,
  );

  static TextStyle floatingTotalLabel = GoogleFonts.hindSiliguri(
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF93C5FD),
  );

  static TextStyle floatingTotalAmount = GoogleFonts.hindSiliguri(
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );
}
