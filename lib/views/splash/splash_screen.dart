import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_styles.dart';
import '../../controllers/splash_controller.dart';
import '../../widgets/responsive_layout.dart';
import 'widgets/feature_chip_widget.dart';
import 'widgets/hero_book_logo.dart';
import 'widgets/library_server_card.dart';
import 'widgets/sync_progress_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.splashBgTop,
              AppColors.splashBgMid,
              AppColors.splashBgBottom,
            ],
          ),
        ),
        child: SafeArea(
          child: MaxWidthContainer(
            maxWidth: 480,
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  // Top Chip: সেন্ট্রাল ইউনিভার্সিটি লাইব্রেরি অটোমেশন সিস্টেম
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 7),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13366C).withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.cyanAccent.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.account_balance_rounded,
                          size: 15,
                          color: Color(0xFF7DD3FC),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            AppStrings.topBadgeText,
                            style: AppStyles.splashTopBadge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Glowing Book Logo with Orbiting Particles
                  const HeroBookLogo(),

                  const SizedBox(height: 14),

                  // Main Title: স্মার্ট লাইব্রেরি
                  Text(
                    AppStrings.splashTitle,
                    textAlign: TextAlign.center,
                    style: AppStyles.splashTitle,
                  ),

                  const SizedBox(height: 4),

                  // Subtitle: SMART LIBRARY ECOSYSTEM
                  Text(
                    AppStrings.splashSubtitle,
                    textAlign: TextAlign.center,
                    style: AppStyles.splashSubtitle,
                  ),

                  const SizedBox(height: 8),

                  // Tagline: জ্ঞান ও প্রযুক্তির ডিজিটাল মেলবন্ধন
                  Text(
                    AppStrings.splashTagline,
                    textAlign: TextAlign.center,
                    style: AppStyles.splashTagline,
                  ),

                  const SizedBox(height: 18),

                  // Feature Chips Row 1
                  const Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      FeatureChipWidget(
                        icon: Icons.qr_code_2_rounded,
                        label: AppStrings.chipDigitalTracking,
                      ),
                      FeatureChipWidget(
                        icon: Icons.bolt_rounded,
                        label: AppStrings.chipInstantIssue,
                        iconColor: Color(0xFF38BDF8),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Feature Chip Row 2 (Centered Live Catalog)
                  const FeatureChipWidget(
                    icon: Icons.grid_view_rounded,
                    label: AppStrings.chipLiveCatalog,
                    iconColor: Color(0xFF818CF8),
                  ),

                  const SizedBox(height: 22),

                  // Library Server Status Card (Aisle perspective + Badges)
                  const LibraryServerCard(),

                  const SizedBox(height: 20),

                  // Database Sync Progress Bar (100% Animated)
                  SyncProgressWidget(controller: controller),

                  const SizedBox(height: 22),

                  // CTA Button: শুরু করুন (Get Started)
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF7CF4DF),
                            Color(0xFF5EEAD4),
                            Color(0xFF48D5C4),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4DEEEA).withValues(alpha: 0.35),
                            blurRadius: 18,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: controller.goToLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.getStartedBtn,
                                style: AppStyles.getStartedButton,
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 20,
                                color: Color(0xFF071F36),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Biometric Support Note
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.verified_user_outlined,
                          size: 14,
                          color: Color(0xFF94B5D6),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          AppStrings.biometricSupported,
                          style: AppStyles.biometricNote,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Footer Information
                  Text(
                    AppStrings.versionInfo,
                    textAlign: TextAlign.center,
                    style: AppStyles.footerText,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.copyrightInfo,
                    textAlign: TextAlign.center,
                    style: AppStyles.footerText,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
