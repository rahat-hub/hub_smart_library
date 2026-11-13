import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../controllers/book_details_controller.dart';
import '../../widgets/responsive_layout.dart';
import 'widgets/book_breadcrumb_bar.dart';
import 'widgets/book_description_card.dart';
import 'widgets/book_details_app_bar.dart';
import 'widgets/book_details_bottom_actions.dart';
import 'widgets/book_overview_card.dart';
import 'widgets/issue_schedule_card.dart';
import 'widgets/shelf_location_card.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookDetailsController controller = Get.put(BookDetailsController());

    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context, controller),
        tablet: _buildTabletLayout(context, controller),
        desktop: _buildDesktopLayout(context, controller),
      ),
    );
  }

  // 1. Mobile Layout (< 650px)
  Widget _buildMobileLayout(
    BuildContext context,
    BookDetailsController controller,
  ) {
    return SafeArea(
      child: Column(
        children: [
          BookDetailsAppBar(controller: controller, isTablet: false),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Obx(() {
                final book = controller.book.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookBreadcrumbBar(
                      isOnlineReserved: book.isOnlineReserved,
                      isTablet: false,
                    ),
                    const SizedBox(height: 14),
                    BookOverviewCard(book: book, isTablet: false),
                    const SizedBox(height: 16),
                    ShelfLocationCard(
                      location: book.shelfLocation,
                      indexNumber: book.indexNumber,
                      isTablet: false,
                    ),
                    const SizedBox(height: 16),
                    BookDescriptionCard(
                      controller: controller,
                      description: book.description,
                      isTablet: false,
                    ),
                    const SizedBox(height: 16),
                    IssueScheduleCard(
                      returnDate: book.tentativeReturnDate,
                      lateFee: book.lateFeePolicy,
                      isTablet: false,
                    ),
                    const SizedBox(height: 20),
                    BookDetailsBottomActions(controller: controller, isTablet: false),
                    const SizedBox(height: 24),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // 2. Tablet Layout (650px - 1024px)
  Widget _buildTabletLayout(
    BuildContext context,
    BookDetailsController controller,
  ) {
    return SafeArea(
      child: Column(
        children: [
          BookDetailsAppBar(controller: controller, isTablet: true),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: MaxWidthContainer(
                maxWidth: 780.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                child: Obx(() {
                  final book = controller.book.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookBreadcrumbBar(
                        isOnlineReserved: book.isOnlineReserved,
                        isTablet: true,
                      ),
                      const SizedBox(height: 18),
                      BookOverviewCard(book: book, isTablet: true),
                      const SizedBox(height: 18),
                      ShelfLocationCard(
                        location: book.shelfLocation,
                        indexNumber: book.indexNumber,
                        isTablet: true,
                      ),
                      const SizedBox(height: 18),
                      BookDescriptionCard(
                        controller: controller,
                        description: book.description,
                        isTablet: true,
                      ),
                      const SizedBox(height: 18),
                      IssueScheduleCard(
                        returnDate: book.tentativeReturnDate,
                        lateFee: book.lateFeePolicy,
                        isTablet: true,
                      ),
                      const SizedBox(height: 24),
                      BookDetailsBottomActions(controller: controller, isTablet: true),
                      const SizedBox(height: 32),
                    ],
                  );
                }),
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
    BookDetailsController controller,
  ) {
    return SafeArea(
      child: Column(
        children: [
          BookDetailsAppBar(controller: controller, isTablet: true),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: MaxWidthContainer(
                maxWidth: 1040.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                child: Obx(() {
                  final book = controller.book.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookBreadcrumbBar(
                        isOnlineReserved: book.isOnlineReserved,
                        isTablet: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Column: Overview Showcase & Shelf Location
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                BookOverviewCard(book: book, isTablet: true),
                                const SizedBox(height: 18),
                                ShelfLocationCard(
                                  location: book.shelfLocation,
                                  indexNumber: book.indexNumber,
                                  isTablet: true,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 24),

                          // Right Column: Description, Schedule & Actions
                          Expanded(
                            flex: 6,
                            child: Column(
                              children: [
                                BookDescriptionCard(
                                  controller: controller,
                                  description: book.description,
                                  isTablet: true,
                                ),
                                const SizedBox(height: 18),
                                IssueScheduleCard(
                                  returnDate: book.tentativeReturnDate,
                                  lateFee: book.lateFeePolicy,
                                  isTablet: true,
                                ),
                                const SizedBox(height: 22),
                                BookDetailsBottomActions(
                                  controller: controller,
                                  isTablet: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
