import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';

class ShelfLocationCard extends StatelessWidget {
  final String location;
  final String indexNumber;
  final bool isTablet;

  const ShelfLocationCard({
    super.key,
    required this.location,
    required this.indexNumber,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.promoBannerBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.promoBannerBorder, width: 1.2),
      ),
      padding: EdgeInsets.all(isTablet ? 16.0 : 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left: Dark Navy Circle with Compass Icon
          Container(
            width: isTablet ? 46 : 40,
            height: isTablet ? 46 : 40,
            decoration: const BoxDecoration(
              color: Color(0xFF0C2B59),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.explore_rounded,
              color: Colors.white,
              size: isTablet ? 24 : 20,
            ),
          ),

          const SizedBox(width: 14),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Row: Title + Index Tag
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        AppStrings.shelfLocationTitle,
                        style: AppStyles.shelfTitle.copyWith(
                          fontSize: isTablet ? 15.5 : 14.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2.5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0xFFCBD5E1)),
                      ),
                      child: Text(
                        'ইনডেক্স: $indexNumber',
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF334155),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Location Details
                Text(
                  location,
                  style: AppStyles.shelfLocationText.copyWith(
                    fontSize: isTablet ? 13.5 : 12.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
