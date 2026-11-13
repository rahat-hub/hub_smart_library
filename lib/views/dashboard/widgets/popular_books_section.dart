import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/dashboard_controller.dart';
import 'popular_book_card.dart';

class PopularBooksSection extends StatelessWidget {
  final DashboardController controller;
  final bool isTablet;

  const PopularBooksSection({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppColors.tealBrand,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.popularBooksSectionTitle,
                  style: AppStyles.sectionTitle,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // View all popular books
              },
              child: Text(
                AppStrings.seeAll,
                style: AppStyles.sectionAction,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Responsive Cards (Row/Grid for Tablet, Horizontal Scroll for Mobile)
        Obx(() {
          final books = controller.filteredPopularBooks;

          if (books.isEmpty) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 28),
              alignment: Alignment.center,
              child: const Text(
                'কোন বই পাওয়া যায়নি',
                style: TextStyle(color: AppColors.slateSubtitle),
              ),
            );
          }

          if (isTablet) {
            // Tablet: Display up to 3 cards in a horizontal Row matching Image 2
            final displayBooks = books.take(3).toList();
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(displayBooks.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index < displayBooks.length - 1 ? 14.0 : 0.0,
                    ),
                    child: PopularBookCard(
                      book: displayBooks[index],
                      controller: controller,
                      isTablet: true,
                    ),
                  ),
                );
              }),
            );
          } else {
            // Mobile: Horizontal scrolling list
            return SizedBox(
              height: 315,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: books.length,
                separatorBuilder: (_, _) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  return PopularBookCard(
                    book: books[index],
                    controller: controller,
                    width: 220,
                    isTablet: false,
                  );
                },
              ),
            );
          }
        }),
      ],
    );
  }
}
