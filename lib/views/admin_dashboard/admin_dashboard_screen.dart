import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/admin_dashboard_controller.dart';
import 'widgets/admin_audit_feed_card.dart';
import 'widgets/admin_bottom_nav.dart';
import 'widgets/admin_circulation_metrics.dart';
import 'widgets/admin_dashboard_app_bar.dart';
import 'widgets/admin_greeting_card.dart';
import 'widgets/admin_inventory_capacity_card.dart';
import 'widgets/admin_live_queue_section.dart';
import 'widgets/admin_overdue_alert_card.dart';
import 'widgets/admin_quick_actions.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminDashboardController());

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isTablet = screenWidth >= 650;
        final isDesktop = screenWidth >= 1024;

        final maxContentWidth = isDesktop ? 880.0 : (isTablet ? 720.0 : double.infinity);
        final horizontalPadding = isTablet ? 24.0 : 16.0;

        return Scaffold(
          backgroundColor: const Color(0xFFF7FAFD),
          body: SafeArea(
            bottom: false,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxContentWidth),
                child: Column(
                  children: [
                    // Top App Bar (styled identically to Student Dashboard App Bar as requested)
                    AdminDashboardAppBar(
                      controller: controller,
                      isTablet: isTablet,
                    ),

                    // Scrollable Admin Content Body
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1. Admin Greeting & Search Card
                            AdminGreetingCard(
                              controller: controller,
                              isTablet: isTablet,
                            ),

                            const SizedBox(height: 18),

                            // 2. Circulation Metrics (Today's Overview)
                            AdminCirculationMetrics(isTablet: isTablet),

                            const SizedBox(height: 18),

                            // 3. Quick Actions Tools
                            AdminQuickActions(
                              controller: controller,
                              isTablet: isTablet,
                            ),

                            const SizedBox(height: 18),

                            // 4. Live Queue (Pending Book Requests)
                            AdminLiveQueueSection(
                              controller: controller,
                              isTablet: isTablet,
                            ),

                            const SizedBox(height: 18),

                            // 5. Urgent Overdue & Fine Alert
                            AdminOverdueAlertCard(
                              controller: controller,
                              isTablet: isTablet,
                            ),

                            const SizedBox(height: 18),

                            // 6. Inventory Capacity & Distribution
                            AdminInventoryCapacityCard(
                              controller: controller,
                              isTablet: isTablet,
                            ),

                            const SizedBox(height: 18),

                            // 7. Recent Transactions (Audit Feed)
                            AdminAuditFeedCard(
                              controller: controller,
                              isTablet: isTablet,
                            ),

                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: AdminBottomNav(
            controller: controller,
            isTablet: isTablet,
          ),
        );
      },
    );
  }
}
