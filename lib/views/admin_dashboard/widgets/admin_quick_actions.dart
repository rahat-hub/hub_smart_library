import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/admin_dashboard_controller.dart';

class AdminQuickActions extends StatelessWidget {
  final AdminDashboardController controller;
  final bool isTablet;

  const AdminQuickActions({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header Row
        Row(
          children: [
            const Icon(
              Icons.bolt_rounded,
              color: Color(0xFF2563EB),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              AppStrings.quickActionsTitle,
              style: TextStyle(
                fontSize: isTablet ? 15.5 : 14.0,
                fontWeight: FontWeight.w800,
                color: AppColors.slateHeading,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Quick Actions Card
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 24 : 14,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 1. Issue Book
              _buildActionButton(
                label: AppStrings.actionIssue,
                icon: Icons.assignment_turned_in_rounded,
                bgColor: const Color(0xFF0F2B5C),
                iconColor: Colors.white,
                onTap: controller.quickActionIssue,
              ),

              // 2. Return Book
              _buildActionButton(
                label: AppStrings.actionReturn,
                icon: Icons.assignment_returned_rounded,
                bgColor: const Color(0xFF0D9488),
                iconColor: Colors.white,
                onTap: controller.quickActionReturn,
              ),

              // 3. Scanner
              _buildActionButton(
                label: AppStrings.actionScanner,
                icon: Icons.qr_code_scanner_rounded,
                bgColor: const Color(0xFF6366F1),
                iconColor: Colors.white,
                onTap: controller.quickActionScan,
              ),

              // 4. New Book
              _buildActionButton(
                label: AppStrings.actionNewBook,
                icon: Icons.add_box_rounded,
                bgColor: const Color(0xFFD97706),
                iconColor: Colors.white,
                onTap: controller.quickActionAddBook,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color bgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isTablet ? 52 : 46,
            height: isTablet ? 52 : 46,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: bgColor.withValues(alpha: 0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: isTablet ? 24 : 22,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: isTablet ? 12.5 : 11.5,
              fontWeight: FontWeight.bold,
              color: AppColors.slateHeading,
            ),
          ),
        ],
      ),
    );
  }
}
