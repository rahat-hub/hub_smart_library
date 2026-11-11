import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_styles.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/responsive_layout.dart';
import 'widgets/help_desk_card.dart';
import 'widgets/login_form_card.dart';
import 'widgets/login_header_widget.dart';
import 'widgets/role_toggle_widget.dart';
import 'widgets/smart_card_action_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.loginScaffoldBg,
      body: ResponsiveLayout(
        mobile: _buildMobileAndTabletLayout(context, controller, maxWidth: 460),
        tablet: _buildMobileAndTabletLayout(context, controller, maxWidth: 520),
        desktop: _buildDesktopLayout(context, controller),
      ),
    );
  }

  // Mobile and Tablet Layout
  Widget _buildMobileAndTabletLayout(
    BuildContext context,
    AuthController controller, {
    required double maxWidth,
  }) {
    return SafeArea(
      child: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: MaxWidthContainer(
                maxWidth: maxWidth,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const LoginHeaderWidget(),
                    const SizedBox(height: 22),
                    RoleToggleWidget(controller: controller),
                    const SizedBox(height: 18),
                    LoginFormCard(controller: controller),
                    const SizedBox(height: 16),
                    SmartCardActionCard(controller: controller),
                    const SizedBox(height: 20),
                    _buildDividerWithText(),
                    const SizedBox(height: 16),
                    _buildEduIdButton(controller),
                    const SizedBox(height: 18),
                    _buildRegistrationPrompt(controller),
                    const SizedBox(height: 22),
                    const HelpDeskCard(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Desktop / Web Two-Column Split Layout
  Widget _buildDesktopLayout(BuildContext context, AuthController controller) {
    return Row(
      children: [
        // Left Column: Modern Library Branding & Showcase Banner
        Expanded(
          flex: 5,
          child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF091E42),
                  Color(0xFF13366C),
                  Color(0xFF0D254C),
                ],
              ),
            ),
            padding: const EdgeInsets.all(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top University Branding
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF48ECD1).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.auto_stories_rounded,
                        color: Color(0xFF48ECD1),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.appTitle,
                          style: AppStyles.splashSubtitle.copyWith(
                            color: const Color(0xFF48ECD1),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'সেন্ট্রাল ইউনিভার্সিটি অটোমেশন',
                          style: AppStyles.splashTagline.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),

                // Middle Hero Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF38BDF8).withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF10B981),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'সেন্ট্রাল সার্ভার ক্লাউড সিঙ্ক সক্রিয়',
                              style: AppStyles.chipText
                                  .copyWith(color: const Color(0xFFBAE6FD)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'জ্ঞানের ভুবনে স্বাগতম,\nস্মার্ট লাইব্রেরি সিস্টেম',
                      style: AppStyles.splashTitle.copyWith(
                        fontSize: 36,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      '৪৫,০০০+ ই-বুকস, জার্নাল, গবেষণাপত্র এবং স্বয়ংক্রিয় স্মার্ট কার্ড চেক-ইন সুবিধার সমন্বয়ে আধুনিক পাঠাগার।',
                      style: AppStyles.splashTagline.copyWith(
                        fontSize: 15,
                        height: 1.6,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _buildDesktopBadge(
                            Icons.qr_code_2_rounded, 'RFID ট্র্যাকিং'),
                        _buildDesktopBadge(
                            Icons.bolt_rounded, 'তাৎক্ষণিক ইস্যু'),
                        _buildDesktopBadge(
                            Icons.cloud_sync_rounded, '১০০% অটোমেশন'),
                      ],
                    ),
                  ],
                ),

                // Footer
                Text(
                  AppStrings.copyrightInfo,
                  style: AppStyles.footerText.copyWith(color: Colors.white54),
                ),
              ],
            ),
          ),
        ),

        // Right Column: Light Form
        Expanded(
          flex: 6,
          child: Scaffold(
            backgroundColor: AppColors.loginScaffoldBg,
            body: SafeArea(
              child: Column(
                children: [
                  _buildAppBar(context),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: MaxWidthContainer(
                        maxWidth: 480,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Column(
                          children: [
                            const LoginHeaderWidget(),
                            const SizedBox(height: 22),
                            RoleToggleWidget(controller: controller),
                            const SizedBox(height: 18),
                            LoginFormCard(controller: controller),
                            const SizedBox(height: 16),
                            SmartCardActionCard(controller: controller),
                            const SizedBox(height: 20),
                            _buildDividerWithText(),
                            const SizedBox(height: 16),
                            _buildEduIdButton(controller),
                            const SizedBox(height: 18),
                            _buildRegistrationPrompt(controller),
                            const SizedBox(height: 22),
                            const HelpDeskCard(),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildDesktopBadge(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF48ECD1)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Top App Bar
  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.transparent,
      child: Row(
        children: [
          // Back button
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: AppColors.slateHeading,
              size: 24,
            ),
            tooltip: 'পেছনে যান',
          ),

          // Title: Student Sso Login
          Expanded(
            child: Text(
              AppStrings.ssoLoginTitle,
              textAlign: TextAlign.center,
              style: AppStyles.appBarTitle,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // User Profile Avatar
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: AppColors.navyPrimary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_rounded,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Divider with "অথবা ইউনিভার্সিটি পোর্টাল দিয়ে"
  Widget _buildDividerWithText() {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFFE2E8F0),
            thickness: 1,
          ),
        ),
        Flexible(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                AppStrings.orUniversityPortal,
                style: AppStyles.dividerText,
              ),
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xFFE2E8F0),
            thickness: 1,
          ),
        ),
      ],
    );
  }

  // University EduID Button
  Widget _buildEduIdButton(AuthController controller) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: controller.loginWithEduId,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_balance_outlined,
                size: 20,
                color: AppColors.navyDark,
              ),
              const SizedBox(width: 10),
              Text(
                AppStrings.eduIdButton,
                style: AppStyles.eduIdButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Registration prompt
  Widget _buildRegistrationPrompt(AuthController controller) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.newStudentPrompt,
            style: AppStyles.registerPrompt,
          ),
          GestureDetector(
            onTap: controller.showAccountActivation,
            child: Text(
              AppStrings.activateAccount,
              style: AppStyles.registerAction,
            ),
          ),
        ],
      ),
    );
  }
}
