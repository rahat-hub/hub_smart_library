import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/profile_controller.dart';
import '../../../routes/app_routes.dart';

class LibraryServicesCard extends StatelessWidget {
  final ProfileController controller;
  final bool isTablet;

  const LibraryServicesCard({
    super.key,
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
          // Section Title
          Text(
            AppStrings.libraryServicesHeader,
            style: TextStyle(
              color: AppColors.slateHeading,
              fontSize: isTablet ? 15.5 : 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),

          // 1. Borrowed Books & History
          _buildServiceTile(
            icon: Icons.menu_book_rounded,
            iconColor: const Color(0xFF2563EB),
            iconBg: const Color(0xFFEFF6FF),
            title: AppStrings.borrowedHistoryTitle,
            subtitle: AppStrings.borrowedHistorySub,
            trailingBadge: AppStrings.active3Badge,
            trailingBadgeBg: const Color(0xFFEFF6FF),
            trailingBadgeColor: AppColors.linkBlue,
            onTap: () => Get.toNamed(AppRoutes.borrowedBooks),
            isTablet: isTablet,
          ),

          const Divider(height: 1, color: Color(0xFFF8FAFC)),

          // 2. Fine & Payment History
          _buildServiceTile(
            icon: Icons.payment_rounded,
            iconColor: const Color(0xFF0D9488),
            iconBg: const Color(0xFFCCFBF1),
            title: AppStrings.finePaymentHistoryTitle,
            subtitle: AppStrings.finePaymentHistorySub,
            trailingBadge: AppStrings.zeroFineBadge,
            trailingBadgeBg: const Color(0xFFF1F5F9),
            trailingBadgeColor: AppColors.slateSubtitle,
            onTap: controller.showPaymentHistoryModal,
            isTablet: isTablet,
          ),

          const Divider(height: 1, color: Color(0xFFF8FAFC)),

          // 3. Wishlist
          _buildServiceTile(
            icon: Icons.favorite_border_rounded,
            iconColor: const Color(0xFFEC4899),
            iconBg: const Color(0xFFFCE7F3),
            title: AppStrings.wishlistTitle,
            subtitle: AppStrings.wishlistSub,
            trailingBadge: AppStrings.wishlist5Badge,
            trailingBadgeBg: const Color(0xFFF1F5F9),
            trailingBadgeColor: AppColors.slateSubtitle,
            onTap: controller.showWishlistModal,
            isTablet: isTablet,
          ),

          const Divider(height: 1, color: Color(0xFFF8FAFC)),

          // 4. Notifications & Alerts
          _buildServiceTile(
            icon: Icons.notifications_none_rounded,
            iconColor: const Color(0xFF8B5CF6),
            iconBg: const Color(0xFFF3E8FF),
            title: AppStrings.notifSettingsTitle,
            subtitle: AppStrings.notifSettingsSub,
            onTap: () => Get.toNamed(AppRoutes.notifications),
            isTablet: isTablet,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceTile({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    String? trailingBadge,
    Color? trailingBadgeBg,
    Color? trailingBadgeColor,
    required VoidCallback onTap,
    required bool isTablet,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Row(
          children: [
            Container(
              width: isTablet ? 38 : 34,
              height: isTablet ? 38 : 34,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: isTablet ? 20 : 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isTablet ? 14 : 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.slateHeading,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: isTablet ? 12 : 11,
                      color: AppColors.slateSubtitle,
                    ),
                  ),
                ],
              ),
            ),
            if (trailingBadge != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: trailingBadgeBg,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  trailingBadge,
                  style: TextStyle(
                    color: trailingBadgeColor,
                    fontSize: isTablet ? 11.5 : 10.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 4),
            ],
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.slateMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
