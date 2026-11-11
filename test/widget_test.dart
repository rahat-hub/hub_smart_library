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
}
