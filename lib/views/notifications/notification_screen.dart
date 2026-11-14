import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/notification_controller.dart';
import '../../models/notification_model.dart';
import '../../widgets/responsive_layout.dart';
import '../dashboard/widgets/dashboard_app_bar.dart';
import '../dashboard/widgets/dashboard_bottom_nav.dart';
import 'widgets/approved_request_card.dart';
import 'widgets/due_reminder_card.dart';
import 'widgets/fine_notice_card.dart';
import 'widgets/help_desk_footer_card.dart';
import 'widgets/new_arrival_card.dart';
import 'widgets/notification_filter_chips.dart';
import 'widgets/notification_sub_header.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());
    final DashboardController dashboardController = Get.isRegistered<DashboardController>()
        ? Get.find<DashboardController>()
        : Get.put(DashboardController());

    // Sync active nav index
    dashboardController.currentNavIndex.value = 2;

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
    NotificationController controller,
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
                  NotificationSubHeader(controller: controller, isTablet: false),
                  const SizedBox(height: 12),
                  NotificationFilterChips(controller: controller, isTablet: false),
                  const SizedBox(height: 14),
                  _buildNotificationList(controller, isTablet: false),
                  const SizedBox(height: 16),
                  const HelpDeskFooterCard(isTablet: false),
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
    NotificationController controller,
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
                    NotificationSubHeader(controller: controller, isTablet: true),
                    const SizedBox(height: 14),
                    NotificationFilterChips(controller: controller, isTablet: true),
                    const SizedBox(height: 16),
                    _buildNotificationList(controller, isTablet: true),
                    const SizedBox(height: 18),
                    const HelpDeskFooterCard(isTablet: true),
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
    NotificationController controller,
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
                    NotificationSubHeader(controller: controller, isTablet: true),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column: Filter Chips & Notification Cards
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NotificationFilterChips(controller: controller, isTablet: true),
                              const SizedBox(height: 16),
                              _buildNotificationList(controller, isTablet: true),
                            ],
                          ),
                        ),

                        const SizedBox(width: 24),

                        // Right Column: Sticky Help Desk & Quick Actions
                        const Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              HelpDeskFooterCard(isTablet: true),
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

  // Notification Cards List builder
  Widget _buildNotificationList(
    NotificationController controller, {
    required bool isTablet,
  }) {
    return Obx(() {
      final items = controller.filteredNotifications;

      if (items.isEmpty) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          alignment: Alignment.center,
          child: const Text(
            'কোন নোটিফিকেশন নেই',
            style: TextStyle(color: AppColors.slateSubtitle),
          ),
        );
      }

      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final notif = items[index];

          switch (notif.type) {
            case NotificationType.issueApproved:
              return ApprovedRequestCard(
                notification: notif,
                controller: controller,
                isTablet: isTablet,
              );
            case NotificationType.dueReminder:
              return DueReminderCard(
                notification: notif,
                controller: controller,
                isTablet: isTablet,
              );
            case NotificationType.fineNotice:
              return FineNoticeCard(
                notification: notif,
                controller: controller,
                isTablet: isTablet,
              );
            case NotificationType.newArrival:
              return NewArrivalCard(
                notification: notif,
                controller: controller,
                isTablet: isTablet,
              );
          }
        },
      );
    });
  }
}
