import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../models/book_model.dart';

class DashboardController extends GetxController {
  final RxInt currentNavIndex = 0.obs;
  final RxString selectedCategory = AppStrings.catAllBooks.obs;
  final RxString searchQuery = ''.obs;
  late TextEditingController searchController;

  // Student details
  final RxString studentName = 'তাজুল ইসলাম'.obs;
  final RxString studentId = 'CSE-2021-042'.obs;
  final RxString sessionYear = '২০২৪-২৫'.obs;
  final RxInt borrowedCount = 3.obs;
  final RxString pendingFine = '৳০.০০'.obs;

  // Categories list
  final List<String> categories = [
    AppStrings.catAllBooks,
    AppStrings.catComputerScience,
    AppStrings.catElectrical,
    AppStrings.catBbaFinance,
    AppStrings.catLiterature,
    AppStrings.catMathematics,
    AppStrings.catMechanical,
  ];

  // Popular Books
  late RxList<BookModel> popularBooks;

  // Catalog Books
  late RxList<BookModel> catalogBooks;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();

    popularBooks = <BookModel>[
      BookModel(
        id: 'pop_1',
        title: 'Designing Data-Intensive Applications',
        author: 'Martin Kleppmann',
        rating: 4.9,
        reviewCount: 128,
        availableCopies: 4,
        rack: 'Rack B-4',
        category: AppStrings.catComputerScience,
        coverStyle: BookCoverStyle.dataIntensive,
        primaryColor: const Color(0xFF0F325E),
      ),
      BookModel(
        id: 'pop_2',
        title: 'Deep Learning with Python',
        author: 'François Chollet',
        rating: 4.8,
        reviewCount: 95,
        availableCopies: 2,
        rack: 'Rack A-3',
        category: AppStrings.catComputerScience,
        coverStyle: BookCoverStyle.deepLearning,
        primaryColor: const Color(0xFFFAF7F2),
      ),
      BookModel(
        id: 'pop_3',
        title: 'Microservices Patterns',
        author: 'Chris Richardson',
        rating: 4.7,
        reviewCount: 82,
        availableCopies: 6,
        rack: 'Rack C-1',
        category: AppStrings.catComputerScience,
        coverStyle: BookCoverStyle.microservices,
        primaryColor: const Color(0xFF1E293B),
      ),
      BookModel(
        id: 'pop_3',
        title: 'Microservices Patterns',
        author: 'Chris Richardson',
        rating: 4.7,
        reviewCount: 82,
        availableCopies: 6,
        rack: 'Rack C-1',
        category: AppStrings.catComputerScience,
        coverStyle: BookCoverStyle.microservices,
        primaryColor: const Color(0xFF1E293B),
      ),
      BookModel(
        id: 'pop_2',
        title: 'Deep Learning with Python',
        author: 'François Chollet',
        rating: 4.8,
        reviewCount: 95,
        availableCopies: 2,
        rack: 'Rack A-3',
        category: AppStrings.catComputerScience,
        coverStyle: BookCoverStyle.deepLearning,
        primaryColor: const Color(0xFFFAF7F2),
      ),
    ].obs;

    catalogBooks = <BookModel>[
      BookModel(
        id: 'cat_1',
        title: 'Introduction to Algorithms (CLRS)',
        author: 'Cormen, Leiserson, Rivest, Stein',
        rating: 4.9,
        reviewCount: 310,
        availableCopies: 5,
        rack: 'Rack B-4',
        isAvailable: true,
        category: AppStrings.catComputerScience,
        coverStyle: BookCoverStyle.algorithms,
        primaryColor: const Color(0xFF173D7A),
      ),
      BookModel(
        id: 'cat_2',
        title: 'Clean Code',
        author: 'Robert C. Martin',
        rating: 4.8,
        reviewCount: 240,
        availableCopies: 2,
        rack: 'Rack A-1',
        isAvailable: true,
        category: AppStrings.catComputerScience,
        coverStyle: BookCoverStyle.cleanCode,
        primaryColor: Colors.white,
      ),
      BookModel(
        id: 'cat_3',
        title: 'Artificial Intelligence: A Modern Approach',
        author: 'Stuart Russell, Peter Norvig',
        rating: 4.8,
        reviewCount: 190,
        availableCopies: 0,
        rack: 'Rack C-2',
        isAvailable: false,
        isIssuedWaitlist: true,
        category: AppStrings.catComputerScience,
        coverStyle: BookCoverStyle.artificialIntelligence,
        primaryColor: const Color(0xFF0C1F3F),
      ),
      BookModel(
        id: 'cat_4',
        title: 'Principles of Database Systems',
        author: 'Abraham Silberschatz, Henry F. Korth',
        rating: 4.7,
        reviewCount: 115,
        availableCopies: 3,
        rack: 'Rack B-2',
        isAvailable: true,
        category: AppStrings.catComputerScience,
        coverStyle: BookCoverStyle.databaseSystems,
        primaryColor: const Color(0xFFF8FAFC),
      ),
    ].obs;
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void selectNavIndex(int index) {
    currentNavIndex.value = index;
    if (index == 3) {
      showDigitalPassDialog();
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void onSearchChanged(String query) {
    searchQuery.value = query.trim().toLowerCase();
  }

  List<BookModel> get filteredPopularBooks {
    final query = searchQuery.value;
    final cat = selectedCategory.value;

    return popularBooks.where((book) {
      final matchesCategory = cat == AppStrings.catAllBooks || book.category == cat;
      final matchesQuery = query.isEmpty ||
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  List<BookModel> get filteredCatalogBooks {
    final query = searchQuery.value;
    final cat = selectedCategory.value;

    return catalogBooks.where((book) {
      final matchesCategory = cat == AppStrings.catAllBooks || book.category == cat;
      final matchesQuery = query.isEmpty ||
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  void toggleBookmark(String bookId) {
    // Check in popular
    for (var i = 0; i < popularBooks.length; i++) {
      if (popularBooks[i].id == bookId) {
        final b = popularBooks[i];
        b.isBookmarked = !b.isBookmarked;
        popularBooks[i] = b;
        popularBooks.refresh();
        _showBookmarkFeedback(b.isBookmarked, b.title);
        return;
      }
    }
    // Check in catalog
    for (var i = 0; i < catalogBooks.length; i++) {
      if (catalogBooks[i].id == bookId) {
        final b = catalogBooks[i];
        b.isBookmarked = !b.isBookmarked;
        catalogBooks[i] = b;
        catalogBooks.refresh();
        _showBookmarkFeedback(b.isBookmarked, b.title);
        return;
      }
    }
  }

  void _showBookmarkFeedback(bool isSaved, String bookTitle) {
    Get.snackbar(
      isSaved ? 'বুকমার্কে যুক্ত হয়েছে' : 'বুকমার্ক থেকে সরানো হয়েছে',
      bookTitle,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isSaved ? AppColors.navyPrimary : const Color(0xFF475569),
      colorText: Colors.white,
      icon: Icon(
        isSaved ? Icons.bookmark_added_rounded : Icons.bookmark_border_rounded,
        color: AppColors.mintAccent,
      ),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void borrowBook(BookModel book) {
    if (!book.isAvailable) {
      Get.snackbar(
        'বইটি বর্তমানে অনুপলব্ধ',
        'সকল কপি ধার নেওয়া হয়েছে। আপনি ওয়েটলিস্টে যুক্ত হতে পারেন।',
        backgroundColor: AppColors.waitlistBadgeText,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
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
                      color: AppColors.availableGreenBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.menu_book_rounded,
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
                          'বই ধার নেওয়ার আবেদন',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.slateHeading,
                          ),
                        ),
                        Text(
                          'লাইব্রেরি ডেস্কে বই সংগ্রহ করুন',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.slateSubtitle,
                          ),
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
                      book.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColors.slateHeading,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'লেখক: ${book.author}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.slateSubtitle,
                      ),
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'র‍্যাক লোকেশন:',
                          style: TextStyle(fontSize: 12.5, color: AppColors.slateSubtitle),
                        ),
                        Text(
                          book.rack,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.navyPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ধার নেওয়ার মেয়াদ:',
                          style: TextStyle(fontSize: 12.5, color: AppColors.slateSubtitle),
                        ),
                        Text(
                          '১৪ দিন (নবায়নযোগ্য)',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.availableGreenText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('বাতিল'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        borrowedCount.value += 1;
                        Get.snackbar(
                          'ধার নেওয়া সফল হয়েছে!',
                          '${book.title} আপনার ইস্যু তালিকায় যুক্ত করা হয়েছে।',
                          backgroundColor: AppColors.navyPrimary,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.all(16),
                          borderRadius: 12,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.navyPrimary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
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

  void showDigitalPassDialog() {
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
                    color: AppColors.heroGradientStart.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.badge_rounded,
                    color: AppColors.navyPrimary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'স্মার্ট লাইব্রেরি ডিজিটাল পাস',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                    ),
                    Text(
                      'লাইব্রেরি ডেস্কে এই পাসটি প্রদর্শন করুন',
                      style: TextStyle(fontSize: 12, color: AppColors.slateSubtitle),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Digital Pass Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0C2B59),
                    Color(0xFF13366C),
                    Color(0xFF0C5668),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0C2B59).withValues(alpha: 0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'UNIVERSITY SMART LIBRARY',
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
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'সেশন ২০২৪-২৫',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            studentName.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'ID: ${studentId.value}',
                            style: const TextStyle(
                              color: Color(0xFFBAE6FD),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'Dept: Computer Science & Engineering',
                            style: TextStyle(
                              color: Color(0xFFD1E6FF),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  // Barcode & QR representation
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.qr_code_2_rounded,
                          size: 72,
                          color: Color(0xFF0F172A),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          studentId.value,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
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
                child: const Text('ঠিক আছে', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void showLibraryRulesDialog() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: SingleChildScrollView(
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
                      color: AppColors.tealLightBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.verified_user_outlined,
                      color: AppColors.tealBrand,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'ডিজিটাল আইডি ও লাইব্রেরি নিয়মাবলী',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildRuleItem('১.', 'একবারে সর্বোচ্চ ৩টি বই ধার নেওয়া যাবে।'),
              _buildRuleItem('২.', 'ধার নেওয়া বইয়ের মেয়াদ ১৪ দিন, মেয়াদ উত্তীর্ণের আগে অনলাইন রিনিউ করা যাবে।'),
              _buildRuleItem('৩.', 'দেরিতে বই জমা দিলে প্রতিদিন বই প্রতি ২ টাকা বিলম্ব ফি প্রযোজ্য হবে।'),
              _buildRuleItem('৪.', 'ডিজিটাল আইডি কার্ড বা আরএফআইডি ব্যতীত বই ইস্যু করা যাবে না।'),
              _buildRuleItem('৫.', 'বইয়ের কোনো পৃষ্ঠা ছিঁড়লে বা ক্ষতিগ্রস্থ হলে নির্ধারিত জরিমানা ধার্য হবে।'),
              const SizedBox(height: 20),
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
                  child: const Text('বুঝেছি', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildRuleItem(String index, String rule) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.tealBrand,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              rule,
              style: const TextStyle(
                color: AppColors.slateSubtitle,
                fontSize: 13.5,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showNotifications() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'নোটিফিকেশন',
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
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.promoBannerBg,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.book_rounded, color: AppColors.navyPrimary, size: 20),
                ),
                title: const Text('বই ফেরতের স্মরণিকা', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5)),
                subtitle: const Text('Clean Code বইটির মেয়াদ আর ৩ দিন বাকি আছে।', style: TextStyle(fontSize: 12)),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.availableGreenBg,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check_circle_outline_rounded, color: AppColors.availableGreenText, size: 20),
                ),
                title: const Text('ওয়েটলিস্ট আপডেট', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5)),
                subtitle: const Text('আপনার অনুরোধকৃত বই লাইব্রেরিতে জমা হয়েছে।', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
