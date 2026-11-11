import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/splash_controller.dart';

class SyncProgressWidget extends StatelessWidget {
  final SplashController controller;

  const SyncProgressWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final double progress = controller.syncProgress.value.clamp(0.0, 1.0);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Icon + Label + Percentage
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.sync_rounded,
                      size: 16,
                      color: Color(0xFF7DD3FC),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        AppStrings.databaseSyncText,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.syncTitle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                controller.syncPercentageText,
                style: AppStyles.syncPercentage,
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Custom Glowing Progress Bar
          Container(
            height: 5.5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: progress,
                  heightFactor: 1.0,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF2DD4BF),
                          Color(0xFF38BDF8),
                          Color(0xFF5EEAD4),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mintAccent.withValues(alpha: 0.5),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
