class ProfileModel {
  final String name;
  final String department;
  final String studentId;
  final String session;
  final String academicYearSemester;
  final String cardValidity;
  final String rfidBarcode;
  final String institutionalEmail;
  final bool isEmailVerified;
  final String mobileNumber;
  final bool isSmsAlertActive;
  final int activeIssuedBooks;
  final int totalBorrowedBooks;
  final int onTimeReturnRate;
  final double currentFineAmount;
  final String priorityBookTitle;
  final String priorityBookAuthor;
  final String priorityBookRack;
  final int priorityBookRemainingDays;
  final double priorityBookProgress;
  final int wishlistCount;

  ProfileModel({
    required this.name,
    required this.department,
    required this.studentId,
    required this.session,
    required this.academicYearSemester,
    required this.cardValidity,
    required this.rfidBarcode,
    required this.institutionalEmail,
    required this.isEmailVerified,
    required this.mobileNumber,
    required this.isSmsAlertActive,
    required this.activeIssuedBooks,
    required this.totalBorrowedBooks,
    required this.onTimeReturnRate,
    required this.currentFineAmount,
    required this.priorityBookTitle,
    required this.priorityBookAuthor,
    required this.priorityBookRack,
    required this.priorityBookRemainingDays,
    required this.priorityBookProgress,
    required this.wishlistCount,
  });

  factory ProfileModel.getSampleProfile({bool isEnglish = false}) {
    return ProfileModel(
      name: isEnglish ? 'Tazul Islam' : 'তাজুল ইসলাম',
      department: isEnglish
          ? 'Computer Science & Engineering (CSE)'
          : 'কম্পিউটার সায়েন্স অ্যান্ড ইঞ্জিনিয়ারিং (CSE)',
      studentId: 'CSE-2021-042',
      session: isEnglish ? '2020-21' : '২০২০-২১',
      academicYearSemester: isEnglish ? '4th Year, 8th Semester' : '৪র্থ বর্ষ, ৮ম সেমিস্টার',
      cardValidity: isEnglish ? '31 December, 2026' : '৩১ ডিসেম্বর, ২০২৬',
      rfidBarcode: '8841-0129-4202',
      institutionalEmail: 'tanvir.cse@univ.edu',
      isEmailVerified: true,
      mobileNumber: isEnglish ? '+880 1712-345678' : '+৮৮০ ১৭১২-৩৪৫৬৭৮',
      isSmsAlertActive: true,
      activeIssuedBooks: 3,
      totalBorrowedBooks: 18,
      onTimeReturnRate: 96,
      currentFineAmount: 0.0,
      priorityBookTitle: 'Introduction to Algorithms (4th...)',
      priorityBookAuthor: 'Thomas H. Cormen',
      priorityBookRack: 'CS-304',
      priorityBookRemainingDays: 4,
      priorityBookProgress: 0.72,
      wishlistCount: 5,
    );
  }
}
