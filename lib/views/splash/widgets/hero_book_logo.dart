import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class HeroBookLogo extends StatefulWidget {
  const HeroBookLogo({super.key});

  @override
  State<HeroBookLogo> createState() => _HeroBookLogoState();
}

class _HeroBookLogoState extends State<HeroBookLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 170,
        height: 170,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Rotating Dashed Ring
            AnimatedBuilder(
              animation: _rotationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationController.value * 2 * math.pi,
                  child: CustomPaint(
                    size: const Size(150, 150),
                    painter: DashedCirclePainter(
                      color: AppColors.cyanAccent.withValues(alpha: 0.35),
                      dashLength: 5,
                      gapLength: 7,
                    ),
                  ),
                );
              },
            ),

            // Subtle Glowing Halo
            Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mintAccent.withValues(alpha: 0.25),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),

            // Inner Decorative Ring
            Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                  width: 1.2,
                ),
              ),
            ),

            // Main Gradient Squircle Container
            Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF56E8CD),
                    Color(0xFF28B7BD),
                    Color(0xFF1E88E5),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF26C6DA).withValues(alpha: 0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.auto_stories_rounded,
                    size: 42,
                    color: Color(0xFF07213E),
                  ),
                ),
              ),
            ),

            // Small circular back/action button on top right of the ring
            Positioned(
              top: 10,
              right: 14,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF7CE7D7),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 14,
                  color: Color(0xFF0B2447),
                ),
              ),
            ),

            // Tiny orbit dots
            Positioned(
              bottom: 22,
              left: 20,
              child: Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: Color(0xFF80E5FF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Color(0xFF7CE7D7),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double dashLength;
  final double gapLength;

  DashedCirclePainter({
    required this.color,
    required this.dashLength,
    required this.gapLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke;

    final double circumference = 2 * math.pi * radius;
    final int dashCount = (circumference / (dashLength + gapLength)).floor();
    final double adjustedInterval = circumference / dashCount;
    final double dashAngle = (dashLength / adjustedInterval) * (2 * math.pi / dashCount);
    final double totalSegmentAngle = 2 * math.pi / dashCount;

    for (int i = 0; i < dashCount; i++) {
      final double startAngle = i * totalSegmentAngle;
      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(radius, radius), radius: radius),
        startAngle,
        dashAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant DashedCirclePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.dashLength != dashLength ||
      oldDelegate.gapLength != gapLength;
}
