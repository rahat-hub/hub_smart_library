import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/responsive_layout.dart';
import '../dashboard/widgets/dashboard_app_bar.dart';
import '../dashboard/widgets/dashboard_bottom_nav.dart';
import 'widgets/digital_smart_pass_card.dart';
import 'widgets/institutional_info_card.dart';
import 'widgets/library_activity_grid.dart';
import 'widgets/library_services_card.dart';
import 'widgets/priority_reading_card.dart';
import 'widgets/profile_header_bar.dart';
import 'widgets/profile_helpdesk_banner.dart';
import 'widgets/profile_logout_button.dart';
import 'widgets/security_settings_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    final DashboardController dashboardController = Get.isRegistered<DashboardController>()
        ? Get.find<DashboardController>()
        : Get.put(DashboardController());

    // Sync active bottom nav index for "My Pass" (index 3) safely after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (dashboardController.currentNavIndex.value != 3) {
        dashboardController.currentNavIndex.value = 3;
      }
    });

    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context, controller, dashboardController),
        tablet: _buildTabletLayout(context, controller, dashboardController),
        desktop: _buildDesktopLayout(context, controller, dashboardController),
      ),
      bottomNavigationBar: ResponsiveLayout(
        mobile: DashboardBottomNav(controller: dashboardController, isTablet: false, activeIndex: 3),
        tablet: DashboardBottomNav(controller: dashboardController, isTablet: true, activeIndex: 3),
        desktop: DashboardBottomNav(controller: dashboardController, isTablet: true, activeIndex: 3),
      ),
    );
  }

  // 1. Mobile Layout (< 650px)
  Widget _buildMobileLayout(
    BuildContext context,
    ProfileController controller,
    DashboardController dashboardController,
  ) {
    return SafeArea(
      child: Column(
        children: [
          DashboardAppBar(controller: dashboardController, isTablet: false),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileHeaderBar(isTablet: false),
                  const SizedBox(height: 14),
                  DigitalSmartPassCard(
                    profile: controller.profile.value,
                    controller: controller,
                    isTablet: false,
                  ),
                  const SizedBox(height: 14),
                  InstitutionalInfoCard(
                    profile: controller.profile.value,
                    controller: controller,
                    isTablet: false,
                  ),
                  const SizedBox(height: 16),
                  LibraryActivityGrid(
                    profile: controller.profile.value,
                    isTablet: false,
                  ),
                  const SizedBox(height: 12),
                  PriorityReadingCard(
                    profile: controller.profile.value,
                    isTablet: false,
                  ),
                  const SizedBox(height: 16),
                  LibraryServicesCard(
                    controller: controller,
                    isTablet: false,
                  ),
                  const SizedBox(height: 14),
                  SecuritySettingsCard(
                    controller: controller,
                    isTablet: false,
                  ),
                  const SizedBox(height: 14),
                  ProfileHelpdeskBanner(
                    controller: controller,
                    isTablet: false,
                  ),
                  const SizedBox(height: 16),
                  ProfileLogoutButton(
                    controller: controller,
                    isTablet: false,
                  ),
                  const SizedBox(height: 24),
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
    ProfileController controller,
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
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProfileHeaderBar(isTablet: true),
                    const SizedBox(height: 16),
                    DigitalSmartPassCard(
                      profile: controller.profile.value,
                      controller: controller,
                      isTablet: true,
                    ),
                    const SizedBox(height: 16),
                    InstitutionalInfoCard(
                      profile: controller.profile.value,
                      controller: controller,
                      isTablet: true,
                    ),
                    const SizedBox(height: 18),
                    LibraryActivityGrid(
                      profile: controller.profile.value,
                      isTablet: true,
                    ),
                    const SizedBox(height: 14),
                    PriorityReadingCard(
                      profile: controller.profile.value,
                      isTablet: true,
                    ),
                    const SizedBox(height: 18),
                    LibraryServicesCard(
                      controller: controller,
                      isTablet: true,
                    ),
                    const SizedBox(height: 16),
                    SecuritySettingsCard(
                      controller: controller,
                      isTablet: true,
                    ),
                    const SizedBox(height: 16),
                    ProfileHelpdeskBanner(
                      controller: controller,
                      isTablet: true,
                    ),
                    const SizedBox(height: 20),
                    ProfileLogoutButton(
                      controller: controller,
                      isTablet: true,
                    ),
                    const SizedBox(height: 32),
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
    ProfileController controller,
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
                maxWidth: 1080.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProfileHeaderBar(isTablet: true),
                    const SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column: Smart Pass, Institutional Info, Activity & Priority Book
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DigitalSmartPassCard(
                                profile: controller.profile.value,
                                controller: controller,
                                isTablet: true,
                              ),
                              const SizedBox(height: 16),
                              InstitutionalInfoCard(
                                profile: controller.profile.value,
                                controller: controller,
                                isTablet: true,
                              ),
                              const SizedBox(height: 18),
                              LibraryActivityGrid(
                                profile: controller.profile.value,
                                isTablet: true,
                              ),
                              const SizedBox(height: 14),
                              PriorityReadingCard(
                                profile: controller.profile.value,
                                isTablet: true,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 24),

                        // Right Column: Services, Security Settings, Helpdesk & Logout
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LibraryServicesCard(
                                controller: controller,
                                isTablet: true,
                              ),
                              const SizedBox(height: 16),
                              SecuritySettingsCard(
                                controller: controller,
                                isTablet: true,
                              ),
                              const SizedBox(height: 16),
                              ProfileHelpdeskBanner(
                                controller: controller,
                                isTablet: true,
                              ),
                              const SizedBox(height: 20),
                              ProfileLogoutButton(
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
