import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hub_smart_library/constants/app_strings.dart';
import 'package:hub_smart_library/main.dart';

void main() {
  testWidgets('Mobile Viewport (390x844) test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const HubSmartLibraryApp());
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.text(AppStrings.splashTitle), findsOneWidget);
    await tester.ensureVisible(find.text(AppStrings.getStartedBtn));
    await tester.tap(find.text(AppStrings.getStartedBtn));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text(AppStrings.ssoLoginTitle), findsOneWidget);
    expect(find.text(AppStrings.welcomeHeading), findsOneWidget);
  });

  testWidgets('Tablet Viewport (768x1024) test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(768, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const HubSmartLibraryApp());
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.text(AppStrings.splashTitle), findsOneWidget);
    await tester.ensureVisible(find.text(AppStrings.getStartedBtn));
    await tester.tap(find.text(AppStrings.getStartedBtn));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text(AppStrings.ssoLoginTitle), findsOneWidget);
    expect(find.text(AppStrings.welcomeHeading), findsOneWidget);
  });

  testWidgets('Desktop / Web Viewport (1280x800) test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const HubSmartLibraryApp());
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.text(AppStrings.splashTitle), findsOneWidget);
    await tester.ensureVisible(find.text(AppStrings.getStartedBtn));
    await tester.tap(find.text(AppStrings.getStartedBtn));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    // Verify desktop dual-pane widgets
    expect(find.text(AppStrings.ssoLoginTitle), findsOneWidget);
    expect(find.text('সেন্ট্রাল সার্ভার ক্লাউড সিঙ্ক সক্রিয়'), findsOneWidget);
    expect(find.text(AppStrings.welcomeHeading), findsOneWidget);
  });

  testWidgets('Dashboard Mobile Viewport (390x844) test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const HubSmartLibraryApp());
    await tester.pump(const Duration(milliseconds: 600));

    // Navigate Splash -> Login
    await tester.ensureVisible(find.text(AppStrings.getStartedBtn));
    await tester.tap(find.text(AppStrings.getStartedBtn));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    // Tap Login to enter Dashboard
    await tester.ensureVisible(find.text(AppStrings.loginButton));
    await tester.tap(find.text(AppStrings.loginButton));
    await tester.pump(const Duration(milliseconds: 1500));

    // Confirm dialog
    expect(find.text('ড্যাশবোর্ডে প্রবেশ করুন'), findsOneWidget);
    await tester.tap(find.text('ড্যাশবোর্ডে প্রবেশ করুন'));
    await tester.pump(const Duration(milliseconds: 600));

    // Verify Dashboard Elements
    expect(find.text(AppStrings.smartLibraryTitle), findsOneWidget);
    expect(find.text('স্বাগতম, তানভীর আহমেদ!'), findsOneWidget);
    expect(find.text(AppStrings.digitalPass), findsOneWidget);
    expect(find.text(AppStrings.currentlyBorrowed), findsOneWidget);
    expect(find.text(AppStrings.pendingLateFee), findsOneWidget);
    expect(find.text(AppStrings.popularBooksSectionTitle), findsOneWidget);
    expect(find.text(AppStrings.libraryRulesTitle), findsOneWidget);
  });

  testWidgets('Dashboard Tablet Viewport (768x1024) test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(768, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const HubSmartLibraryApp());
    await tester.pump(const Duration(milliseconds: 600));

    // Navigate Splash -> Login
    await tester.ensureVisible(find.text(AppStrings.getStartedBtn));
    await tester.tap(find.text(AppStrings.getStartedBtn));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    // Tap Login to enter Dashboard
    await tester.ensureVisible(find.text(AppStrings.loginButton));
    await tester.tap(find.text(AppStrings.loginButton));
    await tester.pump(const Duration(milliseconds: 1500));

    // Confirm dialog
    expect(find.text('ড্যাশবোর্ডে প্রবেশ করুন'), findsOneWidget);
    await tester.tap(find.text('ড্যাশবোর্ডে প্রবেশ করুন'));
    await tester.pump(const Duration(milliseconds: 600));

    // Verify Dashboard Tablet Elements
    expect(find.text(AppStrings.smartLibraryTitle), findsOneWidget);
    expect(find.text('স্বাগতম, তানভীর আহমেদ!'), findsOneWidget);
    expect(find.text(AppStrings.popularBooksSectionTitle), findsOneWidget);
    // On tablet, all 3 popular books are laid out in row
    expect(find.text('Designing Data-Intensive Applications'), findsOneWidget);
    expect(find.text('Deep Learning with Python'), findsOneWidget);
    expect(find.text('Microservices Patterns'), findsOneWidget);
  });

  testWidgets('Book Details Mobile Viewport (390x844) test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const HubSmartLibraryApp());
    await tester.pump(const Duration(milliseconds: 600));

    // Splash -> Login -> Dashboard
    await tester.tap(find.text(AppStrings.getStartedBtn));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    await tester.tap(find.text(AppStrings.loginButton));
    await tester.pump(const Duration(milliseconds: 1500));

    await tester.tap(find.text('ড্যাশবোর্ডে প্রবেশ করুন'));
    await tester.pump(const Duration(milliseconds: 600));

    // Tap on first popular book to open Book Details
    await tester.tap(find.text('Designing Data-Intensive Applications'));
    await tester.pump(const Duration(milliseconds: 600));

    // Verify Book Details components
    expect(find.text(AppStrings.bookDetailsTitle), findsOneWidget);
    expect(find.text(AppStrings.breadcrumbCatalog), findsOneWidget);
    expect(find.text(AppStrings.breadcrumbBookDetails), findsOneWidget);
    expect(find.text(AppStrings.shelfLocationTitle), findsOneWidget);
    expect(find.text(AppStrings.shortDescTitle), findsOneWidget);
    expect(find.text(AppStrings.issueRulesTitle), findsOneWidget);
    expect(find.text(AppStrings.submitIssueRequest), findsOneWidget);
  });

  testWidgets('Book Details Tablet Viewport (768x1024) test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(768, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const HubSmartLibraryApp());
    await tester.pump(const Duration(milliseconds: 600));

    // Splash -> Login -> Dashboard
    await tester.tap(find.text(AppStrings.getStartedBtn));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    await tester.tap(find.text(AppStrings.loginButton));
    await tester.pump(const Duration(milliseconds: 1500));

    await tester.tap(find.text('ড্যাশবোর্ডে প্রবেশ করুন'));
    await tester.pump(const Duration(milliseconds: 600));

    // Tap on popular book
    await tester.tap(find.text('Designing Data-Intensive Applications'));
    await tester.pump(const Duration(milliseconds: 600));

    // Verify tablet specific elements
    expect(find.text(AppStrings.bookDetailsTitle), findsOneWidget);
    expect(find.text(AppStrings.shelfLocationTitle), findsOneWidget);
    expect(find.text(AppStrings.editionLabel), findsOneWidget);
    expect(find.text(AppStrings.pubYearLabel), findsOneWidget);
    expect(find.text(AppStrings.isbnLabel), findsOneWidget);
    expect(find.text(AppStrings.tentativeReturnDateLabel), findsOneWidget);
    expect(find.text(AppStrings.lateFeePolicyLabel), findsOneWidget);
  });

  testWidgets('Borrowed Books & Fine Mobile Viewport (390x844) test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const HubSmartLibraryApp());
    await tester.pump(const Duration(milliseconds: 600));

    // Splash -> Login -> Dashboard
    await tester.tap(find.text(AppStrings.getStartedBtn));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    await tester.tap(find.text(AppStrings.loginButton));
    await tester.pump(const Duration(milliseconds: 1500));

    await tester.tap(find.text('ড্যাশবোর্ডে প্রবেশ করুন'));
    await tester.pump(const Duration(milliseconds: 600));

    // Tap "Borrowed" tab in bottom navigation
    await tester.tap(find.text(AppStrings.navBorrowed));
    await tester.pump(const Duration(milliseconds: 600));

    // Verify Borrowed Screen Elements
    expect(find.text(AppStrings.springSemesterUser), findsOneWidget);
    expect(find.text(AppStrings.activeMemberBadge), findsOneWidget);
    expect(find.text(AppStrings.totalIssuedLabel), findsOneWidget);
    expect(find.text(AppStrings.returnPendingLabel), findsOneWidget);
    expect(find.text(AppStrings.pendingFineLabel), findsOneWidget);
    expect(find.text(AppStrings.tabCurrentBooks), findsOneWidget);
    expect(find.text(AppStrings.tabReturnedBooks), findsOneWidget);
    expect(find.text(AppStrings.borrowedListTitle), findsOneWidget);
    expect(find.text(AppStrings.policyTitle), findsOneWidget);
    expect(find.text(AppStrings.payFineButton), findsOneWidget);
  });

  testWidgets('Borrowed Books & Fine Tablet Viewport (768x1024) test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(768, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const HubSmartLibraryApp());
    await tester.pump(const Duration(milliseconds: 600));

    // Splash -> Login -> Dashboard
    await tester.tap(find.text(AppStrings.getStartedBtn));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));

    await tester.tap(find.text(AppStrings.loginButton));
    await tester.pump(const Duration(milliseconds: 1500));

    await tester.tap(find.text('ড্যাশবোর্ডে প্রবেশ করুন'));
    await tester.pump(const Duration(milliseconds: 600));

    // Tap "Borrowed" tab in bottom navigation
    await tester.tap(find.text(AppStrings.navBorrowed));
    await tester.pump(const Duration(milliseconds: 600));

    // Verify Borrowed Books Cards on Tablet
    expect(find.text('Computer Networking: A Top-Down Approach'), findsOneWidget);
    expect(find.text('Operating System Concepts'), findsOneWidget);
    expect(find.text('Discrete Mathematics and Its Applications'), findsOneWidget);
    expect(find.text(AppStrings.btnPayFineAndReturn), findsOneWidget);
  });
}
