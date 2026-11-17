import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/registration_controller.dart';

class SmartPassPreviewCard extends StatelessWidget {
  final RegistrationController controller;
  final bool isTablet;

  const SmartPassPreviewCard({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isTablet ? 18 : 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0F2B5C),
            Color(0xFF133A76),
            Color(0xFF0A1F42),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F2B5C).withValues(alpha: 0.3),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: University Smart Pass + Instant Virtual ID badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.contactless_outlined,
                    color: Color(0xFF38BDF8),
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppStrings.smartPassPreviewTitle,
                    style: TextStyle(
                      fontSize: isTablet ? 12.5 : 11.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  AppStrings.instantVirtualId,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7DD3FC),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Body: RFID Chip box + Student Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Simulated RFID Microchip box
              Container(
                width: isTablet ? 50 : 44,
                height: isTablet ? 50 : 44,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.qr_code_2_rounded,
                      color: Color(0xFF38BDF8),
                      size: 22,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      'RFID',
                      style: TextStyle(
                        fontSize: 8.5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Student details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      AppStrings.isEnglish
                          ? 'Tanvir Ahmed'
                          : 'তানভীর আহমেদ (Tanvir Ahmed)',
                      style: TextStyle(
                        fontSize: isTablet ? 15.5 : 14.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),

                    // ID & Dept
                    Text(
                      'ID: ${controller.studentIdController.text} • CSE Dept',
                      style: TextStyle(
                        fontSize: isTablet ? 12 : 11,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFBAE6FD),
                      ),
                    ),

                    const SizedBox(height: 2),

                    // Usage footnote
                    Text(
                      AppStrings.smartPassReadyNote,
                      style: TextStyle(
                        fontSize: isTablet ? 10.5 : 9.5,
                        color: const Color(0xFFCBD5E1).withValues(alpha: 0.8),
                        height: 1.25,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
