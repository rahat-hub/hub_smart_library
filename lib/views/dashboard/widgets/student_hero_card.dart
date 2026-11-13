import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/dashboard_controller.dart';

class StudentHeroCard extends StatelessWidget {
  final DashboardController controller;
  final bool isTablet;

  const StudentHeroCard({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isTablet ? 24.0 : 20.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0B254E),
            Color(0xFF103A6F),
            Color(0xFF0C5668),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0B254E).withValues(alpha: 0.28),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: EdgeInsets.all(isTablet ? 24.0 : 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Academic Session Tag & Digital Pass Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Academic Session Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.18),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF38BDF8),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'একাডেমিক সেশন ২০২৪-২৫',
                      style: AppStyles.heroSessionTag,
                    ),
                  ],
                ),
              ),

              // Digital Pass Action Button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: controller.showDigitalPassDialog,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.22),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.qr_code_2_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          AppStrings.digitalPass,
                          style: AppStyles.digitalPassButton,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Greeting: স্বাগতম, তানভীর আহমেদ!
          Obx(
            () => Text(
              'স্বাগতম, ${controller.studentName.value}!',
              style: isTablet
                  ? AppStyles.heroGreetingTablet
                  : AppStyles.heroGreeting,
            ),
          ),

          const SizedBox(height: 4),

          // Subtitle: STUDENT ID: CSE-2021-042
          Obx(
            () => Text(
              'STUDENT ID: ${controller.studentId.value}',
              style: AppStyles.heroStudentId,
            ),
          ),

          SizedBox(height: isTablet ? 20.0 : 16.0),

          // Bottom Stats Row: 2 Glassmorphic Cards
          Row(
            children: [
              // Stat 1: বর্তমানে ধার নেওয়া (Currently Borrowed)
              Expanded(
                child: _buildGlassStatCard(
                  icon: Icons.auto_stories_rounded,
                  label: AppStrings.currentlyBorrowed,
                  valueWidget: Obx(
                    () => Text(
                      '${controller.borrowedCount.value}টি বই',
                      style: AppStyles.heroStatValue,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Stat 2: বকেয়া লেট ফি (Pending Late Fee)
              Expanded(
                child: _buildGlassStatCard(
                  icon: Icons.payments_outlined,
                  label: AppStrings.pendingLateFee,
                  valueWidget: Obx(
                    () => Text(
                      controller.pendingFine.value,
                      style: AppStyles.heroStatValue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGlassStatCard({
    required IconData icon,
    required String label,
    required Widget valueWidget,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 14.0 : 11.0,
        vertical: isTablet ? 12.0 : 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.16),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF67E8F9),
              size: isTablet ? 22 : 18,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppStyles.heroStatLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                valueWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
