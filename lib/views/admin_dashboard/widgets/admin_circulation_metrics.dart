import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';

class AdminCirculationMetrics extends StatelessWidget {
  final bool isTablet;

  const AdminCirculationMetrics({super.key, this.isTablet = false});

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
                  Icons.insights_rounded,
                  color: AppColors.navyPrimary,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.circulationMetricsTitle,
                  style: TextStyle(
                    fontSize: isTablet ? 15.5 : 14.0,
                    fontWeight: FontWeight.w800,
                    color: AppColors.slateHeading,
                  ),
                ),
              ],
            ),
            Text(
              AppStrings.updated2MinsAgo,
              style: TextStyle(
                fontSize: isTablet ? 11.5 : 10.5,
                color: AppColors.slateSubtitle,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Grid (2x2 on Mobile, 4x1 on Tablet/Desktop)
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 580;

            if (isWide) {
              return Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      label: AppStrings.totalCatalog,
                      value: AppStrings.isEnglish ? '24,850' : '২৪,৮৫০',
                      subNote: AppStrings.isEnglish ? '↑ +100 New added' : '↑ +১০০ টি নতুন সংযোজন',
                      subNoteColor: const Color(0xFF16A34A),
                      icon: Icons.collections_bookmark_outlined,
                      iconBg: const Color(0xFFEFF6FF),
                      iconColor: const Color(0xFF2563EB),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildMetricCard(
                      label: AppStrings.borrowedBooks,
                      value: AppStrings.isEnglish ? '1,420 Books' : '১,৪২০ টি',
                      subNote: AppStrings.isEnglish ? '● 87% on-time return rate' : '● ৮৭% সময়মতো রিটার্ন রেট',
                      subNoteColor: const Color(0xFF16A34A),
                      icon: Icons.menu_book_rounded,
                      iconBg: const Color(0xFFCCFBF1),
                      iconColor: const Color(0xFF0D9488),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildMetricCard(
                      label: AppStrings.overdue,
                      value: AppStrings.isEnglish ? '36 Books' : '৩৬ টি',
                      valueColor: const Color(0xFFDC2626),
                      subNote: AppStrings.isEnglish ? '⚠ Today notice recipients' : '⚠ আজকেই নোটিশ প্রাপক',
                      subNoteColor: const Color(0xFFDC2626),
                      icon: Icons.warning_amber_rounded,
                      iconBg: const Color(0xFFFEE2E2),
                      iconColor: const Color(0xFFDC2626),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildMetricCard(
                      label: AppStrings.collectedFine,
                      value: AppStrings.isEnglish ? '৳ 3,750' : '৳ ৩,৭৫০',
                      subNote: AppStrings.isEnglish ? 'Pending: ৳ 1,200' : 'বকেয়া: ৳ ১,২০০',
                      subNoteColor: const Color(0xFFD97706),
                      icon: Icons.payments_outlined,
                      iconBg: const Color(0xFFFEF3C7),
                      iconColor: const Color(0xFFD97706),
                    ),
                  ),
                ],
              );
            }

            // Mobile 2x2 Grid
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        label: AppStrings.totalCatalog,
                        value: AppStrings.isEnglish ? '24,850' : '২৪,৮৫০',
                        subNote: AppStrings.isEnglish ? '↑ +100 New added' : '↑ +১০০ টি নতুন সংযোজন',
                        subNoteColor: const Color(0xFF16A34A),
                        icon: Icons.collections_bookmark_outlined,
                        iconBg: const Color(0xFFEFF6FF),
                        iconColor: const Color(0xFF2563EB),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildMetricCard(
                        label: AppStrings.borrowedBooks,
                        value: AppStrings.isEnglish ? '1,420 Books' : '১,৪২০ টি',
                        subNote: AppStrings.isEnglish ? '● 87% on-time return rate' : '● ৮৭% সময়মতো রিটার্ন রেট',
                        subNoteColor: const Color(0xFF16A34A),
                        icon: Icons.menu_book_rounded,
                        iconBg: const Color(0xFFCCFBF1),
                        iconColor: const Color(0xFF0D9488),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        label: AppStrings.overdue,
                        value: AppStrings.isEnglish ? '36 Books' : '৩৬ টি',
                        valueColor: const Color(0xFFDC2626),
                        subNote: AppStrings.isEnglish ? '⚠ Today notice recipients' : '⚠ আজকেই নোটিশ প্রাপক',
                        subNoteColor: const Color(0xFFDC2626),
                        icon: Icons.warning_amber_rounded,
                        iconBg: const Color(0xFFFEE2E2),
                        iconColor: const Color(0xFFDC2626),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildMetricCard(
                        label: AppStrings.collectedFine,
                        value: AppStrings.isEnglish ? '৳ 3,750' : '৳ ৩,৭৫০',
                        subNote: AppStrings.isEnglish ? 'Pending: ৳ 1,200' : 'বকেয়া: ৳ ১,২০০',
                        subNoteColor: const Color(0xFFD97706),
                        icon: Icons.payments_outlined,
                        iconBg: const Color(0xFFFEF3C7),
                        iconColor: const Color(0xFFD97706),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required String label,
    required String value,
    Color? valueColor,
    required String subNote,
    required Color subNoteColor,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 14 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
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
          // Top Icon & Label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF475569),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 16),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // Stat Value
          Text(
            value,
            style: TextStyle(
              fontSize: isTablet ? 20 : 18,
              fontWeight: FontWeight.w900,
              color: valueColor ?? AppColors.slateHeading,
            ),
          ),

          const SizedBox(height: 4),

          // Sub Note
          Text(
            subNote,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: subNoteColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
