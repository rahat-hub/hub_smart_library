import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/admin_dashboard_controller.dart';
import '../../../models/admin_dashboard_model.dart';

class AdminAuditFeedCard extends StatelessWidget {
  final AdminDashboardController controller;
  final bool isTablet;

  const AdminAuditFeedCard({
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.history_rounded,
                  color: AppColors.navyPrimary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.auditFeedTitle,
                  style: TextStyle(
                    fontSize: isTablet ? 15.5 : 14.0,
                    fontWeight: FontWeight.w800,
                    color: AppColors.slateHeading,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFDBEAFE)),
              ),
              child: Text(
                AppStrings.realtimeBadge,
                style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.bold,
                  color: AppColors.linkBlue,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // White Container with transactions
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(isTablet ? 16 : 12),
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
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.auditTransactions.length,
            separatorBuilder: (_, _) => const Divider(height: 18, color: Color(0xFFF1F5F9)),
            itemBuilder: (context, index) {
              final tx = controller.auditTransactions[index];
              return _buildTransactionItem(tx);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(AuditTransactionItem tx) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rounded icon container
        Container(
          width: isTablet ? 38 : 34,
          height: isTablet ? 38 : 34,
          decoration: BoxDecoration(
            color: tx.iconBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            tx.icon,
            color: tx.iconColor,
            size: isTablet ? 20 : 18,
          ),
        ),

        const SizedBox(width: 10),

        // Text Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title + Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      tx.title,
                      style: TextStyle(
                        fontSize: isTablet ? 13.5 : 12.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    tx.timeAgo,
                    style: const TextStyle(
                      fontSize: 10.5,
                      color: AppColors.slateSubtitle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),

              // Subtitle
              Text(
                tx.subtitle,
                style: TextStyle(
                  fontSize: isTablet ? 12 : 11,
                  color: AppColors.slateSubtitle,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
