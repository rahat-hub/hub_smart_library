import 'package:flutter/material.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_styles.dart';

class LibraryServerCard extends StatelessWidget {
  const LibraryServerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
          width: 1,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF132F5C).withValues(alpha: 0.8),
            const Color(0xFF0A1B38).withValues(alpha: 0.95),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Ambient Library Architectural Perspective Pattern
            Positioned.fill(
              child: CustomPaint(
                painter: LibraryInteriorPainter(),
              ),
            ),

            // Subtle dark overlay gradient for readability
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.4),
                      const Color(0xFF071933).withValues(alpha: 0.85),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Badges
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Pill: সরাসরি সংযুক্ত • সেন্ট্রাল সার্ভার
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5.5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0C2449).withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: Color(0xFF10B981),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF10B981),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              AppStrings.serverConnected,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.chipText.copyWith(
                                fontSize: 11.5,
                                color: const Color(0xFFE2E8F0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Right Pill: ৪৫,০০০+ ই-বুকস
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F3265).withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF38BDF8).withValues(alpha: 0.25),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.wifi_tethering_rounded,
                          size: 13,
                          color: Color(0xFF38BDF8),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          AppStrings.ebooksCount,
                          style: AppStyles.chipText.copyWith(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFBAE6FD),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LibraryInteriorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Perspective lines simulating aisles and mezzanine architecture
    final centerX = size.width / 2;
    for (double i = 0; i <= size.width; i += size.width / 8) {
      canvas.drawLine(
        Offset(centerX, 15),
        Offset(i, size.height),
        paint,
      );
    }

    // Bookshelf horizontal tiers
    final tierPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    for (double y = 25; y < size.height - 30; y += 18) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), tierPaint);
    }

    // Warm atmospheric light spots
    final glowPaint = Paint()
      ..color = const Color(0xFF60A5FA).withValues(alpha: 0.08)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    canvas.drawCircle(Offset(centerX, 25), 45, glowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
