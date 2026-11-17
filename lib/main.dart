import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'localization/app_translations.dart';
import 'routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HubSmartLibraryApp());
}

class HubSmartLibraryApp extends StatelessWidget {
  const HubSmartLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: const Locale('bn', 'BD'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.loginScaffoldBg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.navyPrimary,
          primary: AppColors.navyPrimary,
          surface: Colors.white,
        ),
        textTheme: GoogleFonts.hindSiliguriTextTheme(),
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}
