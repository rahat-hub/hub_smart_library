import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // University Emblem / Shield
        Center(
          child: SizedBox(
            width: 78,
            height: 78,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Main Navy Container
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: AppColors.navyPrimary,
                    borderRadius: BorderRadius.circular(22),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF1E3A8A),
                        Color(0xFF172554),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1E3A8A).withValues(alpha: 0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.menu_book_rounded,
                          size: 34,
                          color: Colors.white,
                        ),
                        Positioned(
                          top: 13,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFF5EEAD4),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Mini Graduation Badge on bottom-right
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: const Color(0xFF48ECD1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.school_rounded,
                      size: 14,
                      color: Color(0xFF0F2653),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // University Badge Text
        Text(
          AppStrings.universityBadge,
          textAlign: TextAlign.center,
          style: AppStyles.universityBadge,
        ),

        const SizedBox(height: 6),

        // Swagatom! Heading
        Text(
          AppStrings.welcomeHeading,
          textAlign: TextAlign.center,
          style: AppStyles.welcomeHeading,
        ),

        const SizedBox(height: 8),

        // Subtitle Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppStrings.loginSubtitle,
            textAlign: TextAlign.center,
            style: AppStyles.loginSubtitle,
          ),
        ),
      ],
    );
  }
}
