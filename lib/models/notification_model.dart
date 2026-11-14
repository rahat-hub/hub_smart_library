import 'package:flutter/material.dart';
import 'book_model.dart';

enum NotificationType {
  issueApproved,
  dueReminder,
  fineNotice,
  newArrival,
}

class NotificationModel {
  final String id;
  final NotificationType type;
  final String categoryFilter; // e.g. 'রিকোয়েস্ট স্ট্যাটাস', 'রিটার্ন অ্যালার্ট', 'জরিমানা'
  final String badgeText;
  final Color badgeColor;
  final Color badgeBg;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String timeAgo;
  final String title;
  final String description;

  // Optional fields for specific notification types
  final String? bookTitle;
  final String? bookSubtitle;
  final BookCoverStyle? bookCover;
  final String? token;
  final String? dueTimeText;
  final double? fineAmount;
  final String? fineRate;
  final String? invoiceId;
  final List<Map<String, dynamic>>? arrivalBooks;
  bool isRead;

  NotificationModel({
    required this.id,
    required this.type,
    required this.categoryFilter,
    required this.badgeText,
    required this.badgeColor,
    required this.badgeBg,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.timeAgo,
    required this.title,
    required this.description,
    this.bookTitle,
    this.bookSubtitle,
    this.bookCover,
    this.token,
    this.dueTimeText,
    this.fineAmount,
    this.fineRate,
    this.invoiceId,
    this.arrivalBooks,
    this.isRead = false,
  });

  static List<NotificationModel> getSampleNotifications() {
    return [
      // 1. Issue Approved
      NotificationModel(
        id: 'notif_1',
        type: NotificationType.issueApproved,
        categoryFilter: 'রিকোয়েস্ট স্ট্যাটাস',
        badgeText: '• অনুমোদিত (Approved)',
        badgeColor: const Color(0xFF0F766E),
        badgeBg: const Color(0xFFCCFBF1),
        icon: Icons.check_circle_outline_rounded,
        iconColor: const Color(0xFF059669),
        iconBg: const Color(0xFFD1FAE5),
        timeAgo: '১০ মিনিট আগে',
        title: 'ইস্যু রিকোয়েস্ট অনুমোদিত হয়েছে!',
        description:
            'লাইব্রেরিয়ান আপনার রিকোয়েস্ট অনুমোদন করেছেন। অনুগ্রহ করে সেন্ট্রাল লাইব্রেরির কাউন্টার-২ থেকে আগামী ২৪ ঘণ্টার মধ্যে বইটি সংগ্রহ করুন।',
        bookTitle: 'Data Structures and Algorithm...',
        bookSubtitle: 'Michael T. Goodrich • 005.133 GOO',
        bookCover: BookCoverStyle.pythonDataStructures,
        token: '#REQ-4912',
      ),

      // 2. Due Reminder
      NotificationModel(
        id: 'notif_2',
        type: NotificationType.dueReminder,
        categoryFilter: 'রিটার্ন অ্যালার্ট',
        badgeText: '• আজকেই শেষ দিন (Due Today)',
        badgeColor: const Color(0xFFB45309),
        badgeBg: const Color(0xFFFEF3C7),
        icon: Icons.access_time_rounded,
        iconColor: const Color(0xFFD97706),
        iconBg: const Color(0xFFFEF3C7),
        timeAgo: '২ ঘণ্টা আগে',
        title: 'জরুরি রিটার্ন রিমাইন্ডার!',
        description:
            'আজকে বইটি ফেরত দেওয়ার শেষ দিন। জরিমানা এড়াতে বিকাল ৪:৩০ টার মধ্যে কাউন্টারে জমা দিন অথবা অ্যাপ থেকে রিনিউ করুন।',
        bookTitle: 'Computer Networking: A Top-Dow...',
        dueTimeText: '৪:৩০ PM পর্যন্ত',
      ),

      // 3. Fine Notice
      NotificationModel(
        id: 'notif_3',
        type: NotificationType.fineNotice,
        categoryFilter: 'জরিমানা',
        badgeText: '• জরিমানা কার্যকর (Fine Incurred)',
        badgeColor: const Color(0xFFDC2626),
        badgeBg: const Color(0xFFFEE2E2),
        icon: Icons.warning_amber_rounded,
        iconColor: const Color(0xFFDC2626),
        iconBg: const Color(0xFFFEE2E2),
        timeAgo: 'গতকাল',
        title: 'বিলম্ব ফি গণনা ও নোটিশ',
        description:
            'বইটি ৯ দিন ওভারডিউ হয়েছে। মোট বকেয়া জরিমানা ৳৪৫.০০ যুক্ত হয়েছে। কার্ড লকিং এড়াতে দ্রুত পরিশোধ করুন।',
        bookTitle: 'Operating System Concepts',
        fineAmount: 45.0,
        fineRate: 'বিলম্ব সময়: ৯ দিন (৳৫/দিন)',
        invoiceId: '#FIN-8201',
      ),

      // 4. New Book Arrival
      NotificationModel(
        id: 'notif_4',
        type: NotificationType.newArrival,
        categoryFilter: 'রিকোয়েস্ট স্ট্যাটাস',
        badgeText: 'ক্যাটালগ আপডেট',
        badgeColor: const Color(0xFF1D4ED8),
        badgeBg: const Color(0xFFDBEAFE),
        icon: Icons.auto_stories_rounded,
        iconColor: const Color(0xFF1D4ED8),
        iconBg: const Color(0xFFDBEAFE),
        timeAgo: '৩ দিন আগে',
        title: 'নতুন বই এসেছে (New Book Arrival)',
        description: 'আপনার প্রিয় ক্যাটাগরি Artificial Intelligence-এ ৩টি নতুন বই যুক্ত হয়েছে।',
        arrivalBooks: [
          {
            'title': 'Deep Learning',
            'coverStyle': BookCoverStyle.deepLearning,
          },
          {
            'title': 'Pattern Recog.',
            'coverStyle': BookCoverStyle.dataIntensive,
          },
          {
            'title': 'Generative AI',
            'coverStyle': BookCoverStyle.databaseSystems,
          },
        ],
      ),
    ];
  }
}
