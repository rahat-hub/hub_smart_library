import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/admin_dashboard_controller.dart';
import '../../../models/admin_dashboard_model.dart';
import '../../dashboard/widgets/book_cover_widget.dart';

class AdminLiveQueueSection extends StatelessWidget {
  final AdminDashboardController controller;
  final bool isTablet;

  const AdminLiveQueueSection({
    super.key,
    required this.controller,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row: Title + 4 New Badge + See All
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  AppStrings.liveQueueTitle,
                  style: TextStyle(
                    fontSize: isTablet ? 15.5 : 14.0,
                    fontWeight: FontWeight.w800,
                    color: AppColors.slateHeading,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFDBEAFE)),
                  ),
                  child: Text(
                    AppStrings.pending4NewBadge,
                    style: const TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.navyPrimary,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.snackbar(
                  AppStrings.liveQueueTitle,
                  AppStrings.isEnglish ? 'Viewing all loan requests' : 'সকল বই লোন রিকোয়েস্ট লোড হচ্ছে...',
                  backgroundColor: AppColors.navyPrimary,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.all(16),
                  borderRadius: 12,
                );
              },
              child: Text(
                AppStrings.seeAllRequests,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.linkBlue,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Live Queue Cards List
        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.liveQueueRequests.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = controller.liveQueueRequests[index];
              return _buildQueueCard(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQueueCard(LiveQueueItem item) {
    if (item.isApproved) {
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF0FDF4),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFBBF7D0)),
        ),
        child: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Color(0xFF16A34A), size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${item.bookTitle} — অনুমোদন সম্পন্ন (${item.studentName})',
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF15803D),
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (item.isRejected) {
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFEF2F2),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFFECACA)),
        ),
        child: Row(
          children: [
            const Icon(Icons.cancel_rounded, color: Color(0xFFDC2626), size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${item.bookTitle} — রিকোয়েস্ট বাতিল করা হয়েছে',
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB91C1C),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(isTablet ? 14 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          // Top Row: Book Cover + Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Cover Thumbnail
              SizedBox(
                width: 48,
                height: 66,
                child: BookCoverWidget(
                  style: item.coverStyle,
                  isThumbnail: true,
                  isCompact: true,
                ),
              ),

              const SizedBox(width: 12),

              // Info Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Copy Tag + Timestamp
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDCFCE7),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFBBF7D0)),
                          ),
                          child: Text(
                            item.copyTag,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF15803D),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.access_time_rounded, size: 12, color: Color(0xFF94A3B8)),
                            const SizedBox(width: 3),
                            Text(
                              item.timeAgo,
                              style: const TextStyle(
                                fontSize: 10.5,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Book Title
                    Text(
                      item.bookTitle,
                      style: TextStyle(
                        fontSize: isTablet ? 14 : 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.slateHeading,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Student Name & ID
                    Row(
                      children: [
                        const Icon(Icons.person_outline_rounded, size: 14, color: AppColors.slateSubtitle),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            '${item.studentName} • ${item.studentId}',
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: AppColors.slateSubtitle,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Action Buttons: Approve & Reject
          Row(
            children: [
              // Approve Button
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 38,
                  child: ElevatedButton.icon(
                    onPressed: () => controller.approveRequest(item),
                    icon: const Icon(Icons.check_circle_outline_rounded, size: 16),
                    label: Text(
                      AppStrings.approveBtn,
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F2B5C),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Reject Button
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 38,
                  child: OutlinedButton(
                    onPressed: () => controller.rejectRequest(item),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFF8FAFC),
                      foregroundColor: const Color(0xFF64748B),
                      side: const BorderSide(color: Color(0xFFE2E8F0)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      AppStrings.rejectBtn,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
