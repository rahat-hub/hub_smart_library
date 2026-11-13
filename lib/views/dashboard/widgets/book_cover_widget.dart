import 'package:flutter/material.dart';
import '../../../models/book_model.dart';

class BookCoverWidget extends StatelessWidget {
  final BookModel book;
  final double? width;
  final double? height;
  final double borderRadius;
  final bool isThumbnail;

  const BookCoverWidget({
    super.key,
    required this.book,
    this.width,
    this.height,
    this.borderRadius = 12.0,
    this.isThumbnail = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: _getBgColor(),
          boxShadow: isThumbnail
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
        ),
        child: Stack(
          children: [
            // Background Artwork
            Positioned.fill(
              child: _buildArtwork(),
            ),

            // Left book spine gradient effect
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: isThumbnail ? 4 : 8,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.28),
                      Colors.black.withValues(alpha: 0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBgColor() {
    switch (book.coverStyle) {
      case BookCoverStyle.dataIntensive:
        return const Color(0xFF0F2648);
      case BookCoverStyle.deepLearning:
        return const Color(0xFFF2ECE1);
      case BookCoverStyle.microservices:
        return const Color(0xFF1E2838);
      case BookCoverStyle.algorithms:
        return const Color(0xFF13366C);
      case BookCoverStyle.cleanCode:
        return const Color(0xFFF9FAFB);
      case BookCoverStyle.artificialIntelligence:
        return const Color(0xFF0D2146);
      case BookCoverStyle.databaseSystems:
        return const Color(0xFFF1F5F9);
      case BookCoverStyle.pythonDataStructures:
        return const Color(0xFF132F5C);
    }
  }

  Widget _buildArtwork() {
    switch (book.coverStyle) {
      case BookCoverStyle.dataIntensive:
        return _buildDataIntensiveCover();
      case BookCoverStyle.deepLearning:
        return _buildDeepLearningCover();
      case BookCoverStyle.microservices:
        return _buildMicroservicesCover();
      case BookCoverStyle.algorithms:
        return _buildAlgorithmsCover();
      case BookCoverStyle.cleanCode:
        return _buildCleanCodeCover();
      case BookCoverStyle.artificialIntelligence:
        return _buildAICover();
      case BookCoverStyle.databaseSystems:
        return _buildDatabaseCover();
      case BookCoverStyle.pythonDataStructures:
        return _buildPythonDataStructuresCover();
    }
  }

  // 1. Designing Data-Intensive Applications (O'Reilly Blue Network Mesh)
  Widget _buildDataIntensiveCover() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0A1B38),
            Color(0xFF0F325E),
            Color(0xFF061A34),
          ],
        ),
      ),
      padding: EdgeInsets.all(isThumbnail ? 6 : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top O'Reilly style title
          Text(
            'Designing\nData-Intensive\nApplications',
            style: TextStyle(
              color: Colors.white,
              fontSize: isThumbnail ? 7.5 : 13.5,
              fontWeight: FontWeight.w800,
              height: 1.15,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: isThumbnail ? 2 : 6),
          Text(
            'THE BIG IDEAS BEHIND RELIABLE,\nSCALABLE, AND MAINTAINABLE SYSTEMS',
            style: TextStyle(
              color: const Color(0xFF7DD3FC),
              fontSize: isThumbnail ? 4 : 7,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          // Center Network nodes graphic
          Center(
            child: Icon(
              Icons.hub_outlined,
              size: isThumbnail ? 24 : 48,
              color: const Color(0xFF38BDF8).withValues(alpha: 0.8),
            ),
          ),
          const Spacer(),
          Text(
            'Martin Kleppmann',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: isThumbnail ? 6 : 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // 2. Deep Learning with Python (Manning beige/cream cover)
  Widget _buildDeepLearningCover() {
    return Container(
      color: const Color(0xFFFAF7F2),
      padding: EdgeInsets.all(isThumbnail ? 6 : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: isThumbnail ? 4 : 8,
                height: isThumbnail ? 4 : 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFE11D48),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'MANNING',
                style: TextStyle(
                  fontSize: isThumbnail ? 5 : 8,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF334155),
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          SizedBox(height: isThumbnail ? 3 : 8),
          Text(
            'DEEP\nLEARNING\nWITH PYTHON',
            style: TextStyle(
              color: const Color(0xFF0F172A),
              fontSize: isThumbnail ? 7.5 : 13.5,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: isThumbnail ? 2 : 4),
          Text(
            'SECOND EDITION',
            style: TextStyle(
              color: const Color(0xFF2563EB),
              fontSize: isThumbnail ? 4.5 : 7.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Center(
            child: Container(
              padding: EdgeInsets.all(isThumbnail ? 4 : 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF1E9DB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.psychology_rounded,
                size: isThumbnail ? 22 : 42,
                color: const Color(0xFF475569),
              ),
            ),
          ),
          const Spacer(),
          Text(
            'François Chollet',
            style: TextStyle(
              color: const Color(0xFF334155),
              fontSize: isThumbnail ? 6 : 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // 3. Microservices Patterns (Dark navy Manning cover)
  Widget _buildMicroservicesCover() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E293B),
            Color(0xFF0F172A),
          ],
        ),
      ),
      padding: EdgeInsets.all(isThumbnail ? 6 : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MICROSERVICES\nPATTERNS',
            style: TextStyle(
              color: Colors.white,
              fontSize: isThumbnail ? 7.5 : 13.5,
              fontWeight: FontWeight.w900,
              height: 1.15,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: isThumbnail ? 2 : 4),
          Text(
            'WITH EXAMPLES IN JAVA',
            style: TextStyle(
              color: const Color(0xFFFBBF24),
              fontSize: isThumbnail ? 4.5 : 7.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Center(
            child: Icon(
              Icons.lan_outlined,
              size: isThumbnail ? 22 : 44,
              color: const Color(0xFF38BDF8),
            ),
          ),
          const Spacer(),
          Text(
            'Chris Richardson',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: isThumbnail ? 6 : 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // 4. Introduction to Algorithms (CLRS)
  Widget _buildAlgorithmsCover() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF173D7A),
            Color(0xFF0B2147),
          ],
        ),
      ),
      padding: EdgeInsets.all(isThumbnail ? 6 : 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'Introduction to\nAlgorithms',
            style: TextStyle(
              color: Colors.white,
              fontSize: isThumbnail ? 8 : 12,
              fontWeight: FontWeight.w800,
              height: 1.15,
            ),
          ),

          Center(
            child: Icon(
              Icons.account_tree_outlined,
              size: isThumbnail ? 20 : 36,
              color: const Color(0xFF67E8F9),
            ),
          ),

          Text(
            'CLRS',
            style: TextStyle(
              color: const Color(0xFFBAE6FD),
              fontSize: isThumbnail ? 6 : 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  // 5. Clean Code
  Widget _buildCleanCodeCover() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: EdgeInsets.all(isThumbnail ? 6 : 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            color: const Color(0xFF0284C7),
            child: Text(
              'A HANDBOOK OF AGILE',
              style: TextStyle(
                color: Colors.white,
                fontSize: isThumbnail ? 4 : 6,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: isThumbnail ? 3 : 6),
          Text(
            'Clean Code',
            style: TextStyle(
              color: const Color(0xFF0F172A),
              fontSize: isThumbnail ? 9 : 14,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          Center(
            child: Container(
              width: isThumbnail ? 22 : 36,
              height: isThumbnail ? 22 : 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF0284C7), width: 2),
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 16,
                color: Color(0xFF0284C7),
              ),
            ),
          ),
          const Spacer(),
          Text(
            'Robert C. Martin',
            style: TextStyle(
              color: const Color(0xFF475569),
              fontSize: isThumbnail ? 6 : 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // 6. Artificial Intelligence: A Modern Approach
  Widget _buildAICover() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0C1F3F),
            Color(0xFF1E3A8A),
          ],
        ),
      ),
      padding: EdgeInsets.all(isThumbnail ? 6 : 10),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ARTIFICIAL\nINTELLIGENCE',
              style: TextStyle(
                color: Colors.white,
                fontSize: isThumbnail ? 7.5 : 12,
                fontWeight: FontWeight.w900,
                height: 1.1,
              ),
            ),
            const Spacer(),
            Center(
              child: Icon(
                Icons.smart_toy_outlined,
                size: isThumbnail ? 20 : 36,
                color: const Color(0xFFF472B6),
              ),
            ),
            const Spacer(),
            Text(
              'Russell & Norvig',
              style: TextStyle(
                color: const Color(0xFFE2E8F0),
                fontSize: isThumbnail ? 6 : 9,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 7. Principles of Database Systems
  Widget _buildDatabaseCover() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: EdgeInsets.all(isThumbnail ? 6 : 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DATABASE\nSYSTEM\nCONCEPTS',
            style: TextStyle(
              color: const Color(0xFF1E293B),
              fontSize: isThumbnail ? 7 : 11,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),
          const Spacer(),
          Center(
            child: Icon(
              Icons.storage_rounded,
              size: isThumbnail ? 20 : 36,
              color: const Color(0xFF0D9488),
            ),
          ),
          const Spacer(),
          Text(
            'Silberschatz',
            style: TextStyle(
              color: const Color(0xFF64748B),
              fontSize: isThumbnail ? 6 : 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // 8. Data Structures & Algorithms in Python (Wiley Edition)
  Widget _buildPythonDataStructuresCover() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F2A52),
            Color(0xFF163E75),
            Color(0xFF0D2342),
          ],
        ),
      ),
      padding: EdgeInsets.all(isThumbnail ? 6 : 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'DATA STRUCTURES\nAND ALGORITHMS\nIN PYTHON',
            style: TextStyle(
              color: Colors.white,
              fontSize: isThumbnail ? 7 : 11.5,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.3,
              height: 1.15,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: isThumbnail ? 2 : 4),
          Text(
            'Michael T. Goodrich\nRoberto Tamassia',
            style: TextStyle(
              color: const Color(0xFF93C5FD),
              fontSize: isThumbnail ? 4.5 : 7,
              fontWeight: FontWeight.w500,
              height: 1.1,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          // Geodesic / Polygonal Network Mesh Graphic
          Center(
            child: Icon(
              Icons.blur_on_rounded,
              size: isThumbnail ? 22 : 42,
              color: const Color(0xFF38BDF8).withValues(alpha: 0.85),
            ),
          ),
          const Spacer(),
          // Bottom Wiley / Logo line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'WILEY',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: isThumbnail ? 5 : 8,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.0,
                ),
              ),
              Icon(
                Icons.code_rounded,
                size: isThumbnail ? 8 : 12,
                color: const Color(0xFF67E8F9),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
