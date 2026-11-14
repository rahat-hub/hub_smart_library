import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';

class PolicyTermsCard extends StatelessWidget {
  final bool isTablet;

  const PolicyTermsCard({
    super.key,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isTablet ? 16.0 : 13.0),
      decoration: BoxDecoration(
        color: AppColors.promoBannerBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.promoBannerBorder, width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Shield Icon Box
          Container(
            width: isTablet ? 40 : 36,
            height: isTablet ? 40 : 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.security_rounded,
                color: Color(0xFF0F766E),
                size: 20,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Right: Policy texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.policyTitle,
                  style: AppStyles.policyTitle.copyWith(
                    fontSize: isTablet ? 14.5 : 13.0,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  AppStrings.policyDescription,
                  style: AppStyles.policyBody.copyWith(
                    fontSize: isTablet ? 12.5 : 11.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
