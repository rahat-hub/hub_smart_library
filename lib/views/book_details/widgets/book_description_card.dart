import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';
import '../../../controllers/book_details_controller.dart';

class BookDescriptionCard extends StatelessWidget {
  final BookDetailsController controller;
  final String description;
  final bool isTablet;

  const BookDescriptionCard({
    super.key,
    required this.controller,
    required this.description,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.shortDescTitle,
              style: AppStyles.sectionTitle.copyWith(
                fontSize: isTablet ? 17.5 : 16.0,
              ),
            ),
            Obx(
              () => InkWell(
                onTap: controller.toggleDescription,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    controller.isExpandedDescription.value
                        ? AppStrings.readLess
                        : AppStrings.readMore,
                    style: AppStyles.toggleReadMore,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Description Container
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(isTablet ? 18.0 : 14.0),
          child: Obx(
            () => AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              crossFadeState: (controller.isExpandedDescription.value || isTablet)
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Text(
                description,
                style: AppStyles.descriptionBody.copyWith(
                  fontSize: isTablet ? 14.0 : 13.0,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              secondChild: Text(
                description,
                style: AppStyles.descriptionBody.copyWith(
                  fontSize: isTablet ? 14.0 : 13.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
