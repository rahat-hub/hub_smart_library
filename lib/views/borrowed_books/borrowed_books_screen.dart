import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../controllers/borrowed_books_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../widgets/responsive_layout.dart';
import '../dashboard/widgets/dashboard_app_bar.dart';
import '../dashboard/widgets/dashboard_bottom_nav.dart';
import 'widgets/borrowed_book_card.dart';
import 'widgets/borrowed_list_header.dart';
import 'widgets/borrowed_segmented_tabs.dart';
import 'widgets/borrowed_summary_metrics.dart';
import 'widgets/floating_fine_pay_bar.dart';
import 'widgets/policy_terms_card.dart';
import 'widgets/semester_user_bar.dart';

class BorrowedBooksScreen extends StatelessWidget {
  const BorrowedBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BorrowedBooksController controller = Get.put(BorrowedBooksController());
    final DashboardController dashboardController = Get.isRegistered<DashboardController>()
        ? Get.find<DashboardController>()
        : Get.put(DashboardController());

    // Sync active nav index
    dashboardController.currentNavIndex.value = 1;

    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context, controller, dashboardController),
        tablet: _buildTabletLayout(context, controller, dashboardController),
        desktop: _buildDesktopLayout(context, controller, dashboardController),
      ),
      bottomNavigationBar: ResponsiveLayout(
        mobile: DashboardBottomNav(controller: dashboardController, isTablet: false),
        tablet: DashboardBottomNav(controller: dashboardController, isTablet: true),
        desktop: DashboardBottomNav(controller: dashboardController, isTablet: true),
      ),
    );
  }

  // 1. Mobile Layout (< 650px)
  Widget _buildMobileLayout(
    BuildContext context,
    BorrowedBooksController controller,
    DashboardController dashboardController,
  ) {
    return SafeArea(
      child: Column(
        children: [
          DashboardAppBar(controller: dashboardController, isTablet: false),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SemesterUserBar(isTablet: false),
                  const SizedBox(height: 14),
                  BorrowedSummaryMetrics(controller: controller, isTablet: false),
                  const SizedBox(height: 14),
                  BorrowedSegmentedTabs(controller: controller, isTablet: false),
                  const SizedBox(height: 16),
                  const BorrowedListHeader(isTablet: false),
                  const SizedBox(height: 12),
                  _buildBooksList(controller, isTablet: false),
                  const SizedBox(height: 16),
                  const PolicyTermsCard(isTablet: false),
                  const SizedBox(height: 14),
                  FloatingFinePayBar(controller: controller, isTablet: false),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2. Tablet Layout (650px - 1024px)
  Widget _buildTabletLayout(
    BuildContext context,
    BorrowedBooksController controller,
    DashboardController dashboardController,
  ) {
    return SafeArea(
      child: Column(
        children: [
          DashboardAppBar(controller: dashboardController, isTablet: true),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: MaxWidthContainer(
                maxWidth: 780.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SemesterUserBar(isTablet: true),
                    const SizedBox(height: 16),
                    BorrowedSummaryMetrics(controller: controller, isTablet: true),
                    const SizedBox(height: 16),
                    BorrowedSegmentedTabs(controller: controller, isTablet: true),
                    const SizedBox(height: 20),
                    const BorrowedListHeader(isTablet: true),
                    const SizedBox(height: 14),
                    _buildBooksList(controller, isTablet: true),
                    const SizedBox(height: 18),
                    const PolicyTermsCard(isTablet: true),
                    const SizedBox(height: 16),
                    FloatingFinePayBar(controller: controller, isTablet: true),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 3. Desktop Layout (> 1024px)
  Widget _buildDesktopLayout(
    BuildContext context,
    BorrowedBooksController controller,
    DashboardController dashboardController,
  ) {
    return SafeArea(
      child: Column(
        children: [
          DashboardAppBar(controller: dashboardController, isTablet: true),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: MaxWidthContainer(
                maxWidth: 1040.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 14.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SemesterUserBar(isTablet: true),
                    const SizedBox(height: 18),
                    BorrowedSummaryMetrics(controller: controller, isTablet: true),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column: Segmented Tabs & Book Cards
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BorrowedSegmentedTabs(controller: controller, isTablet: true),
                              const SizedBox(height: 18),
                              const BorrowedListHeader(isTablet: true),
                              const SizedBox(height: 14),
                              _buildBooksList(controller, isTablet: true),
                            ],
                          ),
                        ),

                        const SizedBox(width: 24),

                        // Right Column: Policy Card & Floating Fine Summary
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              FloatingFinePayBar(controller: controller, isTablet: true),
                              const SizedBox(height: 18),
                              const PolicyTermsCard(isTablet: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Books List builder depending on active segmented tab
  Widget _buildBooksList(BorrowedBooksController controller, {required bool isTablet}) {
    return Obx(() {
      final isCurrent = controller.selectedTab.value == 0;
      final books = isCurrent ? controller.currentBooks : controller.returnedBooks;

      if (books.isEmpty) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 36),
          alignment: Alignment.center,
          child: const Text(
            'কোন বই নেই',
            style: TextStyle(color: AppColors.slateSubtitle),
          ),
        );
      }

      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: books.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return BorrowedBookCard(
            book: books[index],
            controller: controller,
            isTablet: isTablet,
          );
        },
      );
    });
  }
}
