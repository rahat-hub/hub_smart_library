import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../controllers/dashboard_controller.dart';
import '../../widgets/responsive_layout.dart';
import 'widgets/catalog_section.dart';
import 'widgets/category_selector.dart';
import 'widgets/dashboard_app_bar.dart';
import 'widgets/dashboard_bottom_nav.dart';
import 'widgets/library_rules_banner.dart';
import 'widgets/popular_books_section.dart';
import 'widgets/search_filter_bar.dart';
import 'widgets/student_hero_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: AppColors.dashboardBg,
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context, controller),
        tablet: _buildTabletLayout(context, controller),
        desktop: _buildDesktopLayout(context, controller),
      ),
      bottomNavigationBar: ResponsiveLayout(
        mobile: DashboardBottomNav(controller: controller, isTablet: false),
        tablet: DashboardBottomNav(controller: controller, isTablet: true),
        desktop: DashboardBottomNav(controller: controller, isTablet: true),
      ),
    );
  }

  // 1. Mobile Layout (< 650px)
  Widget _buildMobileLayout(
    BuildContext context,
    DashboardController controller,
  ) {
    return SafeArea(
      child: Column(
        children: [
          DashboardAppBar(controller: controller, isTablet: false),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StudentHeroCard(controller: controller, isTablet: false),
                  const SizedBox(height: 18),
                  SearchFilterBar(controller: controller, isTablet: false),
                  const SizedBox(height: 14),
                  CategorySelector(controller: controller, isTablet: false),
                  const SizedBox(height: 22),
                  PopularBooksSection(controller: controller, isTablet: false),
                  const SizedBox(height: 20),
                  LibraryRulesBanner(controller: controller, isTablet: false),
                  const SizedBox(height: 22),
                  CatalogSection(controller: controller, isTablet: false),
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
    DashboardController controller,
  ) {
    return SafeArea(
      child: Column(
        children: [
          DashboardAppBar(controller: controller, isTablet: true),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: MaxWidthContainer(
                maxWidth: 820.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StudentHeroCard(controller: controller, isTablet: true),
                    const SizedBox(height: 22),
                    SearchFilterBar(controller: controller, isTablet: true),
                    const SizedBox(height: 16),
                    CategorySelector(controller: controller, isTablet: true),
                    const SizedBox(height: 26),
                    PopularBooksSection(controller: controller, isTablet: true),
                    const SizedBox(height: 24),
                    LibraryRulesBanner(controller: controller, isTablet: true),
                    const SizedBox(height: 26),
                    CatalogSection(controller: controller, isTablet: true),
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
    DashboardController controller,
  ) {
    return SafeArea(
      child: Column(
        children: [
          DashboardAppBar(controller: controller, isTablet: true),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: MaxWidthContainer(
                maxWidth: 960.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StudentHeroCard(controller: controller, isTablet: true),
                    const SizedBox(height: 24),
                    SearchFilterBar(controller: controller, isTablet: true),
                    const SizedBox(height: 18),
                    CategorySelector(controller: controller, isTablet: true),
                    const SizedBox(height: 28),
                    PopularBooksSection(controller: controller, isTablet: true),
                    const SizedBox(height: 26),
                    LibraryRulesBanner(controller: controller, isTablet: true),
                    const SizedBox(height: 28),
                    CatalogSection(controller: controller, isTablet: true),
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
