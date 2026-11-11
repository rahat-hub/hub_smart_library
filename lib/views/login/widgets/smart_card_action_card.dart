import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/auth_controller.dart';

class SmartCardActionCard extends StatelessWidget {
  final AuthController controller;

  const SmartCardActionCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.scanSmartCard,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.smartCardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFDBEAFE),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Barcode / RFID Icon Container
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFDBEAFE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.qr_code_scanner_rounded,
                size: 24,
                color: Color(0xFF1E40AF),
              ),
            ),
            const SizedBox(width: 14),

            // Text Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.smartCardTitle,
                    style: AppStyles.smartCardTitle,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    AppStrings.smartCardSubtitle,
                    style: AppStyles.smartCardSubtitle,
                  ),
                ],
              ),
            ),

            // Scan > Button
            Row(
              children: [
                Text(
                  AppStrings.scanText,
                  style: AppStyles.scanAction,
                ),
                const SizedBox(width: 2),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 13,
                  color: AppColors.navyPrimary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
