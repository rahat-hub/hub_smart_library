import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../routes/app_routes.dart';

class DepartmentOption {
  final String department;
  final String faculty;

  const DepartmentOption({required this.department, required this.faculty});
}

class RegistrationController extends GetxController {
  // Text Controllers
  late TextEditingController fullNameController;
  late TextEditingController studentIdController;
  late TextEditingController emailUserController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  // Department and Academic Selections
  final RxString selectedDept = 'কম্পিউটার সায়েন্স অ্যান্ড ইঞ্জিনিয়ারিং (CSE)'.obs;
  final RxString selectedFaculty = 'Faculty of Engineering & Technology'.obs;
  final RxString selectedSession = '২০২০-২১'.obs;
  final RxString selectedSemester = '৮ম সেমিস্টার'.obs;

  // File Upload State
  final RxBool isIdCardUploaded = true.obs;
  final RxString uploadedFileName = 'student_id_front_cse042.jpg'.obs;
  final RxString uploadedFileSize = '১.৮ MB • স্বয়ংক্রিয় প্রক্রিয়াকরণ সমাপ্ত'.obs;

  // Password Visibility
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  // Password Strength Reactive States
  final RxBool hasMinLength = true.obs;
  final RxBool hasUpperLower = true.obs;
  final RxBool hasSpecialChar = true.obs;

  // Terms and Submission
  final RxBool hasAgreedToTerms = true.obs;
  final RxBool isSubmitting = false.obs;

  // Available options
  final List<DepartmentOption> departmentOptions = const [
    DepartmentOption(
      department: 'কম্পিউটার সায়েন্স অ্যান্ড ইঞ্জিনিয়ারিং (CSE)',
      faculty: 'Faculty of Engineering & Technology',
    ),
    DepartmentOption(
      department: 'ইলেকট্রিক্যাল অ্যান্ড ইলেকট্রনিক ইঞ্জিনিয়ারিং (EEE)',
      faculty: 'Faculty of Engineering & Technology',
    ),
    DepartmentOption(
      department: 'বিজনেস অ্যাডমিনিস্ট্রেশন (BBA)',
      faculty: 'Faculty of Business Studies',
    ),
    DepartmentOption(
      department: 'ফার্মেসি বিভাগ (Pharmacy)',
      faculty: 'Faculty of Allied Health Sciences',
    ),
    DepartmentOption(
      department: 'ইংরেজি ভাষা ও সাহিত্য (English)',
      faculty: 'Faculty of Arts & Humanities',
    ),
  ];

  final List<String> sessionOptions = const [
    '২০২৪-২৫',
    '২০২৩-২৪',
    '২০২২-২৩',
    '২০২১-২২',
    '২০২০-২১',
  ];

  final List<String> semesterOptions = const [
    '১ম সেমিস্টার',
    '২য় সেমিস্টার',
    '৩য় সেমিস্টার',
    '৪র্থ সেমিস্টার',
    '৫ম সেমিস্টার',
    '৬ষ্ঠ সেমিস্টার',
    '৭ম সেমিস্টার',
    '৮ম সেমিস্টার',
  ];

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController(text: AppStrings.defaultFullNameVal);
    studentIdController = TextEditingController(text: AppStrings.defaultStudentIdVal);
    emailUserController = TextEditingController(text: AppStrings.defaultEmailUserVal);
    phoneController = TextEditingController(text: AppStrings.defaultPhoneVal);
    passwordController = TextEditingController(text: 'LibraryPass@2025');
    confirmPasswordController = TextEditingController(text: 'LibraryPass@2025');

    passwordController.addListener(_validatePassword);
  }

  @override
  void onClose() {
    fullNameController.dispose();
    studentIdController.dispose();
    emailUserController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void _validatePassword() {
    final text = passwordController.text;
    hasMinLength.value = text.length >= 8;
    hasUpperLower.value = text.contains(RegExp(r'[A-Z]')) && text.contains(RegExp(r'[a-z]'));
    hasSpecialChar.value = text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void toggleTermsAgreement(bool? val) {
    hasAgreedToTerms.value = val ?? false;
  }

  // 1. Department Selector BottomSheet
  void showDepartmentPicker() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
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
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppStrings.labelDeptFaculty,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.slateHeading,
              ),
            ),
            const SizedBox(height: 12),
            ...departmentOptions.map(
              (dept) => ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.school_outlined, color: AppColors.navyPrimary, size: 20),
                ),
                title: Text(
                  dept.department,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5),
                ),
                subtitle: Text(
                  dept.faculty,
                  style: const TextStyle(fontSize: 11.5, color: AppColors.slateSubtitle),
                ),
                trailing: selectedDept.value == dept.department
                    ? const Icon(Icons.check_circle_rounded, color: AppColors.navyPrimary)
                    : null,
                onTap: () {
                  selectedDept.value = dept.department;
                  selectedFaculty.value = dept.faculty;
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  // 2. Session Selector BottomSheet
  void showSessionPicker() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
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
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppStrings.labelSession,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.slateHeading,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: sessionOptions.map((s) {
                final isSelected = selectedSession.value == s;
                return ChoiceChip(
                  label: Text(s),
                  selected: isSelected,
                  selectedColor: AppColors.navyPrimary,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.slateHeading,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                  onSelected: (val) {
                    if (val) {
                      selectedSession.value = s;
                      Get.back();
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }

  // 3. Semester Selector BottomSheet
  void showSemesterPicker() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
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
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppStrings.labelSemester,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.slateHeading,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: semesterOptions.map((sem) {
                final isSelected = selectedSemester.value == sem;
                return ChoiceChip(
                  label: Text(sem),
                  selected: isSelected,
                  selectedColor: AppColors.navyPrimary,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.slateHeading,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                  onSelected: (val) {
                    if (val) {
                      selectedSemester.value = sem;
                      Get.back();
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }

  // 4. File Picking Simulation
  void pickFile() {
    isIdCardUploaded.value = true;
    uploadedFileName.value = 'student_id_front_cse042.jpg';
    uploadedFileSize.value = AppStrings.defaultUploadedFileSize;

    Get.snackbar(
      AppStrings.isEnglish ? 'ID Card Uploaded' : 'আইডি কার্ড আপলোড সম্পন্ন',
      AppStrings.isEnglish
          ? 'File student_id_front_cse042.jpg has been processed.'
          : 'student_id_front_cse042.jpg স্বয়ংক্রিয়ভাবে যাচাই করা হয়েছে।',
      backgroundColor: const Color(0xFF0F172A),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  // 5. Camera Scan Simulation
  void openCamera() {
    isIdCardUploaded.value = true;
    uploadedFileName.value = 'camera_capture_id_live.jpg';
    uploadedFileSize.value = AppStrings.isEnglish
        ? '2.1 MB • OCR Scan Verified'
        : '২.১ MB • ক্যামেরা ওসিআর স্ক্যান যাচাইকৃত';

    Get.snackbar(
      AppStrings.isEnglish ? 'Camera Scan Success' : 'ক্যামেরা স্ক্যান সফল',
      AppStrings.isEnglish
          ? 'Live ID card capture verified successfully.'
          : 'লাইভ আইডি কার্ড স্ক্যান সফলভাবে সম্পন্ন হয়েছে।',
      backgroundColor: AppColors.navyPrimary,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void removeFile() {
    isIdCardUploaded.value = false;
  }

  // 6. Library Rules Modal
  void showLibraryRulesModal() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
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
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.gavel_rounded, color: AppColors.navyPrimary),
                const SizedBox(width: 8),
                Text(
                  AppStrings.libraryRulesTitle,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.slateHeading,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              AppStrings.policyDescription,
              style: const TextStyle(fontSize: 13, height: 1.5, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 12),
            const Text(
              '• সর্বোচ্চ ৩টি বই একই সাথে ১৪ দিনের জন্য ধার নেওয়া যাবে।\n• বই হারিয়ে গেলে বা নষ্ট হলে বাজারমূল্য ও বিলম্ব ফি পরিশোধ প্রযোজ্য।\n• ডিজিটাল স্মার্ট পাস অন্য কারও সাথে হস্তান্তরযোগ্য নয়।',
              style: TextStyle(fontSize: 12.5, height: 1.6, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  AppStrings.isEnglish ? 'I Understand' : 'বুঝেছি ও একমত',
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

  // 7. Helpline Modal
  void showHelplineModal() {
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
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.headset_mic_rounded, color: AppColors.navyPrimary, size: 30),
            ),
            const SizedBox(height: 14),
            Text(
              AppStrings.helpDeskTitle,
              style: const TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.bold,
                color: AppColors.slateHeading,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              AppStrings.helpDeskHelpline,
              style: const TextStyle(fontSize: 13, color: AppColors.slateSubtitle),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              AppStrings.helpDeskEmail,
              style: const TextStyle(fontSize: 12.5, color: AppColors.linkBlue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  AppStrings.isEnglish ? 'Close' : 'বন্ধ করুন',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 8. Submit Registration
  void submitRegistration() async {
    if (!hasAgreedToTerms.value) {
      Get.snackbar(
        AppStrings.isEnglish ? 'Agreement Required' : 'নীতিমালা সম্মতি আবশ্যক',
        AppStrings.isEnglish
            ? 'Please agree to the library rules & policies to continue.'
            : 'অনুগ্রহ করে লাইব্রেরির নিয়মাবলী ও নীতিমালায় টিক দিয়ে সম্মতি জানান।',
        backgroundColor: const Color(0xFFDC2626),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    if (passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        AppStrings.isEnglish ? 'Password Required' : 'পাসওয়ার্ড প্রয়োজন',
        AppStrings.isEnglish
            ? 'Please enter and confirm your password.'
            : 'অনুগ্রহ করে পাসওয়ার্ড প্রদান ও নিশ্চিত করুন।',
        backgroundColor: const Color(0xFFDC2626),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        AppStrings.isEnglish ? 'Password Mismatch' : 'পাসওয়ার্ড মিলছে না',
        AppStrings.isEnglish
            ? 'Passwords do not match.'
            : 'উভয় ঘরে একই পাসওয়ার্ড নিশ্চিত করুন।',
        backgroundColor: const Color(0xFFDC2626),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    isSubmitting.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    isSubmitting.value = false;

    // Show celebratory Smart Pass confirmation dialog
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFFDCFCE7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF16A34A),
                  size: 38,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.isEnglish ? 'Registration Successful!' : 'নিবন্ধন সফলভাবে সম্পন্ন হয়েছে!',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.slateHeading,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.isEnglish
                    ? 'Your University Smart Library Membership & Digital Pass has been generated.'
                    : 'আপনার ডিজিটাল স্মার্ট লাইব্রেরি মেম্বারশিপ পাস সক্রিয় করা হয়েছে।',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.slateSubtitle,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Student ID: ${studentIdController.text}',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColors.navyPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.offAllNamed(AppRoutes.dashboard);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.navyPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    AppStrings.isEnglish ? 'Go to Dashboard' : 'ড্যাশবোর্ডে প্রবেশ করুন',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
