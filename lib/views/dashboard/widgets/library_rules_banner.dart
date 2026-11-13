import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/dashboard_controller.dart';

class LibraryRulesBanner extends StatelessWidget {
  final DashboardController controller;
  final bool isTablet;

  const LibraryRulesBanner({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: controller.showLibraryRulesDialog,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 20.0 : 16.0,
            vertical: isTablet ? 18.0 : 14.0,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFFDCE7F6),
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              // Left Teal Shield Icon
              Container(
                width: isTablet ? 46 : 42,
                height: isTablet ? 46 : 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF99F6E4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.security_rounded,
                    color: Color(0xFF0F766E),
                    size: 22,
                  ),
                ),
              ),

              const SizedBox(width: 14),

              // Middle Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.libraryRulesTitle,
                      style: AppStyles.rulesBannerTitle.copyWith(
                        fontSize: isTablet ? 15.5 : 14.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppStrings.libraryRulesSubtitle,
                      style: AppStyles.rulesBannerSubtitle.copyWith(
                        fontSize: isTablet ? 12.5 : 12.0,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // Right Arrow Button
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.slateHeading,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
