import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/admin_dashboard_controller.dart';

class AdminBottomNav extends StatelessWidget {
  final AdminDashboardController controller;
  final bool isTablet;

  const AdminBottomNav({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
        border: const Border(
          top: BorderSide(color: Color(0xFFF1F5F9), width: 1.2),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Container(
          height: 64,
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 60.0 : 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                index: 0,
                icon: Icons.grid_view_rounded,
                label: AppStrings.adminNavDashboard,
              ),
              _buildNavItem(
                index: 1,
                icon: Icons.auto_stories_outlined,
                label: AppStrings.adminNavInventory,
              ),
              _buildNavItem(
                index: 2,
                icon: Icons.desk_outlined,
                label: AppStrings.adminNavDesk,
              ),
              _buildNavItem(
                index: 3,
                icon: Icons.people_outline_rounded,
                label: AppStrings.adminNavMembers,
              ),
              _buildNavItem(
                index: 4,
                icon: Icons.bar_chart_rounded,
                label: AppStrings.adminNavReports,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    return Obx(() {
      final isActive = controller.activeNavIndex.value == index;

      return InkWell(
        onTap: () => controller.switchNavTab(index),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isActive ? AppColors.navyPrimary : const Color(0xFF94A3B8),
                size: isTablet ? 24 : 22,
              ),
              const SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  fontSize: isTablet ? 12 : 11,
                  fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
                  color: isActive ? AppColors.navyPrimary : const Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
