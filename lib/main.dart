import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
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
