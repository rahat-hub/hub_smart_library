import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/profile_controller.dart';

class ProfileHelpdeskBanner extends StatelessWidget {
  final ProfileController controller;
  final bool isTablet;

  const ProfileHelpdeskBanner({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isTablet ? 16.0 : 13.0),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDBEAFE), width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Headset Icon
          Container(
            width: isTablet ? 42 : 38,
            height: isTablet ? 42 : 38,
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
                Icons.support_agent_rounded,
                color: AppColors.navyPrimary,
                size: 22,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Middle Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.helpdeskAndComplaints,
                  style: TextStyle(
                    fontSize: isTablet ? 14 : 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.slateHeading,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  AppStrings.directChatHotline,
                  style: TextStyle(
                    fontSize: isTablet ? 12 : 11,
                    color: AppColors.slateSubtitle,
                  ),
                ),
              ],
            ),
          ),

          // Right Phone Call Button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: controller.callHelpdesk,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: isTablet ? 40 : 36,
                height: isTablet ? 40 : 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFBFDBFE)),
                ),
                child: const Icon(
                  Icons.phone_in_talk_rounded,
                  color: AppColors.navyPrimary,
                  size: 19,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
