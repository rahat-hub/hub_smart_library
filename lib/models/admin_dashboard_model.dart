import 'package:flutter/material.dart';
import 'book_model.dart';

class LiveQueueItem {
  final String id;
  final String bookTitle;
  final String studentName;
  final String studentId;
  final String copyTag;
  final String timeAgo;
  final BookCoverStyle coverStyle;
  bool isApproved;
  bool isRejected;

  LiveQueueItem({
    required this.id,
    required this.bookTitle,
    required this.studentName,
    required this.studentId,
    required this.copyTag,
    required this.timeAgo,
    required this.coverStyle,
    this.isApproved = false,
    this.isRejected = false,
  });
}

class OverdueAlertItem {
  final String id;
  final String studentName;
  final String studentRoll;
  final String bookTitle;
  final int overdueDays;
  final double fineAmount;
  bool isReminderSent;

  OverdueAlertItem({
    required this.id,
    required this.studentName,
    required this.studentRoll,
    required this.bookTitle,
    required this.overdueDays,
    required this.fineAmount,
    this.isReminderSent = false,
  });
}

class AuditTransactionItem {
  final String id;
  final String title;
  final String timeAgo;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;

  AuditTransactionItem({
    required this.id,
    required this.title,
    required this.timeAgo,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
  });
}

class DepartmentCapacityItem {
  final String department;
  final int percentage;
  final String copiesAllocated;
  final double progress;
  final Color barColor;

  DepartmentCapacityItem({
    required this.department,
    required this.percentage,
    required this.copiesAllocated,
    required this.progress,
    required this.barColor,
  });
}
