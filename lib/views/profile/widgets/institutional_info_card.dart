import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/profile_controller.dart';
import '../../../models/profile_model.dart';

class InstitutionalInfoCard extends StatelessWidget {
  final ProfileModel profile;
  final ProfileController controller;
  final bool isTablet;

  const InstitutionalInfoCard({
    super.key,
    required this.profile,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(isTablet ? 18.0 : 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header: Title & Edit Action
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.institutionalInfoTitle,
                style: TextStyle(
                  color: AppColors.slateHeading,
                  fontSize: isTablet ? 15.5 : 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: controller.showEditInfoDialog,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.edit_outlined,
                        size: 15,
                        color: AppColors.slateSubtitle,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        AppStrings.editAction,
                        style: TextStyle(
                          color: AppColors.slateSubtitle,
                          fontSize: isTablet ? 12.5 : 11.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          const SizedBox(height: 12),

          // 2. Institutional Email Row
          Row(
            children: [
              Container(
                width: isTablet ? 40 : 36,
                height: isTablet ? 40 : 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.mail_outline_rounded,
                  color: AppColors.navyPrimary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.institutionalEmailLabel,
                      style: TextStyle(
                        fontSize: isTablet ? 12 : 11,
                        color: AppColors.slateSubtitle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      profile.institutionalEmail,
                      style: TextStyle(
                        fontSize: isTablet ? 14 : 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                    ),
                  ],
                ),
              ),
              // Verified Checkmark
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF10B981), width: 1.5),
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_rounded,
                    color: Color(0xFF10B981),
                    size: 14,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // 3. Mobile Number Row
          Row(
            children: [
              Container(
                width: isTablet ? 40 : 36,
                height: isTablet ? 40 : 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.phone_outlined,
                  color: AppColors.navyPrimary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.mobileNumberLabel,
                      style: TextStyle(
                        fontSize: isTablet ? 12 : 11,
                        color: AppColors.slateSubtitle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      profile.mobileNumber,
                      style: TextStyle(
                        fontSize: isTablet ? 14 : 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                    ),
                  ],
                ),
              ),

              // SMS Alert Active Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  AppStrings.smsAlertActiveTag,
                  style: TextStyle(
                    fontSize: isTablet ? 11 : 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.slateSubtitle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
