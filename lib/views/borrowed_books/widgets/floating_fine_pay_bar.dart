import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/borrowed_books_controller.dart';

class FloatingFinePayBar extends StatelessWidget {
  final BorrowedBooksController controller;
  final bool isTablet;

  const FloatingFinePayBar({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Only show if there is fine or display always matching the design
      final hasFine = controller.totalPendingFine.value > 0;

      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 20.0 : 16.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF0C2B59),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.22),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: Total Fine Label & Amount
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.totalFinePayLabel,
                  style: AppStyles.floatingTotalLabel,
                ),
                const SizedBox(height: 1),
                Text(
                  controller.totalFineBengali,
                  style: AppStyles.floatingTotalAmount.copyWith(
                    color: hasFine ? Colors.white : const Color(0xFF34D399),
                    fontSize: isTablet ? 20.0 : 18.0,
                  ),
                ),
              ],
            ),

            // Right: Pay Fine Button
            ElevatedButton.icon(
              onPressed: controller.payFineModal,
              icon: Icon(
                hasFine ? Icons.lock_outline_rounded : Icons.check_circle_outline_rounded,
                size: 17,
                color: Colors.white,
              ),
              label: Text(
                hasFine ? AppStrings.payFineButton : 'পরিশোধিত',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet ? 13.5 : 12.5,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: hasFine ? AppColors.payFineRed : const Color(0xFF059669),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 18.0 : 14.0,
                  vertical: 11.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
