import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/dashboard_controller.dart';
import 'catalog_book_card.dart';

class CatalogSection extends StatelessWidget {
  final DashboardController controller;
  final bool isTablet;

  const CatalogSection({
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
                    color: AppColors.navyPrimary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.catalogSectionTitle,
                  style: AppStyles.sectionTitle,
                ),
              ],
            ),
            Obx(
              () => Text(
                '${controller.filteredCatalogBooks.length}টি তালিকাভুক্ত',
                style: AppStyles.catalogCount,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Catalog List
        Obx(() {
          final books = controller.filteredCatalogBooks;

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

          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: books.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return CatalogBookCard(
                book: books[index],
                controller: controller,
                isTablet: isTablet,
              );
            },
          );
        }),
      ],
    );
  }
}
