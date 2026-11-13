import 'package:flutter/material.dart';
import '../../../models/book_model.dart';
import '../../dashboard/widgets/book_cover_widget.dart';

class BookCoverShowcaseWidget extends StatelessWidget {
  final BookModel book;
  final double width;
  final double height;

  const BookCoverShowcaseWidget({
    super.key,
    required this.book,
    this.width = 135,
    this.height = 175,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF1F5F9),
            Color(0xFFE2E8F0),
            Color(0xFFD7CCC8), // Wooden desk tone at bottom
          ],
          stops: [0.0, 0.72, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Wooden desk surface bar at the bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: height * 0.28,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFC7A78A),
                    Color(0xFFB59374),
                  ],
                ),
              ),
            ),
          ),

          // Shadow under the book
          Positioned(
            bottom: height * 0.12,
            child: Container(
              width: width * 0.78,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.35),
                    blurRadius: 12,
                    offset: const Offset(4, 6),
                  ),
                ],
              ),
            ),
          ),

          // The Book itself
          Positioned(
            top: 10,
            bottom: height * 0.15,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Front Cover with Badge
                Stack(
                  children: [
                    BookCoverWidget(
                      book: book,
                      width: width * 0.72,
                      height: double.infinity,
                      borderRadius: 6,
                    ),

                    // "CS Core" badge on top left of the book
                    if (book.badgeText != null)
                      Positioned(
                        top: 6,
                        left: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2.5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E3A8A),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            book.badgeText!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9.0,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                // Book Thickness / Page Edges (Right side perspective)
                Container(
                  width: 5.5,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE8E5DF),
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(2)),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFD5D0C6),
                        Color(0xFFF3F1ED),
                      ],
                    ),
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
