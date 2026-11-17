import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../models/admin_dashboard_model.dart';
import '../models/book_model.dart';
import '../routes/app_routes.dart';

class AdminDashboardController extends GetxController {
  final RxInt activeNavIndex = 0.obs;
  final RxString searchQuery = ''.obs;
  late TextEditingController searchController;

  // Live Queue Requests
  late RxList<LiveQueueItem> liveQueueRequests;

  // Urgent Overdue Alerts
  late RxList<OverdueAlertItem> overdueAlerts;

  // Department Capacity List
  late List<DepartmentCapacityItem> departmentCapacities;

  // Audit Transactions List
  late RxList<AuditTransactionItem> auditTransactions;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();

    liveQueueRequests = <LiveQueueItem>[
      LiveQueueItem(
        id: 'req_1',
        bookTitle: 'Data Structures & Algorithms in...',
        studentName: 'তানভীর আহমেদ',
        studentId: 'CSE-2021-042',
        copyTag: 'কপি #০৪ • শেলফ CS-02',
        timeAgo: '১৫ মিনিট আগে',
        coverStyle: BookCoverStyle.dataIntensive,
      ),
      LiveQueueItem(
        id: 'req_2',
        bookTitle: 'Electric Circuits (10th Ed)',
        studentName: 'নুসরাত জাহান',
        studentId: 'EEE-2022-019',
        copyTag: 'কপি #০৭ • শেলফ EE-06',
        timeAgo: '৩২ মিনিট আগে',
        coverStyle: BookCoverStyle.algorithmsClrs,
      ),
    ].obs;

    overdueAlerts = <OverdueAlertItem>[
      OverdueAlertItem(
        id: 'ovd_1',
        studentName: 'রফিকুল ইসলাম',
        studentRoll: 'BBA-2020-088',
        bookTitle: 'Principles of Financial Accounting',
        overdueDays: 9,
        fineAmount: 45.0,
      ),
    ].obs;

    departmentCapacities = [
      DepartmentCapacityItem(
        department: 'কম্পিউটার সায়েন্স ও ইঞ্জিনিয়ারিং (CSE)',
        percentage: 87,
        copiesAllocated: '৪,২৫০ কপি',
        progress: 0.87,
        barColor: const Color(0xFF1E3A8A),
      ),
      DepartmentCapacityItem(
        department: 'ইলেকট্রিক্যাল ও ইলেকট্রনিক্স (EEE)',
        percentage: 72,
        copiesAllocated: '৩,১০০ কপি',
        progress: 0.72,
        barColor: const Color(0xFF0D9488),
      ),
      DepartmentCapacityItem(
        department: 'ব্যবসায় প্রশাসন ও আইন (BBA & Law)',
        percentage: 60,
        copiesAllocated: '২,৮০০ কপি',
        progress: 0.60,
        barColor: const Color(0xFF2563EB),
      ),
      DepartmentCapacityItem(
        department: 'সাধারণ বিজ্ঞান ও গণিত (General Science)',
        percentage: 45,
        copiesAllocated: '১,৫০০ কপি',
        progress: 0.45,
        barColor: const Color(0xFF818CF8),
      ),
    ];

    auditTransactions = <AuditTransactionItem>[
      AuditTransactionItem(
        id: 'tx_1',
        title: 'নাছির করিম বই রিটার্ন করেছেন',
        timeAgo: '১০ মি. আগে',
        subtitle: 'রসিদ #LIB-310984 • Artificial Intelligence: A Modern Approach',
        icon: Icons.keyboard_return_rounded,
        iconColor: const Color(0xFF0D9488),
        iconBg: const Color(0xFFCCFBF1),
      ),
      AuditTransactionItem(
        id: 'tx_2',
        title: 'জরিমানা আদায় সফল',
        timeAgo: '৩৫ মি. আগে',
        subtitle: 'তানভীর আহমেদ ৳৪৫.০০ পরিশোধ করেছেন (বিকাশ গেটওয়ে)',
        icon: Icons.receipt_long_rounded,
        iconColor: const Color(0xFFD97706),
        iconBg: const Color(0xFFFEF3C7),
      ),
      AuditTransactionItem(
        id: 'tx_3',
        title: 'ইনভেন্টরি স্টক বৃদ্ধি',
        timeAgo: '২ ঘণ্টা আগে',
        subtitle: 'নতুন ২০ কপি "Modern Operating Systems" ক্যাটালগে যুক্ত হয়েছে',
        icon: Icons.library_add_rounded,
        iconColor: const Color(0xFF2563EB),
        iconBg: const Color(0xFFEFF6FF),
      ),
    ].obs;
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void switchNavTab(int index) {
    activeNavIndex.value = index;
    if (index == 0) return; // already here

    final tabNames = [
      AppStrings.adminNavDashboard,
      AppStrings.adminNavInventory,
      AppStrings.adminNavDesk,
      AppStrings.adminNavMembers,
      AppStrings.adminNavReports,
    ];

    Get.snackbar(
      tabNames[index],
      AppStrings.isEnglish
          ? 'Navigating to ${tabNames[index]} section'
          : '${tabNames[index]} বিভাগে নেভিগেট করা হচ্ছে...',
      backgroundColor: AppColors.navyPrimary,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 1),
    );
  }

  // 1. Approve Book Request
  void approveRequest(LiveQueueItem item) {
    item.isApproved = true;
    liveQueueRequests.refresh();

    Get.snackbar(
      AppStrings.isEnglish ? 'Request Approved' : 'রিকোয়েস্ট অনুমোদিত',
      AppStrings.isEnglish
          ? '${item.bookTitle} issued to ${item.studentName}'
          : '${item.studentName}-এর অনুকূলে "${item.bookTitle}" বই ইস্যু অনুমোদন করা হয়েছে।',
      backgroundColor: const Color(0xFF065F46),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  // 2. Reject Book Request
  void rejectRequest(LiveQueueItem item) {
    item.isRejected = true;
    liveQueueRequests.refresh();

    Get.snackbar(
      AppStrings.isEnglish ? 'Request Rejected' : 'রিকোয়েস্ট বাতিল',
      AppStrings.isEnglish
          ? 'Request for ${item.bookTitle} was rejected.'
          : '"${item.bookTitle}" বই ইস্যু রিকোয়েস্ট বাতিল করা হয়েছে।',
      backgroundColor: const Color(0xFFDC2626),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  // 3. Send SMS Reminder
  void sendSmsReminder(OverdueAlertItem item) {
    item.isReminderSent = true;
    overdueAlerts.refresh();

    Get.snackbar(
      AppStrings.isEnglish ? 'SMS Reminder Sent' : 'এসএমএস রিমাইন্ডার প্রেরিত',
      AppStrings.isEnglish
          ? 'Overdue notice sent to ${item.studentName} (${item.studentRoll})'
          : '${item.studentName} (${item.studentRoll})-এর মোবাইলে সফলভাবে রিটার্ন রিমাইন্ডার পাঠানো হয়েছে।',
      backgroundColor: const Color(0xFF0F172A),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  // 4. Call Student
  void callStudent(OverdueAlertItem item) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Color(0xFFEFF6FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.phone_in_talk_rounded, color: AppColors.navyPrimary, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              item.studentName,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.slateHeading),
            ),
            Text(
              'রোল: ${item.studentRoll} • বকেয়া জরিমানা: ৳${item.fineAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 12.5, color: AppColors.slateSubtitle),
            ),
            const SizedBox(height: 8),
            const Text(
              'মোবাইল: +৮৮০ ১৭৯৮-১২৩৪৫৬',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.navyPrimary),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(AppStrings.isEnglish ? 'Cancel' : 'বাতিল'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                      Get.snackbar(
                        AppStrings.isEnglish ? 'Calling...' : 'কল ডায়াল করা হচ্ছে...',
                        '+৮৮০ ১৭৯৮-১২৩৪৫৬ নম্বরে সংযোগ স্থাপন করা হচ্ছে।',
                        backgroundColor: AppColors.navyPrimary,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(16),
                        borderRadius: 12,
                      );
                    },
                    icon: const Icon(Icons.call_rounded, size: 16),
                    label: Text(AppStrings.isEnglish ? 'Call Now' : 'সরাসরি কল'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16A34A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 5. Quick Actions Modals
  void quickActionIssue() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.assignment_turned_in_rounded, color: AppColors.navyPrimary),
                const SizedBox(width: 8),
                Text(
                  AppStrings.isEnglish ? 'Quick Book Issue' : 'তাৎক্ষণিক বই ইস্যু ডেস্ক',
                  style: const TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold, color: AppColors.slateHeading),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'শিক্ষার্থী আইডি / বারকোড স্ক্যান',
                hintText: 'e.g. CSE-2021-042',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.qr_code_scanner_rounded),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'বইয়ের অ্যাকসেশন বা ISBN নম্বর',
                hintText: 'e.g. 978-0132350884',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.book_rounded),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    AppStrings.isEnglish ? 'Issue Success' : 'ইস্যু সফল',
                    'বই সফলভাবে ইস্যু করা হয়েছে (১৪ দিনের মেয়াদ)।',
                    backgroundColor: const Color(0xFF16A34A),
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  AppStrings.isEnglish ? 'Confirm Issue' : 'ইস্যু নিশ্চিত করুন',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void quickActionReturn() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.assignment_return_rounded, color: Color(0xFF0D9488)),
                const SizedBox(width: 8),
                Text(
                  AppStrings.isEnglish ? 'Quick Return & Clearance' : 'তাৎক্ষণিক রিটার্ন ও ক্লিয়ারেন্স',
                  style: const TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold, color: AppColors.slateHeading),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'বইয়ের বারকোড বা ইস্যু স্লিপ নম্বর',
                hintText: '#LIB-884920',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.qr_code_2_rounded),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    AppStrings.isEnglish ? 'Return Processed' : 'রিটার্ন সম্পন্ন',
                    'বই সফলভাবে লাইব্রেরি ক্যাটালগে ফেরত জমা হয়েছে।',
                    backgroundColor: const Color(0xFF0D9488),
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D9488),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  AppStrings.isEnglish ? 'Accept Return' : 'রিটার্ন গ্রহণ করুন',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void quickActionScan() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Color(0xFFEFF6FF), shape: BoxShape.circle),
              child: const Icon(Icons.qr_code_scanner_rounded, color: AppColors.navyPrimary, size: 36),
            ),
            const SizedBox(height: 14),
            Text(
              AppStrings.isEnglish ? 'RFID & Barcode Scanner' : 'আরএফআইডি ও বারকোড স্ক্যানার',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.slateHeading),
            ),
            const SizedBox(height: 6),
            Text(
              AppStrings.isEnglish
                  ? 'Hold scanner near student smart pass or book barcode'
                  : 'ডিজিটাল আইডি কার্ড বা বইয়ের বারকোডে স্ক্যানার নির্দেশ করুন।',
              style: const TextStyle(fontSize: 12.5, color: AppColors.slateSubtitle),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    AppStrings.isEnglish ? 'Barcode Detected' : 'বারকোড স্ক্যান সম্পন্ন',
                    'আইটেম: Data Structures & Algorithms (#LIB-884920) শনাক্ত হয়েছে।',
                    backgroundColor: AppColors.navyPrimary,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  AppStrings.isEnglish ? 'Simulate Barcode Scan' : 'সিমুলেট স্ক্যান',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void quickActionAddBook() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.add_box_rounded, color: Color(0xFFD97706)),
                const SizedBox(width: 8),
                Text(
                  AppStrings.isEnglish ? 'Add New Catalog Book' : 'ক্যাটালগে নতুন বই সংযোজন',
                  style: const TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold, color: AppColors.slateHeading),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'বইয়ের শিরোনাম (Title)',
                hintText: 'e.g. Artificial Intelligence: A Modern Approach',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'লেখক ও প্রকাশনী (Author & Publisher)',
                hintText: 'Stuart Russell, Peter Norvig (Pearson)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    AppStrings.isEnglish ? 'Book Added' : 'বই যুক্ত হয়েছে',
                    'নতুন বই সফলভাবে সেন্ট্রাল ক্যাটালগে অন্তর্ভুক্ত করা হয়েছে।',
                    backgroundColor: const Color(0xFFD97706),
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD97706),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  AppStrings.isEnglish ? 'Save to Catalog' : 'সংরক্ষণ করুন',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
