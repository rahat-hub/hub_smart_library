import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../controllers/registration_controller.dart';
import 'widgets/academic_info_section.dart';
import 'widgets/registration_app_bar.dart';
import 'widgets/registration_hero_card.dart';
import 'widgets/registration_progress_card.dart';
import 'widgets/security_verification_section.dart';
import 'widgets/smart_pass_preview_card.dart';
import 'widgets/terms_and_submit_section.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFD),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final isTablet = screenWidth >= 650;
            final isDesktop = screenWidth >= 1024;

            final maxContentWidth = isDesktop ? 780.0 : (isTablet ? 680.0 : double.infinity);
            final horizontalPadding = isTablet ? 24.0 : 16.0;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxContentWidth),
                child: Column(
                  children: [
                    // Top App Bar
                    RegistrationAppBar(isTablet: isTablet),

                    // Scrollable Form Body
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1. Hero Banner
                            RegistrationHeroCard(isTablet: isTablet),

                            const SizedBox(height: 12),

                            // 2. Step & Progress Tracker
                            RegistrationProgressCard(isTablet: isTablet),

                            const SizedBox(height: 18),

                            // 3. Step 1: Academic & Personal Info
                            AcademicInfoSection(
                              controller: controller,
                              isTablet: isTablet,
                            ),

                            const SizedBox(height: 18),

                            // 4. Step 2: Identity & Security Verification
                            SecurityVerificationSection(
                              controller: controller,
                              isTablet: isTablet,
                            ),

                            const SizedBox(height: 18),

                            // 5. Live Smart Pass Virtual ID Preview
                            SmartPassPreviewCard(
                              controller: controller,
                              isTablet: isTablet,
                            ),

                            const SizedBox(height: 18),

                            // 6. Terms Agreement, CTA & Footer
                            TermsAndSubmitSection(
                              controller: controller,
                              isTablet: isTablet,
                            ),

                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
