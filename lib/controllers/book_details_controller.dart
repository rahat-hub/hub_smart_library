import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../models/book_model.dart';

class BookDetailsController extends GetxController {
  late Rx<BookModel> book;
  final RxBool isExpandedDescription = false.obs;
  final RxBool isBookmarked = false.obs;
  final RxBool isSubmitting = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is BookModel) {
      book = args.obs;
    } else {
      book = BookModel.defaultPythonDetailsBook().obs;
    }
    isBookmarked.value = book.value.isBookmarked;
  }

  void toggleDescription() {
    isExpandedDescription.value = !isExpandedDescription.value;
  }

  void toggleBookmark() {
    isBookmarked.value = !isBookmarked.value;
    book.value.isBookmarked = isBookmarked.value;

    Get.snackbar(
      isBookmarked.value ? 'বুকমার্কে যুক্ত হয়েছে' : 'বুকমার্ক থেকে সরানো হয়েছে',
      book.value.title,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isBookmarked.value ? AppColors.navyPrimary : const Color(0xFF475569),
      colorText: Colors.white,
      icon: Icon(
        isBookmarked.value ? Icons.bookmark_added_rounded : Icons.bookmark_border_rounded,
        color: AppColors.mintAccent,
      ),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void submitIssueRequest() {
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
                      color: AppColors.availableGreenBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.check_circle_outline_rounded,
                      color: AppColors.availableGreenText,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ইস্যু রিকোয়েস্ট নিশ্চিতকরণ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.slateHeading,
                          ),
                        ),
                        Text(
                          'সেন্ট্রাল লাইব্রেরি বুক লোন সিস্টেম',
                          style: TextStyle(fontSize: 12, color: AppColors.slateSubtitle),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.dashboardBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.slateBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.value.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.5,
                        color: AppColors.slateHeading,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'লেখক: ${book.value.author}',
                      style: const TextStyle(fontSize: 12.5, color: AppColors.slateSubtitle),
                    ),
                    const Divider(height: 18),
                    _buildInfoRow('লোকেশন:', book.value.shelfLocation),
                    const SizedBox(height: 6),
                    _buildInfoRow('মেয়াদ:', '১৪ দিন (${book.value.tentativeReturnDate} পর্যন্ত)'),
                    const SizedBox(height: 6),
                    _buildInfoRow('বিলম্ব ফি:', book.value.lateFeePolicy),
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
                          'রিকোয়েস্ট সফলভাবে পাঠানো হয়েছে!',
                          'লাইব্রেরি ডেস্কে আপনার ডিজিটাল পাস প্রদর্শন করে বইটি সংগ্রহ করুন।',
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
                        'হ্যাঁ, পাঠাতে চাই',
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

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 72,
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.slateSubtitle),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: AppColors.slateHeading,
            ),
          ),
        ),
      ],
    );
  }
}
