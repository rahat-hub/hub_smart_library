import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../models/notification_model.dart';
import '../routes/app_routes.dart';

class NotificationController extends GetxController {
  final RxString selectedFilter = AppStrings.filterAllNotifications.obs;
  late RxList<NotificationModel> notifications;

  final List<String> filterOptions = [
    AppStrings.filterAllNotifications,
    AppStrings.filterRequestStatus,
    AppStrings.filterReturnAlert,
    AppStrings.filterFine,
  ];

  @override
  void onInit() {
    super.onInit();
    notifications = NotificationModel.getSampleNotifications().obs;
  }

  int get unreadCount => notifications.where((n) => !n.isRead).length;

  List<NotificationModel> get filteredNotifications {
    final filter = selectedFilter.value;
    if (filter == AppStrings.filterAllNotifications) {
      return notifications;
    }
    return notifications.where((n) => n.categoryFilter == filter).toList();
  }

  void selectFilter(String filter) {
    selectedFilter.value = filter;
  }

  void markAllAsRead() {
    for (var i = 0; i < notifications.length; i++) {
      notifications[i].isRead = true;
    }
    notifications.refresh();

    Get.snackbar(
      'সব নোটিফিকেশন পড়া হয়েছে',
      'আপনার সব নোটিফিকেশন রিড হিসেবে চিহ্নিত করা হয়েছে।',
      backgroundColor: AppColors.navyPrimary,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  // 1. Show Collection Token Modal
  void showTokenModal(NotificationModel notif) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1FAE5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.confirmation_number_outlined,
                    color: Color(0xFF059669),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'বই সংগ্রহের ডিজিটাল টোকেন',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                    ),
                    Text(
                      'কাউন্টার-২ তে এই টোকেনটি প্রদর্শন করুন',
                      style: TextStyle(fontSize: 12, color: AppColors.slateSubtitle),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0C2B59),
                    Color(0xFF13366C),
                  ],
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0C2B59).withValues(alpha: 0.2),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'COLLECTION TOKEN',
                        style: TextStyle(
                          color: Color(0xFF7DD3FC),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF059669),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'অনুমোদিত (Valid)',
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    notif.token ?? '#REQ-4912',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3.0,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    notif.bookTitle ?? 'Data Structures and Algorithms',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFE2E8F0),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.qr_code_2_rounded,
                      size: 80,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'কাউন্টার: সেন্ট্রাল লাইব্রেরি ২ • মেয়াদ: আগামী ২৪ ঘণ্টা',
                    style: TextStyle(color: Color(0xFF93C5FD), fontSize: 11),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyPrimary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('বন্ধ করুন', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  // 2. Renew from notification
  void renewFromNotification(NotificationModel notif) {
    Get.snackbar(
      'রিনিউ সম্পন্ন হয়েছে',
      '${notif.bookTitle} বইটির মেয়াদ আরও ১৪ দিন বৃদ্ধি করা হয়েছে।',
      backgroundColor: AppColors.navyPrimary,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
    );
  }

  // 3. Pay fine directly or route to fine payment
  void payFineFromNotification(NotificationModel notif) {
    Get.toNamed(AppRoutes.borrowedBooks);
  }

  // 4. Explore new arrivals
  void exploreNewArrivals() {
    Get.offNamed(AppRoutes.dashboard);
  }
}
