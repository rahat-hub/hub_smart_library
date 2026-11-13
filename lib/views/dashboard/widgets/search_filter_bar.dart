import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/dashboard_controller.dart';

class SearchFilterBar extends StatelessWidget {
  final DashboardController controller;
  final bool isTablet;

  const SearchFilterBar({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          const Icon(
            Icons.search_rounded,
            color: Color(0xFF94A3B8),
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller.searchController,
              onChanged: controller.onSearchChanged,
              style: AppStyles.searchInput,
              decoration: InputDecoration(
                hintText: AppStrings.searchBooksHint,
                hintStyle: AppStyles.searchHint,
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Voice search action
            },
            icon: const Icon(
              Icons.mic_none_rounded,
              color: Color(0xFF64748B),
              size: 20,
            ),
            splashRadius: 20,
            tooltip: 'ভয়েস সার্চ',
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: () {
              // Filter / Tune options
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.tune_rounded,
                color: AppColors.navyPrimary,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
