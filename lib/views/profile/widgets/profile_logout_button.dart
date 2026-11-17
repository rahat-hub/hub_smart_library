import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/profile_controller.dart';

class ProfileLogoutButton extends StatelessWidget {
  final ProfileController controller;
  final bool isTablet;

  const ProfileLogoutButton({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logout Button
        SizedBox(
          width: double.infinity,
          height: isTablet ? 50 : 46,
          child: ElevatedButton(
            onPressed: controller.logout,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.dangerLogoutBg,
              foregroundColor: AppColors.dangerLogoutText,
              elevation: 0,
              side: const BorderSide(
                color: AppColors.dangerLogoutBorder,
                width: 1.2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.logout_rounded,
                  color: AppColors.dangerLogoutText,
                  size: 19,
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.logOutButton,
                  style: TextStyle(
                    fontSize: isTablet ? 14.5 : 13.5,
                    fontWeight: FontWeight.bold,
                    color: AppColors.dangerLogoutText,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // System Version & Copyright Footer Text
        Text(
          AppStrings.appVersionBuild,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isTablet ? 11.5 : 10.5,
            color: AppColors.slateMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          AppStrings.copyrightCentralLibrary,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isTablet ? 11 : 10,
            color: AppColors.slateMuted,
          ),
        ),
      ],
    );
  }
}
