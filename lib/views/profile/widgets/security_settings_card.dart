import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/profile_controller.dart';

class SecuritySettingsCard extends StatelessWidget {
  final ProfileController controller;
  final bool isTablet;

  const SecuritySettingsCard({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            AppStrings.securitySettingsHeader,
            style: TextStyle(
              color: AppColors.slateHeading,
              fontSize: isTablet ? 15.5 : 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),

          // 1. Biometric / Touch ID Switch
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              children: [
                Container(
                  width: isTablet ? 38 : 34,
                  height: isTablet ? 38 : 34,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0FDF4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.fingerprint_rounded,
                    color: Color(0xFF16A34A),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.biometricLoginTitle,
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.slateHeading,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppStrings.biometricLoginSub,
                        style: TextStyle(
                          fontSize: isTablet ? 12 : 11,
                          color: AppColors.slateSubtitle,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Switch(
                    value: controller.isBiometricEnabled.value,
                    activeThumbImage: null,
                    activeTrackColor: const Color(0xFF0D9488),
                    onChanged: controller.toggleBiometric,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: Color(0xFFF8FAFC)),

          // 2. Change PIN / Password
          InkWell(
            onTap: controller.showChangePinModal,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              child: Row(
                children: [
                  Container(
                    width: isTablet ? 38 : 34,
                    height: isTablet ? 38 : 34,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.pin_outlined,
                      color: Color(0xFF2563EB),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.changePinTitle,
                          style: TextStyle(
                            fontSize: isTablet ? 14 : 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.slateHeading,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          AppStrings.changePinSub,
                          style: TextStyle(
                            fontSize: isTablet ? 12 : 11,
                            color: AppColors.slateSubtitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.slateMuted,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 1, color: Color(0xFFF8FAFC)),

          // 3. Language Selector
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: Row(
              children: [
                Container(
                  width: isTablet ? 38 : 34,
                  height: isTablet ? 38 : 34,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.translate_rounded,
                    color: Color(0xFF475569),
                    size: 19,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.languageSelectionTitle,
                        style: TextStyle(
                          fontSize: isTablet ? 14 : 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.slateHeading,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppStrings.languageSelectionSub,
                        style: TextStyle(
                          fontSize: isTablet ? 12 : 11,
                          color: AppColors.slateSubtitle,
                        ),
                      ),
                    ],
                  ),
                ),

                // Segmented Pill
                Obx(() {
                  final isBangla = controller.selectedLanguage.value == 'বাংলা';
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => controller.toggleLanguage('বাংলা'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isBangla ? AppColors.navyPrimary : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'বাংলা',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                                color: isBangla ? Colors.white : AppColors.slateSubtitle,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.toggleLanguage('English'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: !isBangla ? AppColors.navyPrimary : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'English',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                                color: !isBangla ? Colors.white : AppColors.slateSubtitle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
