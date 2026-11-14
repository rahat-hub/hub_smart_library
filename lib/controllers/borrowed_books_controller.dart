import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../models/borrowed_book_model.dart';

class BorrowedBooksController extends GetxController {
  final RxInt selectedTab = 0.obs; // 0: বর্তমান বইসমূহ, 1: ফেরত দেওয়া বই
  late RxList<BorrowedBookModel> currentBooks;
  late RxList<BorrowedBookModel> returnedBooks;

  final RxDouble totalPendingFine = 45.0.obs;

  @override
  void onInit() {
    super.onInit();
    currentBooks = BorrowedBookModel.getSampleBorrowedBooks().obs;
    returnedBooks = BorrowedBookModel.getSampleReturnedBooks().obs;
  }

  int get totalIssuedCount => currentBooks.length;
  int get dueTodayCount =>
      currentBooks.where((b) => b.status == BorrowedStatus.dueToday).length;

  String get totalFineBengali {
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
      '.': '.',
    };
    final formatted = totalPendingFine.value.toStringAsFixed(2);
    final bengaliDigits = formatted.split('').map((e) => map[e] ?? e).join('');
    return '৳$bengaliDigits';
  }

  void switchTab(int index) {
    selectedTab.value = index;
  }

  // 1. Show Return Barcode Modal
  void showReturnBarcode(BorrowedBookModel book) {
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
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.qr_code_scanner_rounded,
                    color: AppColors.navyPrimary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'বই রিটার্ন বারকোড',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                    ),
                    Text(
                      'স্বয়ংক্রিয় রিটার্ন ড্রপ-বক্স বা ডেস্কে স্ক্যান করুন',
                      style: TextStyle(fontSize: 12, color: AppColors.slateSubtitle),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                children: [
                  Text(
                    book.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.5,
                      color: AppColors.slateHeading,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'আইডি: ${book.id} • শেলফ: ${book.shelf}',
                    style: const TextStyle(fontSize: 12, color: AppColors.slateSubtitle),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFCBD5E1)),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.qr_code_2_rounded,
                          size: 90,
                          color: Color(0xFF0F172A),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          book.id,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.5,
                            color: Color(0xFF334155),
                          ),
                        ),
                      ],
                    ),
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
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text('সম্পন্ন', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  // 2. Show Renew Request Modal
  void showRenewRequest(BorrowedBookModel book) {
    if (book.status == BorrowedStatus.overdue) {
      Get.snackbar(
        'রিনিউ সম্ভব নয়',
        'বইটি বিলম্বিত (Overdue)। রিনিউ করার আগে বিলম্ব ফি পরিশোধ করতে হবে।',
        backgroundColor: const Color(0xFFEF4444),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.sync_rounded,
                      color: AppColors.navyPrimary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'বই রিনিউ রিকোয়েস্ট',
                          style: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold,
                            color: AppColors.slateHeading,
                          ),
                        ),
                        Text(
                          'আরও ১৪ দিনের জন্য মেয়াদ বৃদ্ধি',
                          style: TextStyle(fontSize: 12, color: AppColors.slateSubtitle),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.5,
                        color: AppColors.slateHeading,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'বর্তমান নির্ধারিত দিন: ${book.dueDate}',
                      style: const TextStyle(fontSize: 12, color: AppColors.slateSubtitle),
                    ),
                    const Divider(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('নতুন নির্ধারিত দিন:', style: TextStyle(fontSize: 12)),
                        Text(
                          '০৮ মে, ২০২৪ (+১৪ দিন)',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF059669),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('বাতিল'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.snackbar(
                          'রিনিউ সফল হয়েছে!',
                          '${book.title} বইয়ের মেয়াদ আরও ১৪ দিন বৃদ্ধি করা হয়েছে।',
                          backgroundColor: AppColors.navyPrimary,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.all(16),
                          borderRadius: 12,
                          duration: const Duration(seconds: 3),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.navyPrimary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'নিশ্চিত করুন',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 3. Show Pay Fine Modal & Return Process
  void payFineModal() {
    if (totalPendingFine.value <= 0) {
      Get.snackbar(
        'কোন বকেয়া জরিমানা নেই',
        'আপনার অ্যাকাউন্টে বর্তমানে কোন বিলম্ব জরিমানা বকেয়া নেই।',
        backgroundColor: const Color(0xFF10B981),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    final RxString selectedGateway = 'bKash'.obs;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEE2E2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.payments_rounded,
                    color: Color(0xFFDC2626),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'বিলম্ব ফি পরিশোধ গেটওয়ে',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                    ),
                    Text(
                      'মোট বকেয়া: $totalFineBengali',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFDC2626),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Text(
              'পেমেন্ট মেথড নির্বাচন করুন:',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF334155)),
            ),
            const SizedBox(height: 10),
            // Payment options: bKash, Nagad, University EduWallet
            Obx(
              () => Column(
                children: [
                  _buildPaymentMethodOption(
                    title: 'বিকাশ (bKash Payment)',
                    subtitle: 'তাত্ক্ষণিক অটো-ভেরিফিকেশন',
                    value: 'bKash',
                    groupValue: selectedGateway.value,
                    icon: Icons.account_balance_wallet_rounded,
                    color: const Color(0xFFD12053),
                    onTap: () => selectedGateway.value = 'bKash',
                  ),
                  const SizedBox(height: 8),
                  _buildPaymentMethodOption(
                    title: 'নগদ (Nagad)',
                    subtitle: 'জিরো কনভেনিয়েন্স ফি',
                    value: 'Nagad',
                    groupValue: selectedGateway.value,
                    icon: Icons.payments_outlined,
                    color: const Color(0xFFEA580C),
                    onTap: () => selectedGateway.value = 'Nagad',
                  ),
                  const SizedBox(height: 8),
                  _buildPaymentMethodOption(
                    title: 'ইউনিভার্সিটি এডু-ওয়ালেট (EduWallet)',
                    subtitle: 'ব্যালেন্স: ৳২৫০.০০',
                    value: 'EduWallet',
                    groupValue: selectedGateway.value,
                    icon: Icons.school_rounded,
                    color: AppColors.navyPrimary,
                    onTap: () => selectedGateway.value = 'EduWallet',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  totalPendingFine.value = 0.0;
                  // Update overdue book fine status
                  for (var i = 0; i < currentBooks.length; i++) {
                    if (currentBooks[i].status == BorrowedStatus.overdue) {
                      final b = currentBooks[i];
                      currentBooks[i] = BorrowedBookModel(
                        id: b.id,
                        title: b.title,
                        author: b.author,
                        shelf: b.shelf,
                        edition: 'জরিমানা পরিশোধিত',
                        issueDate: b.issueDate,
                        dueDate: b.dueDate,
                        status: BorrowedStatus.dueToday,
                        statusBadgeText: '• জরিমানা পরিশোধিত (রিটার্ন করুন)',
                        progress: 1.0,
                        overdueDays: 0,
                        finePerDay: 5.0,
                        totalFine: 0.0,
                        coverStyle: b.coverStyle,
                      );
                    }
                  }
                  currentBooks.refresh();

                  Get.dialog(
                    Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: const BoxDecoration(
                                color: Color(0xFFECFDF5),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check_circle_rounded,
                                color: Color(0xFF059669),
                                size: 40,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'জরিমানা সফলভাবে পরিশোধিত!',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '৳৪৫.০০ টাকা পরিশোধ সম্পন্ন হয়েছে। আপনার লাইব্রেরি ডিজিটাল গেট লক নিষ্ক্রিয় করা হয়েছে।',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => Get.back(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.navyPrimary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text('ঠিক আছে'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDC2626),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  '৳৪৫.০০ পরিশোধ নিশ্চিত করুন (${selectedGateway.value})',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildPaymentMethodOption({
    required String title,
    required String subtitle,
    required String value,
    required String groupValue,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final isSelected = value == groupValue;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? color.withValues(alpha: 0.08) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? color : const Color(0xFFE2E8F0),
            width: isSelected ? 1.8 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.slateHeading,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 11.5, color: AppColors.slateSubtitle),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
              color: isSelected ? color : const Color(0xFF94A3B8),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
