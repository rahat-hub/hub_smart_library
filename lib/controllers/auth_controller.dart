import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_strings.dart';
import '../routes/app_routes.dart';

enum UserRole { student, admin }

class AuthController extends GetxController {
  final Rx<UserRole> currentRole = UserRole.student.obs;

  late TextEditingController idController;
  late TextEditingController passwordController;

  final RxBool isPasswordHidden = true.obs;
  final RxBool rememberMe = true.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    idController = TextEditingController(text: AppStrings.defaultStudentId);
    passwordController = TextEditingController(text: '••••••••');
  }

  @override
  void onClose() {
    idController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void switchRole(UserRole role) {
    currentRole.value = role;
    if (role == UserRole.student) {
      idController.text = AppStrings.defaultStudentId;
    } else {
      idController.text = 'ADM-88412';
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void clearIdText() {
    idController.clear();
  }

  void performLogin() async {
    final id = idController.text.trim();
    final password = passwordController.text.trim();

    if (id.isEmpty) {
      Get.snackbar(
        'সতর্কবার্তা',
        currentRole.value == UserRole.student
            ? 'দয়া করে স্টুডেন্ট আইডি প্রদান করুন'
            : 'দয়া করে অ্যাডমিন আইডি প্রদান করুন',
        backgroundColor: const Color(0xFFEF4444),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    if (password.isEmpty) {
      Get.snackbar(
        'সতর্কবার্তা',
        'দয়া করে আপনার পাসওয়ার্ড বা পিন প্রদান করুন',
        backgroundColor: const Color(0xFFEF4444),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1200));
    isLoading.value = false;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF10B981), width: 2),
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF059669),
                  size: 40,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'সফলভাবে লগইন হয়েছে!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'স্বাগতম, ${idController.text}\nলাইব্রেরি ড্যাশবোর্ডে আপনাকে স্বাগতম।',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.offNamed(AppRoutes.dashboard);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF163C7E),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'ড্যাশবোর্ডে প্রবেশ করুন',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scanSmartCard() {
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
              width: 48,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.contactless_rounded,
                color: Color(0xFF1D4ED8),
                size: 48,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'স্মার্ট কার্ড স্পর্শ করুন',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'আপনার স্টুডেন্ট কার্ডটি ডিভাইসের RFID সেন্সরের কাছাকাছি আনুন অথবা বারকোড স্ক্যান করুন।',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Get.back();
                idController.text = 'CSE-2021-042';
                Get.snackbar(
                  'কার্ড সনাক্ত হয়েছে',
                  'স্টুডেন্ট আইডি: CSE-2021-042 স্বয়ংক্রিয়ভাবে পূরণ করা হয়েছে',
                  backgroundColor: const Color(0xFF10B981),
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.all(16),
                  borderRadius: 12,
                );
              },
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('সিমুলেট কার্ড ট্যাপ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF163C7E),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginWithEduId() {
    Get.snackbar(
      'University EduID',
      'কেন্দ্রীয় বিশ্ববিদ্যালয়ের একক সাইন-অন পোর্টালে রিডাইরেক্ট করা হচ্ছে...',
      backgroundColor: const Color(0xFF1E293B),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  void showForgotPinDialog() {
    Get.defaultDialog(
      title: 'পিন বা পাসওয়ার্ড পুনরুদ্ধার',
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      middleText:
          'আপনার বিশ্ববিদ্যালয়ের ইমেইলে পিন রিসেট করার লিঙ্ক পাঠানো হবে।\nদয়া করে আইসিটি হেল্প ডেস্কে যোগাযোগ করুন।',
      textConfirm: 'ঠিক আছে',
      confirmTextColor: Colors.white,
      buttonColor: const Color(0xFF163C7E),
      radius: 16,
      onConfirm: () => Get.back(),
    );
  }

  void showAccountActivation() {
    Get.defaultDialog(
      title: 'লাইব্রেরি একাউন্ট সক্রিয়করণ',
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      middleText:
          'নতুন শিক্ষার্থীরা আপনার অ্যাডমিশন রোল নম্বর এবং বিভাগীয় ইমেইল দিয়ে রেজিস্টার করতে পারেন।',
      textConfirm: 'রেজিস্টার করুন',
      confirmTextColor: Colors.white,
      buttonColor: const Color(0xFF0F766E),
      radius: 16,
      onConfirm: () => Get.back(),
    );
  }
}
