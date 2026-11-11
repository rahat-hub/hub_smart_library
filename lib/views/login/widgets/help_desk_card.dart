import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';

class HelpDeskCard extends StatelessWidget {
  const HelpDeskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.helpDeskBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFDBEAFE),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Help Desk Title Row
          Row(
            children: [
              const Icon(
                Icons.support_agent_rounded,
                size: 20,
                color: Color(0xFF0F766E),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  AppStrings.helpDeskTitle,
                  style: AppStyles.helpDeskTitle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Contact Details
          Text(
            AppStrings.helpDeskEmail,
            style: AppStyles.helpDeskInfo,
          ),
          const SizedBox(height: 4),
          Text(
            AppStrings.helpDeskHelpline,
            style: AppStyles.helpDeskInfo,
          ),
        ],
      ),
    );
  }
}
