import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/admin_dashboard_controller.dart';
import '../../../models/admin_dashboard_model.dart';

class AdminInventoryCapacityCard extends StatelessWidget {
  final AdminDashboardController controller;
  final bool isTablet;

  const AdminInventoryCapacityCard({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isTablet ? 18 : 14),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Title + Subtitle + Pie icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.inventoryCapacityTitle,
                    style: TextStyle(
                      fontSize: isTablet ? 15.5 : 14.0,
                      fontWeight: FontWeight.w800,
                      color: AppColors.slateHeading,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    AppStrings.departmentalRatioSub,
                    style: TextStyle(
                      fontSize: isTablet ? 12 : 11,
                      color: AppColors.slateSubtitle,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.pie_chart_outline_rounded,
                  color: AppColors.navyPrimary,
                  size: 20,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Departmental Progress Bars
          ...controller.departmentCapacities.map((item) => _buildDeptBar(item)),
        ],
      ),
    );
  }

  Widget _buildDeptBar(DepartmentCapacityItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name + Percentage & Copies
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  item.department,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    color: AppColors.slateHeading,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${AppStrings.formatNumber(item.percentage)}% বরাদ্দ (${item.copiesAllocated})',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: item.barColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // Progress Track
          Stack(
            children: [
              Container(
                height: 7,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                widthFactor: item.progress,
                child: Container(
                  height: 7,
                  decoration: BoxDecoration(
                    color: item.barColor,
                    borderRadius: BorderRadius.circular(10),
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
