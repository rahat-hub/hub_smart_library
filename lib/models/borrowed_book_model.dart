import 'book_model.dart';

enum BorrowedStatus {
  dueToday,
  overdue,
  onTime,
}

class BorrowedBookModel {
  final String id;
  final String title;
  final String author;
  final String shelf;
  final String edition;
  final String issueDate;
  final String dueDate;
  final BorrowedStatus status;
  final String statusBadgeText;
  final double progress; // 0.0 to 1.0 for progress bar
  final int overdueDays;
  final double finePerDay;
  final double totalFine;
  final BookCoverStyle coverStyle;
  bool isReturned;

  BorrowedBookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.shelf,
    required this.edition,
    required this.issueDate,
    required this.dueDate,
    required this.status,
    required this.statusBadgeText,
    required this.progress,
    this.overdueDays = 0,
    this.finePerDay = 5.0,
    this.totalFine = 0.0,
    required this.coverStyle,
    this.isReturned = false,
  });

  String get fineTextBengali {
    if (totalFine <= 0) return 'জরিমানা: ৳০.০০';
    const map = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
      '.': '.',
    };
    final formatted = totalFine.toStringAsFixed(2);
    final bengaliDigits = formatted.split('').map((e) => map[e] ?? e).join('');
    return '৳$bengaliDigits বকেয়া';
  }

  static List<BorrowedBookModel> getSampleBorrowedBooks() {
    return [
      BorrowedBookModel(
        id: '#LIB-884920',
        title: 'Computer Networking: A Top-Down Approach',
        author: 'জেমস কুরোজ এবং কেইথ রস (Kurose & Ross)',
        shelf: 'CN-102',
        edition: '৭ম সংস্করণ',
        issueDate: '১০ এপ্রিল',
        dueDate: '২৪ এপ্রিল (আজ)',
        status: BorrowedStatus.dueToday,
        statusBadgeText: '• আজকেই শেষ দিন (Due Today!)',
        progress: 1.0,
        overdueDays: 0,
        finePerDay: 5.0,
        totalFine: 0.0,
        coverStyle: BookCoverStyle.networkingKurose,
      ),
      BorrowedBookModel(
        id: '#LIB-440192',
        title: 'Operating System Concepts',
        author: 'আব্রাহাম সিলবারশাতজ (Silberschatz)',
        shelf: 'OS-408',
        edition: '১০ম সংস্করণ',
        issueDate: '০১ এপ্রিল',
        dueDate: '১৫ এপ্রিল',
        status: BorrowedStatus.overdue,
        statusBadgeText: '⚠ বিলম্বিত: ৯ দিন ওভারডিউ (Overdue)',
        progress: 1.0,
        overdueDays: 9,
        finePerDay: 5.0,
        totalFine: 45.0,
        coverStyle: BookCoverStyle.operatingSystemsDino,
      ),
      BorrowedBookModel(
        id: '#LIB-310984',
        title: 'Discrete Mathematics and Its Applications',
        author: 'কেনেথ এইচ রোজেন (Kenneth H. Rosen)',
        shelf: 'DM-204',
        edition: 'জরিমানা: ৳০.০০',
        issueDate: '১৮ এপ্রিল',
        dueDate: '০২ মে',
        status: BorrowedStatus.onTime,
        statusBadgeText: '• অন-টাইম (বাকি আছে ৮ দিন)',
        progress: 0.42,
        overdueDays: 0,
        finePerDay: 5.0,
        totalFine: 0.0,
        coverStyle: BookCoverStyle.discreteMathRosen,
      ),
    ];
  }

  static List<BorrowedBookModel> getSampleReturnedBooks() {
    return [
      BorrowedBookModel(
        id: '#LIB-102938',
        title: 'Designing Data-Intensive Applications',
        author: 'Martin Kleppmann',
        shelf: 'CS-01',
        edition: '১ম সংস্করণ',
        issueDate: '০১ মার্চ',
        dueDate: '১৫ মার্চ',
        status: BorrowedStatus.onTime,
        statusBadgeText: '• সফলভাবে জমা দেওয়া হয়েছে',
        progress: 1.0,
        coverStyle: BookCoverStyle.dataIntensive,
        isReturned: true,
      ),
      BorrowedBookModel(
        id: '#LIB-998822',
        title: 'Clean Code',
        author: 'Robert C. Martin',
        shelf: 'SE-04',
        edition: '২য় সংস্করণ',
        issueDate: '১০ ফেব্রুয়ারি',
        dueDate: '২৪ ফেব্রুয়ারি',
        status: BorrowedStatus.onTime,
        statusBadgeText: '• সফলভাবে জমা দেওয়া হয়েছে',
        progress: 1.0,
        coverStyle: BookCoverStyle.cleanCode,
        isReturned: true,
      ),
    ];
  }
}
