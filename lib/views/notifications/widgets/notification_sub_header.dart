import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/notification_controller.dart';

class NotificationSubHeader extends StatelessWidget {
  final NotificationController controller;
  final bool isTablet;

  const NotificationSubHeader({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left: Green dot + Updates count
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: AppColors.availableGreenText,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 7),
              Text(
                controller.unreadCount > 0
                    ? '${_toBengaliNumber(controller.unreadCount)}টি নতুন আপডেট'
                    : 'সব আপডেট পড়া হয়েছে',
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.availableGreenText,
                ),
              ),
            ],
          ),
        ),

        // Right: "✓✓ সব পড়া হয়েছে" Action Button
        InkWell(
          onTap: controller.markAllAsRead,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.5),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFDBEAFE)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.done_all_rounded,
                  size: 15,
                  color: AppColors.linkBlue,
                ),
                const SizedBox(width: 5),
                Text(
                  AppStrings.markAllRead,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.linkBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _toBengaliNumber(int num) {
    const map = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };
    return num.toString().split('').map((e) => map[e] ?? e).join('');
  }
}
