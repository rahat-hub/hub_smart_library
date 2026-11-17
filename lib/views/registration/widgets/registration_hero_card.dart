import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';

class RegistrationHeroCard extends StatelessWidget {
  final bool isTablet;

  const RegistrationHeroCard({super.key, this.isTablet = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF5FF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFDBEAFE), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2563EB).withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Icon inside dark navy rounded container
          Container(
            width: isTablet ? 50 : 44,
            height: isTablet ? 50 : 44,
            decoration: BoxDecoration(
              color: const Color(0xFF0F2B5C),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.badge_outlined,
              color: Colors.white,
              size: isTablet ? 24 : 22,
            ),
          ),

          const SizedBox(width: 14),

          // Right Column: Badge, Title, Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Session pill badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFBBF7D0)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF16A34A),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        AppStrings.regHeroBadge.replaceAll('• ', ''),
                        style: TextStyle(
                          fontSize: isTablet ? 11.5 : 10.5,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF15803D),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Main Title
                Text(
                  AppStrings.regHeroTitle,
                  style: TextStyle(
                    fontSize: isTablet ? 17.5 : 15.5,
                    fontWeight: FontWeight.w800,
                    color: AppColors.slateHeading,
                    height: 1.25,
                  ),
                ),

                const SizedBox(height: 4),

                // Subtitle
                Text(
                  AppStrings.regHeroSubtitle,
                  style: TextStyle(
                    fontSize: isTablet ? 12.5 : 11.5,
                    color: const Color(0xFF475569),
                    height: 1.4,
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
