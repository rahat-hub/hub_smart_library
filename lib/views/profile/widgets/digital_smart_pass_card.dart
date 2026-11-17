import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/profile_controller.dart';
import '../../../models/profile_model.dart';

class DigitalSmartPassCard extends StatelessWidget {
  final ProfileModel profile;
  final ProfileController controller;
  final bool isTablet;

  const DigitalSmartPassCard({
    super.key,
    required this.profile,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isTablet ? 24.0 : 20.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0D2852),
            Color(0xFF133E82),
            Color(0xFF0F2B66),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0D2852).withValues(alpha: 0.35),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: EdgeInsets.all(isTablet ? 22.0 : 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Top Row: RFID Pass Indicator & Central Library Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.contactless_rounded,
                      color: AppColors.mintAccent,
                      size: 15,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppStrings.smartPassRfidTitle,
                    style: TextStyle(
                      color: const Color(0xFFD1E4F8),
                      fontSize: isTablet ? 13 : 11.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),

              // Central Library Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.22),
                  ),
                ),
                child: Text(
                  AppStrings.centralLibraryBadge,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isTablet ? 11.5 : 10.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: isTablet ? 18 : 14),

          // 2. Student Details Row: Avatar + Name + Dept + Roll
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar with Green Verified Badge
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: isTablet ? 64 : 54,
                    height: isTablet ? 64 : 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(isTablet ? 16 : 14),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.8),
                        width: 2,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF3B82F6),
                          Color(0xFF1D4ED8),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(isTablet ? 14 : 12),
                      child: Center(
                        child: Icon(
                          Icons.person_rounded,
                          size: isTablet ? 38 : 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -4,
                    bottom: -2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Color(0xFF0F2B66),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle_rounded,
                        color: Color(0xFF10B981),
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 14),

              // Name, Dept, Roll
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 20 : 17.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      profile.department,
                      style: TextStyle(
                        color: const Color(0xFF93C5FD),
                        fontSize: isTablet ? 13 : 11.5,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${AppStrings.isEnglish ? 'Roll' : 'রোল'}: ${profile.studentId} • ${AppStrings.isEnglish ? 'Session' : 'সেশন'}: ${profile.session}',
                      style: TextStyle(
                        color: const Color(0xFFE2E8F0).withValues(alpha: 0.9),
                        fontSize: isTablet ? 12 : 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: isTablet ? 18 : 14),

          // 3. Barcode & "বড় QR দেখুন" Action Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.22),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Barcode graphic & Code
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBarcodeGraphic(isTablet: isTablet),
                    const SizedBox(height: 4),
                    Text(
                      profile.rfidBarcode,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: isTablet ? 13 : 11.5,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ],
                ),

                // "বড় QR দেখুন" Button
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: controller.showLargeQrModal,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isTablet ? 14 : 12,
                        vertical: isTablet ? 9 : 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.qr_code_scanner_rounded,
                            color: AppColors.slateHeading,
                            size: 17,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            AppStrings.viewLargeQrBtn,
                            style: TextStyle(
                              color: AppColors.slateHeading,
                              fontSize: isTablet ? 13 : 11.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: isTablet ? 14 : 12),

          // 4. Card Validity & Academic Class Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                profile.cardValidity,
                style: TextStyle(
                  color: const Color(0xFFCBD5E1),
                  fontSize: isTablet ? 12 : 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                profile.academicYearSemester,
                style: TextStyle(
                  color: const Color(0xFFCBD5E1),
                  fontSize: isTablet ? 12 : 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Barcode renderer
  Widget _buildBarcodeGraphic({required bool isTablet}) {
    final barHeights = [
      20.0, 14.0, 20.0, 20.0, 12.0, 20.0, 16.0, 20.0, 12.0, 20.0,
      18.0, 20.0, 14.0, 20.0, 20.0, 12.0, 18.0, 20.0, 14.0, 20.0,
      12.0, 20.0, 18.0, 20.0, 14.0, 20.0, 16.0, 20.0, 20.0, 14.0
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(barHeights.length, (index) {
        final isFat = index % 3 == 0;
        return Container(
          width: isFat ? 2.5 : 1.5,
          height: barHeights[index] * (isTablet ? 1.15 : 1.0),
          margin: const EdgeInsets.only(right: 2.2),
          color: Colors.white,
        );
      }),
    );
  }
}
