import 'package:get/get.dart';

class AppStrings {
  // Localization state helpers
  static bool get isEnglish => Get.locale?.languageCode == 'en';
  static bool get isBangla => !isEnglish;

  static const Map<String, String> _bnDigits = {
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
  };

  static String toBengaliNumber(dynamic number) {
    if (number == null) return '';
    final str = number.toString();
    return str.split('').map((char) => _bnDigits[char] ?? char).join('');
  }

  static String formatNumber(dynamic number) {
    if (number == null) return '';
    if (isEnglish) {
      return number.toString();
    } else {
      return toBengaliNumber(number);
    }
  }

  static String formatCurrency(num amount) {
    final formatted = amount.toStringAsFixed(2);
    if (isEnglish) {
      return '৳$formatted';
    } else {
      return '৳${toBengaliNumber(formatted)}';
    }
  }

  static String formatBooksCount(int count) {
    if (isEnglish) {
      return '$count ${count == 1 ? "Book" : "Books"}';
    } else {
      return '${toBengaliNumber(count)}টি বই';
    }
  }

  static String formatDaysRemaining(int days) {
    if (isEnglish) {
      return '$days ${days == 1 ? "day left" : "days left"}';
    } else {
      return '${toBengaliNumber(days)} দিন বাকি';
    }
  }

  // Common Statuses & Actions
  static String get active => isEnglish ? 'Active' : 'সক্রিয়';
  static String get total => isEnglish ? 'Total' : 'টোটাল';
  static String get paid => isEnglish ? 'Paid' : 'পরিশোধিত';
  static String get due => isEnglish ? 'Due' : 'বকেয়া';
  static String get noBooksFound => isEnglish ? 'No books found' : 'কোন বই পাওয়া যায়নি';
  static String get noNotificationsFound => isEnglish ? 'No notifications' : 'কোন নোটিফিকেশন নেই';

  // App Title
  static String get appTitle => isEnglish ? 'Hub Smart Library' : 'হাব স্মার্ট লাইব্রেরি';

  // Splash Screen Strings
  static String get topBadgeText =>
      isEnglish ? 'Central University Library Automation System' : 'সেন্ট্রাল ইউনিভার্সিটি লাইব্রেরি অটোমেশন সিস্টেম';
  static String get splashTitle => isEnglish ? 'Smart Library' : 'স্মার্ট লাইব্রেরি';
  static String get splashSubtitle => isEnglish ? 'SMART LIBRARY ECOSYSTEM' : 'SMART LIBRARY ECOSYSTEM';
  static String get splashTagline =>
      isEnglish ? 'Digital Fusion of Knowledge & Technology' : 'জ্ঞান ও প্রযুক্তির ডিজিটাল মেলবন্ধন';

  static String get chipDigitalTracking => isEnglish ? 'Digital Book Tracking' : 'ডিজিটাল বুক ট্র্যাকিং';
  static String get chipInstantIssue => isEnglish ? 'Instant Issue & Return' : 'তাৎক্ষণিক ইস্যু ও রিটার্ন';
  static String get chipLiveCatalog => isEnglish ? 'Live Catalog' : 'লাইভ ক্যাটালগ';

  static String get serverConnected =>
      isEnglish ? 'Directly Connected • Central Server' : 'সরাসরি সংযুক্ত • সেন্ট্রাল সার্ভার';
  static String get ebooksCount => isEnglish ? '45,000+ E-Books' : '৪৫,০০০+ ই-বুকস';

  static String get databaseSyncText =>
      isEnglish ? 'Database Fully Synchronized' : 'ডাটাবেজ সম্পূর্ণ সিঙ্ক হয়েছে';
  static String get syncPercentage => isEnglish ? '100%' : '১০০%';

  static String get getStartedBtn => isEnglish ? 'Get Started' : 'শুরু করুন (Get Started)';
  static String get biometricSupported =>
      isEnglish ? 'Biometric & Student ID Card Supported' : 'বায়োমেট্রিক ও স্টুডেন্ট আইডি কার্ড সমর্থিত';

  static String get versionInfo =>
      isEnglish ? 'Version 2.4.0 • Powered by ICT Cell' : 'ভার্সন ২.৪.০ • আইসিটি সেল কর্তৃক চালিত';
  static String get copyrightInfo =>
      isEnglish ? '© 2025 Central University • All Rights Reserved' : '© ২০২৫ সেন্ট্রাল ইউনিভার্সিটি • সর্বস্বত্ব সংরক্ষিত';

  // Login Screen Strings
  static String get ssoLoginTitle => isEnglish ? 'Student SSO Login' : 'স্টুডেন্ট SSO লগইন';
  static String get universityBadge => 'UNIVERSITY OF EXCELLENCE';
  static String get welcomeHeading => isEnglish ? 'Welcome!' : 'স্বাগতম!';
  static String get loginSubtitle => isEnglish
      ? 'Sign in with your Student ID or Admin credentials'
      : 'আপনার স্টুডেন্ট আইডি অথবা অ্যাডমিন ক্রেডেনশিয়াল দিয়ে প্রবেশ করুন';

  static String get tabStudent => isEnglish ? 'Student' : 'শিক্ষার্থী (Student)';
  static String get tabAdmin => isEnglish ? 'Admin (Staff)' : 'অ্যাডমিন (Staff)';

  static String get labelStudentId => isEnglish ? 'Student ID / Roll Number' : 'স্টুডেন্ট আইডি / রোল নম্বর';
  static String get hintStudentId => 'e.g., CSE-2021-042';
  static String get defaultStudentId => 'CSE-2021-042';

  static String get labelAdminId => isEnglish ? 'Admin ID / Username' : 'অ্যাডমিন আইডি / ইউজারনেম';
  static String get hintAdminId => 'e.g., ADM-88412';

  static String get labelPassword => isEnglish ? 'University Password or PIN' : 'বিশ্ববিদ্যালয় পাসওয়ার্ড বা পিন';
  static String get forgotPin => isEnglish ? 'Forgot PIN?' : 'পিন ভুলে গেছেন?';

  static String get rememberMe => isEnglish ? 'Remember Device' : 'ডিভাইস মনে রাখুন (Remember me)';
  static String get loginButton => isEnglish ? 'Log In' : 'লগইন করুন (Log In)';

  static String get smartCardTitle => isEnglish ? 'Smart Card Scan' : 'স্মার্ট কার্ড স্ক্যান';
  static String get smartCardSubtitle =>
      isEnglish ? 'Tap Barcode or RFID Card' : 'বারকোড বা আরএফআইডি স্পর্শ করুন';
  static String get scanText => isEnglish ? 'Scan' : 'স্ক্যান';

  static String get orUniversityPortal => isEnglish ? 'Or via University Portal' : 'অথবা ইউনিভার্সিটি পোর্টাল দিয়ে';
  static String get eduIdButton =>
      isEnglish ? 'Sign in with University EduID' : 'University EduID দিয়ে প্রবেশ';

  static String get newStudentPrompt => isEnglish ? 'New student? ' : 'নতুন শিক্ষার্থী? ';
  static String get activateAccount =>
      isEnglish ? 'Activate Library Account' : 'লাইব্রেরি একাউন্ট সক্রিয় করুন';

  static String get helpDeskTitle => isEnglish ? 'Library Help Desk' : 'লাইব্রেরি সহায়তা কেন্দ্র (Help Desk)';
  static String get helpDeskEmail =>
      isEnglish ? 'Email: support@library.univ.edu' : 'ইমেইল: support@library.univ.edu';
  static String get helpDeskHelpline =>
      isEnglish ? 'Helpline: 01700-000000 (9 AM - 8 PM)' : 'হেল্পলাইন: ০১৭০০-০০০০০০ (সকাল ৯টা - রাত ৮টা)';

  // Dashboard Strings
  static String get universityUpper => 'HAMDARD UNIVERSITY';
  static String get smartLibraryTitle => isEnglish ? 'Smart Library' : 'স্মার্ট লাইব্রেরি';

  static String get academicSessionTag =>
      isEnglish ? '• Academic Session 2024-25' : '• একাডেমিক সেশন ২০২৪-২৫';
  static String get welcomeStudentGreeting =>
      isEnglish ? 'Welcome, Tajul Islam!' : 'স্বাগতম, তাজুল ইসলাম!';
  static String get defaultStudentIdCode => 'STUDENT ID: CSE-2021-042';
  static String get digitalPass => isEnglish ? 'Digital Pass' : 'ডিজিটাল পাস';

  static String get currentlyBorrowed => isEnglish ? 'Currently Borrowed' : 'বর্তমানে ধার নেওয়া';
  static String get currentlyBorrowedCount => isEnglish ? '3 Books' : '৩টি বই';
  static String get pendingLateFee => isEnglish ? 'Pending Late Fee' : 'বকেয়া লেট ফি';
  static String get pendingLateFeeAmount => isEnglish ? '৳0.00' : '৳০.০০';

  static String get searchBooksHint =>
      isEnglish ? 'Search by book title, author, or ISBN...' : 'বইয়ের নাম, লেখক বা ISBN দিয়ে খুঁজুন...';

  // Categories
  static String get catAllBooks => isEnglish ? 'All Books' : 'সকল বই';
  static String get catComputerScience => 'Computer Science';
  static String get catElectrical => 'Electrical';
  static String get catBbaFinance => 'BBA & Finance';
  static String get catLiterature => 'Literature';
  static String get catMathematics => 'Mathematics';
  static String get catMechanical => isEnglish ? 'Mechanical' : 'মেকানিক্যাল';

  // Popular Books Section
  static String get popularBooksSectionTitle =>
      isEnglish ? 'Popular & Most Read Books' : 'জনপ্রিয় ও বহুল পঠিত বই';
  static String get seeAll => isEnglish ? 'See All >' : 'সব দেখুন >';
  static String get borrowNow => isEnglish ? 'Borrow' : 'ধার নিন';

  // Rules Banner
  static String get libraryRulesTitle =>
      isEnglish ? 'Digital ID & Library Rules' : 'ডিজিটাল আইডি ও লাইব্রেরি রুলস';
  static String get libraryRulesSubtitle => isEnglish
      ? 'Book return guidelines, borrowing limits & fee policy'
      : 'বই ফেরত নিয়মাবলী, সর্বোচ্চ ইস্যু সীমা ও ফি নির্দেশিকা';

  // Catalog Section
  static String get catalogSectionTitle =>
      isEnglish ? 'Library Catalog & New Books' : 'লাইব্রেরি ক্যাটালগ ও নতুন বই';
  static String get catalogListedCount => isEnglish ? '4 Listed' : '৪টি তালিকাভুক্ত';

  // Bottom Nav
  static String get navExplore => isEnglish ? 'Explore' : 'এক্সপ্লোর';
  static String get navBorrowed => isEnglish ? 'Borrowed' : 'ধার নেওয়া';
  static String get navAlerts => isEnglish ? 'Alerts' : 'অ্যালার্ট';
  static String get navMyPass => isEnglish ? 'My Pass' : 'মাই পাস';

  // Book Details Strings
  static String get bookDetailsTitle => isEnglish ? 'Book Details' : 'বইয়ের বিবরণ';
  static String get breadcrumbCatalog => isEnglish ? 'Catalog' : 'ক্যাটালগ';
  static String get breadcrumbBookDetails => isEnglish ? 'Book Details' : 'বইয়ের বিবরণ';
  static String get onlinePreserved => isEnglish ? 'Online Preserved' : 'অনলাইন সংরক্ষিত';

  static String get wileyPublisher => 'WILEY STUDENT EDITION';
  static String get defaultBookTitle => 'Data Structures & Algorithms in Python';
  static String get defaultBookAuthor =>
      'Michael T. Goodrich, Roberto Tamassia, Michael H. Goldwasser';
  static String get defaultBookRatingText =>
      isEnglish ? '4.8 (118 Reviews)' : '৪.৮ (১১৮টি রিভিউ)';
  static String get shelfCopiesAvailable =>
      isEnglish ? 'Available: 7 copies on shelf' : 'উপলব্ধ: ৭টি কপি শেলফে';

  static String get editionLabel => isEnglish ? 'Edition' : 'সংস্করণ';
  static String get editionDefault => isEnglish ? '2nd Edition' : '২য় সংস্করণ';
  static String get pubYearLabel => isEnglish ? 'Publication Year' : 'প্রকাশনা বর্ষ';
  static String get pubYearDefault => isEnglish ? '2023 (748 Pages)' : '২০২৩ (৭৪৮ পৃঃ)';
  static String get isbnLabel => isEnglish ? 'ISBN' : 'আইএসবিএন';
  static String get isbnDefault => '978-11182';

  static String get shelfLocationTitle =>
      isEnglish ? 'Shelf Location' : 'ভৌত অবস্থান (Shelf Location)';
  static String get shelfIndexLabel => isEnglish ? 'Index: 005.133' : 'ইনডেক্স: 005.133';
  static String get shelfLocationDefault => isEnglish
      ? 'Central Library 2nd Floor, Rack: CS-08, Shelf: 3'
      : 'সেন্ট্রাল লাইব্রেরি ২য় তলা, র‍্যাক: CS-08, শেলফ: ৩';

  static String get shortDescTitle => isEnglish ? 'Short Description' : 'সংক্ষিপ্ত বিবরণ';
  static String get readMore => isEnglish ? 'Read More ⌵' : 'আরও পড়ুন ⌵';
  static String get readLess => isEnglish ? 'Show Less ︿' : 'সংক্ষেপ করুন ︿';
  static String get defaultBookFullDesc => isEnglish
      ? 'A comprehensive, definitive textbook on fundamental and advanced algorithms and data structures for Computer Science and Software Engineering. Features object-oriented design in Python, recursion, searching and sorting algorithms, trees, and graphs explained in lucid style, indispensable for university coursework and research projects.'
      : 'কম্পিউটার সায়েন্স ও সফটওয়্যার ইঞ্জিনিয়ারিংয়ের অ্যালগরিদম ও ডেটা স্ট্রাকচারের মৌলিক ও আধুনিক ধারণাসমূহ নিয়ে লিখিত প্রামাণ্য বই। পাইথন ভাষার অবজেক্ট-ওরিয়েন্টেড ডিজাইন, রিকার্শন, সার্চিং ও সর্টিং অ্যালগরিদম, ট্রি ও গ্রাফের মতো জটিল বিষয়াদি প্রাঞ্জল ভাষায় ব্যাখ্যা করা হয়েছে যা বিশ্ববিদ্যালয়ের নিয়মিত কোর্স ও গবেষণা প্রকল্পের জন্য অপরিহার্য।';

  static String get issueRulesTitle =>
      isEnglish ? 'Issue Guidelines & Timeline' : 'ইস্যুর নিয়মাবলী ও সময়সূচি';
  static String get studentPolicyTag => isEnglish ? 'Student Policy' : 'স্টুডেন্ট পলিসি';
  static String get issueDayToday => isEnglish ? 'Issue Date (Today)' : 'ইস্যুর দিন (আজ)';
  static String get maxDuration14Days =>
      isEnglish ? 'Max Duration (14 Days)' : 'সর্বোচ্চ মেয়াদ (১৪ দিন)';
  static String get tentativeReturnDateLabel =>
      isEnglish ? 'Expected Return Date' : 'ফেরত প্রদানের সম্ভাব্য তারিখ';
  static String get tentativeReturnDateDefault =>
      isEnglish ? '24 April, 2025' : '২৪ এপ্রিল, ২০২৫';
  static String get lateFeePolicyLabel =>
      isEnglish ? 'Late Fee Policy (Per Day)' : 'বিলম্ব ফি নীতি (প্রতিদিন)';
  static String get lateFeePolicyDefault => isEnglish ? '৳5.00 / day' : '৳৫.০০ / দিন';

  static String get recipientCertification =>
      isEnglish ? 'Recipient Certification & Approval' : 'গ্রহীতার প্রত্যয়ন ও অনুমোদন';
  static String get submitIssueRequest =>
      isEnglish ? 'Submit Issue Request' : 'ইস্যু রিকোয়েস্ট পাঠান (Submit)';
  static String get bookmarkForLater =>
      isEnglish ? 'Bookmark for Later' : 'পরে পড়ার জন্য বুকমার্ক করুন';

  // Borrowed Books & Fine Page Strings
  static String get springSemesterUser =>
      isEnglish ? 'Spring Semester 2024 • User ID: CS-2104' : 'বসন্ত সেমিস্টার ২০২৪ • ইউজার আইডি: CS-2104';
  static String get activeMemberBadge => isEnglish ? 'Active Member' : 'সক্রিয় সদস্য';

  static String get totalIssuedLabel => isEnglish ? 'Total Issued' : 'মোট ইস্যুকৃত';
  static String get totalIssuedCount => isEnglish ? '3 Books' : '৩টি বই';
  static String get returnPendingLabel => isEnglish ? 'Due for Return' : 'রিটার্ন বাকি';
  static String get returnPendingCount => isEnglish ? '1 Today' : '১টি আজই';
  static String get pendingFineLabel => isEnglish ? 'Pending Fine' : 'বকেয়া ফাইন';
  static String get pendingFineTotal => isEnglish ? '৳45.00' : '৳৪৫.০০';

  static String get tabCurrentBooks => isEnglish ? 'Current Books (3)' : 'বর্তমান বইসমূহ (৩)';
  static String get tabReturnedBooks => isEnglish ? 'Returned Books (18)' : 'ফেরত দেওয়া বই (১৮)';

  static String get borrowedListTitle =>
      isEnglish ? 'Borrowed Books List' : 'ধার নেওয়া বইয়ের তালিকা';
  static String get sessionBadgeText => isEnglish ? 'Session 2024-25' : 'সেশন ২০২৪-২৫';
  static String get lastSyncText =>
      isEnglish ? 'Last Synced: Today 10:15 AM' : 'সর্বশেষ সিঙ্ক: আজ ১০:১৫ AM';

  static String get btnReturnBarcode => isEnglish ? 'Return Barcode' : 'রিটার্ন বারকোড';
  static String get btnRenewRequest => isEnglish ? 'Renew Request' : 'রিনিউ রিকোয়েস্ট';
  static String get btnPayFineAndReturn =>
      isEnglish ? 'Pay Late Fine & Return' : 'বিলম্ব ফি পরিশোধ ও রিটার্ন প্রসেস';

  static String get policyTitle =>
      isEnglish ? 'Smart Library Terms & Policies' : 'স্মার্ট লাইব্রেরি নীতিমালা ও শর্তাবলী';
  static String get policyDescription => isEnglish
      ? 'A late fine of ৳5 per day applies after the due date. While unpaid fines remain, issuing new books at digital turnstiles is temporarily paused.'
      : 'নির্ধারিত সময় পার হলে দৈনিক ৫ টাকা হারে জরিমানা প্রযোজ্য হবে। মোট জরিমানা বকেয়া থাকলে ডিজিটাল গেটে নতুন বই ইস্যু প্রক্রিয়া সাময়িকভাবে স্থগিত থাকবে।';

  static String get totalFinePayLabel =>
      isEnglish ? 'Total Late Fine:' : 'সর্বমোট বিলম্ব জরিমানা:';
  static String get payFineButton => isEnglish ? 'Pay Fine' : 'জরিমানা পরিশোধ করুন';

  // Notification and Activity Page Strings
  static String get newUpdatesCount => isEnglish ? '4 New Updates' : '৪টি নতুন আপডেট';
  static String get markAllRead => isEnglish ? 'Mark all as read' : 'সব পড়া হয়েছে';

  static String get filterAllNotifications =>
      isEnglish ? 'All Notifications' : 'সকল নোটিফিকেশন';
  static String get filterRequestStatus => isEnglish ? 'Request Status' : 'রিকোয়েস্ট স্ট্যাটাস';
  static String get filterReturnAlert => isEnglish ? 'Return Alert' : 'রিটার্ন অ্যালার্ট';
  static String get filterFine => isEnglish ? 'Fine' : 'জরিমানা';

  static String get needHelpTitle => isEnglish ? 'Need Assistance?' : 'সহায়তা প্রয়োজন?';
  static String get helpDeskPhone =>
      isEnglish ? 'Library Helpdesk: 01700-000000' : 'লাইব্রেরি হেল্পডেস্ক: 01700-000000';
  static String get helpDeskHours => isEnglish
      ? 'Hours: 9:00 AM - 5:00 PM (Sun - Thu)'
      : 'সময়: সকাল ৯টা - বিকাল ৫টা (রবি - বৃহস্পতিবার)';

  static String get viewCollectionToken =>
      isEnglish ? 'View Collection Token (#REQ-4912)' : 'সংগ্রহের টোকেন দেখুন (#REQ-4912)';
  static String get renewApplication => isEnglish ? 'Renew Application' : 'রিনিউ আবেদন (Renew)';
  static String get payFineNotification =>
      isEnglish ? 'Pay Fine (৳45.00)' : 'ফি পরিশোধ করুন (Pay ৳45.00)';
  static String get exploreNewCollection =>
      isEnglish ? 'Explore New Collection →' : 'নতুন সংগ্রহ ঘুরে দেখুন →';

  // Student Profile & Digital Pass Strings
  static String get studentProfileTitle => isEnglish ? 'Student Profile' : 'স্টুডেন্ট প্রোফাইল';
  static String get digitalPassServiceSubtitle =>
      isEnglish ? 'Digital Library Pass & Membership Service' : 'ডিজিটাল লাইব্রেরি পাস ও মেম্বারশিপ সার্ভিস';
  static String get smartPassRfidTitle => 'SMART PASS • RFID ID';
  static String get centralLibraryBadge => isEnglish ? 'Central Library' : 'কেন্দ্রীয় গ্রন্থাগার';
  static String get studentNameDefault => isEnglish ? 'Tanvir Ahmed' : 'তানভীর আহমেদ';
  static String get studentDeptDefault => isEnglish
      ? 'Computer Science & Engineering (CSE)'
      : 'কম্পিউটার সায়েন্স অ্যান্ড ইঞ্জিনিয়ারিং (CSE)';
  static String get studentRollSessionDefault =>
      isEnglish ? 'Roll: CSE-2021-042 • Session: 2020-21' : 'রোল: CSE-2021-042 • সেশন: ২০২০-২১';
  static String get studentBarcodeDefault => '8841-0129-4202';
  static String get viewLargeQrBtn => isEnglish ? 'View Large QR' : 'বড় QR দেখুন';
  static String get cardValidityDefault =>
      isEnglish ? 'Card Validity: 31 December, 2025' : 'কার্ডের মেয়াদ: ৩১ ডিসেম্বর, ২০২৫';
  static String get academicClassDefault =>
      isEnglish ? '4th Year, 8th Semester' : '৪র্থ বর্ষ, ৮ম সেমিস্টার';

  static String get institutionalInfoTitle =>
      isEnglish ? 'Institutional Information' : 'প্রাতিষ্ঠানিক তথ্য';
  static String get editAction => isEnglish ? 'Edit' : 'সম্পাদনা';
  static String get institutionalEmailLabel =>
      isEnglish ? 'Institutional Email' : 'প্রাতিষ্ঠানিক ইমেইল';
  static String get institutionalEmailDefault => 'tanvir.cse@univ.edu';
  static String get mobileNumberLabel => isEnglish ? 'Mobile Number' : 'মোবাইল নম্বর';
  static String get mobileNumberDefault =>
      isEnglish ? '+880 1712-345678' : '+৮৮০ ১৭১২-৩৪৫৬৭৮';
  static String get smsAlertActiveTag =>
      isEnglish ? 'SMS Alerts Active' : 'SMS সতর্কবার্তা সক্রিয়';

  static String get libraryActivityTitle =>
      isEnglish ? 'Library Activity & Analytics' : 'লাইব্রেরি কার্যক্রম ও পরিসংখ্যান';
  static String get detailedHistoryLink =>
      isEnglish ? 'Detailed History • Session 3' : 'বিস্তারিত হিস্ট্রি • সেশন ৩';
  static String get currentIssuedCountLabel => isEnglish ? '03 Books' : '০৩ টি';
  static String get currentIssuedSubtitle =>
      isEnglish ? 'Currently Issued Books' : 'বর্তমানে ইস্যুকৃত বই';
  static String get totalBorrowedCountLabel => isEnglish ? '18 Books' : '১৮ টি';
  static String get totalBorrowedSubtitle =>
      isEnglish ? 'Total Borrowed Books' : 'মোট ধার করা বই';
  static String get onTimeReturnRateLabel => isEnglish ? '96%' : '৯৬%';
  static String get onTimeReturnRateSubtitle =>
      isEnglish ? 'On-Time Return Rate' : 'সময়মতো রিটার্ন রেট';
  static String get currentFineLabel => isEnglish ? '৳0.00' : '৳০.০০';
  static String get currentFineSubtitle =>
      isEnglish ? 'Current Late Fine' : 'বর্তমান বকেয়া জরিমানা';

  static String get priorityReadingHeader =>
      isEnglish ? 'Active Reading (Priority 1)' : 'চলতি পড়ার বই (১ম অগ্রাধিকার)';
  static String get remainingDays4 => isEnglish ? 'Remaining: 4 Days' : 'মেয়াদ বাকি: ৪ দিন';
  static String get priorityBookTitle => 'Introduction to Algorithms (4th...)';
  static String get priorityBookAuthorRack => isEnglish
      ? 'Thomas H. Cormen • Rack: CS-304'
      : 'Thomas H. Cormen • র‍্যাক নম্বর: CS-304';
  static String get returnActionBtn => isEnglish ? 'Return' : 'রিটার্ন';

  static String get libraryServicesHeader =>
      isEnglish ? 'Library Services & History' : 'লাইব্রেরি সার্ভিস ও হিস্ট্রি';
  static String get borrowedHistoryTitle =>
      isEnglish ? 'Borrowed Books & History' : 'ধার নেওয়া বই ও হিস্ট্রি';
  static String get borrowedHistorySub => isEnglish
      ? 'Active 3 & previous 15 borrowed books'
      : 'চলতি ৩ ও পূর্বের ১৫টি বইয়ের তালিকা';
  static String get active3Badge => isEnglish ? '3 Active' : '৩টি একটিভ';

  static String get finePaymentHistoryTitle =>
      isEnglish ? 'Fine & Payment History' : 'জরিমানা ও পেমেন্ট হিস্ট্রি';
  static String get finePaymentHistorySub =>
      isEnglish ? 'All clearance vouchers and receipts' : 'সকল ক্লিয়ারেন্স ও ভাউচার রসিদ';
  static String get zeroFineBadge => isEnglish ? '৳0.00 Due' : '৳০.০০ বকেয়া';

  static String get wishlistTitle =>
      isEnglish ? 'Wishlist & Saved Books' : 'পছন্দের বইয়ের তালিকা (Wishlist)';
  static String get wishlistSub =>
      isEnglish ? 'Books saved to read later' : 'পরবর্তীতে পড়ার জন্য সেভ করা বই';
  static String get wishlist5Badge => isEnglish ? '5 Books' : '৫টি বই';

  static String get notifSettingsTitle =>
      isEnglish ? 'Notification & Reminder Preferences' : 'নোটিফিকেশন ও অ্যালার্ট রিমাইন্ডার';
  static String get notifSettingsSub => isEnglish
      ? 'Manage SMS & push notifications for book return'
      : 'বই ফেরতের SMS ও পুশ বার্তা নিয়ন্ত্রণ';

  static String get securitySettingsHeader =>
      isEnglish ? 'Security & App Settings' : 'নিরাপত্তা ও অ্যাপ সেটিংস';
  static String get biometricLoginTitle =>
      isEnglish ? 'Biometric / Touch ID Login' : 'বায়োমেট্রিক / টাচ আইডি লগইন';
  static String get biometricLoginSub =>
      isEnglish ? 'Fast and secure digital pass verification' : 'দ্রুত ও নিরাপদ পাস অনুমোদন';
  static String get changePinTitle =>
      isEnglish ? 'Change PIN or Password' : 'পিন বা পাসওয়ার্ড পরিবর্তন';
  static String get changePinSub => isEnglish
      ? '6-digit security PIN for library kiosks'
      : 'লাইব্রেরি কিওস্কের ৬ সংখ্যার সিকিউরিটি পিন';
  static String get languageSelectionTitle =>
      isEnglish ? 'Language Selection' : 'ভাষা নির্বাচন (Language)';
  static String get languageSelectionSub =>
      isEnglish ? 'Bengali and English edition' : 'বাংলা ও ইংরেজি সংস্করণ';

  static String get helpdeskAndComplaints =>
      isEnglish ? 'Library Helpdesk & Support' : 'লাইব্রেরি হেল্পডেস্ক ও অভিযোগ';
  static String get directChatHotline =>
      isEnglish ? 'Direct chat or call: 16221 (ext-201)' : 'সরাসরি চ্যাট বা যোগাযোগ: ১৬২২১ (ext-২০১)';
  static String get logOutButton => isEnglish ? 'Log Out' : 'লগআউট করুন (Log Out)';
  static String get appVersionBuild => isEnglish
      ? 'Smart Library System • Version 1.0.3 (Build 2408.1)'
      : 'স্মার্ট লাইব্রেরি সিস্টেম • ভার্সন ১.০.৩ (বিল্ড ২৪০৮.১)';
  static String get copyrightCentralLibrary => isEnglish
      ? 'Copyright © Central Library & Information Center'
      : 'কপিরাইট © কেন্দ্রীয় গ্রন্থাগার ও তথ্যকেন্দ্র';
}
