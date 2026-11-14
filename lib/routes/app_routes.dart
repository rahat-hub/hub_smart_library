import 'package:get/get.dart';
import '../views/splash/splash_screen.dart';
import '../views/login/login_screen.dart';
import '../views/dashboard/dashboard_screen.dart';
import '../views/book_details/book_details_screen.dart';
import '../views/borrowed_books/borrowed_books_screen.dart';
import '../views/notifications/notification_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String bookDetails = '/book-details';
  static const String borrowedBooks = '/borrowed-books';
  static const String notifications = '/notifications';

  static final List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: dashboard,
      page: () => const DashboardScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: bookDetails,
      page: () => const BookDetailsScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: borrowedBooks,
      page: () => const BorrowedBooksScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: notifications,
      page: () => const NotificationScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 350),
    ),
  ];
}
