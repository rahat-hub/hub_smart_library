import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../models/profile_model.dart';
import '../routes/app_routes.dart';
import 'dashboard_controller.dart';

class ProfileController extends GetxController {
  late Rx<ProfileModel> profile;

  final RxBool isBiometricEnabled = true.obs;
  final RxBool isSmsAlertActive = true.obs;
  final RxString selectedLanguage = 'বাংলা'.obs;

  @override
  void onInit() {
    super.onInit();
    final isEn = Get.locale?.languageCode == 'en';
    selectedLanguage.value = isEn ? 'English' : 'বাংলা';
    profile = ProfileModel.getSampleProfile(isEnglish: isEn).obs;
  }

  void toggleBiometric(bool value) {
    isBiometricEnabled.value = value;
    final isEn = AppStrings.isEnglish;
    Get.snackbar(
      isEn ? 'Biometric Authentication' : 'বায়োমেট্রিক অথেন্টিকেশন',
      value
          ? (isEn ? 'Biometric login enabled successfully.' : 'বায়োমেট্রিক লগইন সক্রিয় করা হয়েছে।')
          : (isEn ? 'Biometric login disabled.' : 'বায়োমেট্রিক লগইন নিষ্ক্রিয় করা হয়েছে।'),
      backgroundColor: AppColors.navyPrimary,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void toggleLanguage(String lang) {
    selectedLanguage.value = lang;
    final isEn = lang == 'English';
    final newLocale = isEn ? const Locale('en', 'US') : const Locale('bn', 'BD');
    Get.updateLocale(newLocale);
    profile.value = ProfileModel.getSampleProfile(isEnglish: isEn);

    if (Get.isRegistered<DashboardController>()) {
      final dash = Get.find<DashboardController>();
      dash.studentName.value = isEn ? 'Tajul Islam' : 'তাজুল ইসলাম';
      dash.sessionYear.value = isEn ? '2024-25' : '২০২৪-২৫';
      dash.pendingFine.value = isEn ? '৳0.00' : '৳০.০০';
      dash.selectedCategory.value = AppStrings.catAllBooks;
    }

    Get.snackbar(
      isEn ? 'Language Changed' : 'ভাষা পরিবর্তন',
      isEn
          ? 'Application language switched to English.'
          : 'অ্যাপের ভাষা বাংলা হিসেবে নির্বাচিত করা হয়েছে।',
      backgroundColor: AppColors.navyPrimary,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  // 1. Show Large QR Code Modal for Turnstile Gate Scanning
  void showLargeQrModal() {
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
                    Icons.qr_code_2_rounded,
                    color: AppColors.navyPrimary,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'টার্নস্টাইল গেট ও কিওস্ক QR পাস',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                    ),
                    Text(
                      'স্বয়ংক্রিয় স্ক্যানারে প্রদর্শন করুন',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: AppColors.slateSubtitle,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close_rounded, color: AppColors.slateSubtitle),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // High Contrast QR Graphic Container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFCBD5E1), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Simulated QR Grid Display
                  _buildSimulatedQrCode(size: 190),
                  const SizedBox(height: 12),
                  Text(
                    profile.value.rfidBarcode,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.2,
                      color: AppColors.slateHeading,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.lightbulb_outline_rounded, color: AppColors.warningAmber, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'টিপস: গেট স্ক্যানারে দ্রুত রিডের জন্য স্ক্রিনের উজ্জ্বলতা (Brightness) বাড়িয়ে নিন।',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.slateSubtitle,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'সম্পন্ন',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  // 2. Edit Institutional Info Dialog
  void showEditInfoDialog() {
    final emailCtrl = TextEditingController(text: profile.value.institutionalEmail);
    final phoneCtrl = TextEditingController(text: profile.value.mobileNumber);

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'যোগাযোগ তথ্য হালনাগাদ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.slateHeading,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close_rounded, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                'প্রাতিষ্ঠানিক ইমেইল:',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.slateSubtitle),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'মোবাইল নম্বর:',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.slateSubtitle),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: phoneCtrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.snackbar(
                      'তথ্য সংরক্ষিত হয়েছে',
                      'আপনার যোগাযোগের তথ্য সফলভাবে হালনাগাদ করা হয়েছে।',
                      backgroundColor: AppColors.navyPrimary,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                      margin: const EdgeInsets.all(16),
                      borderRadius: 12,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.navyPrimary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('সংরক্ষণ করুন', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 3. Change PIN Dialog
  void showChangePinModal() {
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
            const Text(
              'লাইব্রেরি কিওস্ক পিন পরিবর্তন',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.slateHeading),
            ),
            const SizedBox(height: 8),
            const Text(
              'লাইব্রেরি সেলফ-সার্ভিস কিওস্কে ব্যবহারের জন্য ৬ সংখ্যার পিন নির্ধারণ করুন।',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: AppColors.slateSubtitle),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) => Container(
                width: 38,
                height: 44,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFCBD5E1)),
                ),
                child: Center(
                  child: Text(
                    index < 3 ? '•' : '',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'পিন আপডেট সফল',
                    'নতুন কিওস্ক সিকিউরিটি পিন সফলভাবে সংরক্ষিত হয়েছে।',
                    backgroundColor: AppColors.navyPrimary,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(16),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('পিন নিশ্চিত করুন', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 4. Show Wishlist Modal
  void showWishlistModal() {
    final wishlistedBooks = [
      {'title': 'Operating System Concepts', 'author': 'Silberschatz', 'copies': '৩টি উপলব্ধ'},
      {'title': 'Computer Networks', 'author': 'Andrew S. Tanenbaum', 'copies': '৫টি উপলব্ধ'},
      {'title': 'Artificial Intelligence: Modern Approach', 'author': 'Stuart Russell', 'copies': '২টি উপলব্ধ'},
      {'title': 'Database System Concepts', 'author': 'Abraham Silberschatz', 'copies': '৭টি উপলব্ধ'},
      {'title': 'Clean Code', 'author': 'Robert C. Martin', 'copies': '৪টি উপলব্ধ'},
    ];

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'পছন্দের বইয়ের তালিকা (Wishlist)',
                  style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold, color: AppColors.slateHeading),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('৫টি বই সংরক্ষিত', style: TextStyle(color: AppColors.linkBlue, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ...wishlistedBooks.map((book) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.bookmark_outline_rounded, color: AppColors.navyPrimary, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book['title']!,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: AppColors.slateHeading),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${book['author']} • ${book['copies']}',
                          style: const TextStyle(fontSize: 11.5, color: AppColors.slateSubtitle),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.toNamed(AppRoutes.bookDetails);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navyPrimary,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('দেখুন', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  // 5. Show Payment History Modal
  void showPaymentHistoryModal() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'জরিমানা ও পেমেন্ট হিস্ট্রি',
                  style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold, color: AppColors.slateHeading),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close_rounded, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFECFDF5),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFA7F3D0)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.check_circle_rounded, color: Color(0xFF059669), size: 24),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('সকল জরিমানা পরিশোধিত', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF065F46))),
                        Text('বর্তমানে কোনো বকেয়া লেট ফি নেই। লাইব্রেরি সার্ভিস সম্পূর্ণ সক্রিয়।', style: TextStyle(fontSize: 12, color: Color(0xFF047857))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('পূর্বের পেমেন্ট রসিদ:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.slateHeading)),
            const SizedBox(height: 8),
            _buildReceiptRow('#REC-9921', 'Operating System Concepts', '৳২০.০০', 'পরিশোধিত: ১২ মার্চ, ২০২৪'),
            _buildReceiptRow('#REC-8840', 'Digital Logic Design', '৳১৫.০০', 'পরিশোধিত: ০৪ নভেম্বর, ২০২৩'),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptRow(String invoice, String book, String amount, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$invoice • $book', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12.5, color: AppColors.slateHeading)),
              Text(date, style: const TextStyle(fontSize: 11, color: AppColors.slateSubtitle)),
            ],
          ),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.slateHeading, fontSize: 13)),
        ],
      ),
    );
  }

  // 6. Call Helpdesk
  void callHelpdesk() {
    Get.snackbar(
      'লাইব্রেরি হেল্পডেস্ক',
      'হটলাইন ১৬২২১ (ext-২০১) ডায়াল করা হচ্ছে...',
      backgroundColor: AppColors.navyPrimary,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      icon: const Icon(Icons.phone_in_talk_rounded, color: Colors.white),
    );
  }

  // 7. Logout Action
  void logout() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: Color(0xFFFEE2E2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.logout_rounded, color: Color(0xFFDC2626), size: 28),
              ),
              const SizedBox(height: 16),
              const Text(
                'লগআউট নিশ্চিতকরণ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.slateHeading),
              ),
              const SizedBox(height: 8),
              const Text(
                'আপনি কি স্মার্ট লাইব্রেরি সিস্টেম থেকে লগআউট করতে চান?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppColors.slateSubtitle),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('বাতিল', style: TextStyle(color: AppColors.slateHeading)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.offAllNamed(AppRoutes.login);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDC2626),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('লগআউট', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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

  // Helper widget to simulate high-contrast QR pattern
  Widget _buildSimulatedQrCode({required double size}) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Corner Markers
          Positioned(
            top: 0,
            left: 0,
            child: _buildQrCornerMarker(size: size * 0.28),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: _buildQrCornerMarker(size: size * 0.28),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: _buildQrCornerMarker(size: size * 0.28),
          ),
          // Center Grid Matrix Simulation
          Center(
            child: Container(
              width: size * 0.44,
              height: size * 0.44,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: 36,
                itemBuilder: (context, index) {
                  final isFilled = (index * 7 + 3) % 2 == 0;
                  return Container(
                    color: isFilled ? Colors.black : Colors.transparent,
                  );
                },
              ),
            ),
          ),
          // University logo badge in center
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.school_rounded,
              size: 20,
              color: AppColors.navyPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrCornerMarker({required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 6),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Container(
          width: size * 0.46,
          height: size * 0.46,
          color: Colors.black,
        ),
      ),
    );
  }
}
