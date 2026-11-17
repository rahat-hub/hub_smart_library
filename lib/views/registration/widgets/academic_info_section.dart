import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/registration_controller.dart';

class AcademicInfoSection extends StatelessWidget {
  final RegistrationController controller;
  final bool isTablet;

  const AcademicInfoSection({
    super.key,
    required this.controller,
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
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E3A8A),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.step1Header,
                  style: TextStyle(
                    fontSize: isTablet ? 15.5 : 14.5,
                    fontWeight: FontWeight.w800,
                    color: AppColors.slateHeading,
                  ),
                ),
              ],
            ),
            Text(
              AppStrings.profileDetailsTag,
              style: TextStyle(
                fontSize: isTablet ? 12.5 : 11.5,
                fontWeight: FontWeight.w600,
                color: AppColors.slateSubtitle,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Field 1: Full Name
        _buildFieldContainer(
          label: AppStrings.labelFullName,
          badge: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
            decoration: BoxDecoration(
              color: const Color(0xFFDCFCE7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              AppStrings.verifiedBadge,
              style: const TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.bold,
                color: Color(0xFF15803D),
              ),
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.person_outline_rounded, color: AppColors.navyPrimary, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller.fullNameController,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.slateHeading,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF16A34A),
                size: 20,
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Field 2: Student ID / Roll
        _buildFieldContainer(
          label: AppStrings.labelStudentIdRoll,
          badge: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline_rounded, color: Color(0xFF16A34A), size: 13),
              const SizedBox(width: 4),
              Text(
                AppStrings.activeIdDetected,
                style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF15803D),
                ),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.badge_outlined, color: AppColors.navyPrimary, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller.studentIdController,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                    letterSpacing: 0.8,
                    color: AppColors.slateHeading,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFDBEAFE)),
                ),
                child: Text(
                  AppStrings.verifiedText,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.linkBlue,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Field 3: Department & Faculty (Dropdown card)
        _buildFieldContainer(
          label: AppStrings.labelDeptFaculty,
          child: InkWell(
            onTap: controller.showDepartmentPicker,
            borderRadius: BorderRadius.circular(10),
            child: Row(
              children: [
                const Icon(Icons.school_outlined, color: AppColors.navyPrimary, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.selectedDept.value,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.bold,
                            color: AppColors.slateHeading,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          controller.selectedFaculty.value,
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: AppColors.slateSubtitle,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.slateSubtitle),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Fields 4 & 5: Session & Semester in a responsive row
        Row(
          children: [
            // Session
            Expanded(
              child: _buildFieldContainer(
                label: AppStrings.labelSession,
                child: InkWell(
                  onTap: controller.showSessionPicker,
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, color: AppColors.navyPrimary, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Obx(
                          () => Text(
                            controller.selectedSession.value,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.slateHeading,
                            ),
                          ),
                        ),
                      ),
                      const Icon(Icons.unfold_more_rounded, color: AppColors.slateSubtitle, size: 18),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Semester
            Expanded(
              child: _buildFieldContainer(
                label: AppStrings.labelSemester,
                child: InkWell(
                  onTap: controller.showSemesterPicker,
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    children: [
                      const Icon(Icons.layers_outlined, color: AppColors.navyPrimary, size: 19),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Obx(
                          () => Text(
                            controller.selectedSemester.value,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.slateHeading,
                            ),
                          ),
                        ),
                      ),
                      const Icon(Icons.unfold_more_rounded, color: AppColors.slateSubtitle, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Field 6: Institutional Email
        _buildFieldContainer(
          label: AppStrings.labelInstEmail,
          badge: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: Color(0xFF16A34A),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                AppStrings.allowedDomainBadge,
                style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF15803D),
                ),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.mail_outline_rounded, color: AppColors.navyPrimary, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: controller.emailUserController,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.slateHeading,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Text(
                      AppStrings.emailDomainSuffix,
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF334155),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                AppStrings.instEmailNote,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.slateSubtitle,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Field 7: Mobile Number
        _buildFieldContainer(
          label: AppStrings.labelMobileNumber,
          badge: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFDBEAFE)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.sms_outlined, size: 12, color: AppColors.linkBlue),
                const SizedBox(width: 4),
                Text(
                  AppStrings.smsServiceBadge,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.linkBlue,
                  ),
                ),
              ],
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.smartphone_rounded, color: AppColors.navyPrimary, size: 20),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  AppStrings.defaultPhonePrefix,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.slateHeading,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: AppColors.slateHeading,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF16A34A),
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFieldContainer({
    required String label,
    Widget? badge,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label and optional top-right badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        label,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF334155),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Text(
                      ' *',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFDC2626),
                      ),
                    ),
                  ],
                ),
              ),
              if (badge != null) badge,
            ],
          ),

          const SizedBox(height: 8),

          // Field content
          child,
        ],
      ),
    );
  }
}
