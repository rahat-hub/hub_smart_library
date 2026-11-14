import 'package:flutter/material.dart';

enum BookCoverStyle {
  dataIntensive,
  deepLearning,
  microservices,
  algorithms,
  cleanCode,
  artificialIntelligence,
  databaseSystems,
  pythonDataStructures,
  networkingKurose,
  operatingSystemsDino,
  discreteMathRosen,
}

class BookModel {
  final String id;
  final String title;
  final String author;
  final double rating;
  final int reviewCount;
  final int availableCopies;
  final String rack;
  final bool isAvailable;
  final bool isIssuedWaitlist;
  final String category;
  final BookCoverStyle coverStyle;
  final Color primaryColor;
  bool isBookmarked;

  // Additional Book Details fields
  final String publisher;
  final String edition;
  final String publicationYear;
  final String isbn;
  final String shelfLocation;
  final String indexNumber;
  final String description;
  final String? badgeText;
  final String tentativeReturnDate;
  final String lateFeePolicy;
  final bool isOnlineReserved;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    this.rating = 4.8,
    this.reviewCount = 50,
    required this.availableCopies,
    required this.rack,
    this.isAvailable = true,
    this.isIssuedWaitlist = false,
    required this.category,
    required this.coverStyle,
    this.primaryColor = const Color(0xFF13326B),
    this.isBookmarked = false,
    this.publisher = 'WILEY STUDENT EDITION',
    this.edition = '2nd Edition',
    this.publicationYear = '২০২৩ (৭৪৮ পৃঃ)',
    this.isbn = '978-11182',
    this.shelfLocation = 'সেন্ট্রাল লাইব্রেরি ২য় তলা, র‍্যাক: CS-08, শেলফ: ৩',
    this.indexNumber = '005.133',
    this.description =
        'কম্পিউটার সায়েন্স ও সফটওয়্যার ইঞ্জিনিয়ারিংয়ের অ্যালগরিদম ও ডেটা স্ট্রাকচারের মৌলিক ও আধুনিক ধারণাসমূহ নিয়ে লিখিত প্রামাণ্য বই। পাইথন ভাষার অবজেক্ট-ওরিয়েন্টেড ডিজাইন, রিকার্শন, সার্চিং ও সর্টিং অ্যালগরিদম, ট্রি ও গ্রাফের মতো জটিল বিষয়াদি প্রাঞ্জল ভাষায় ব্যাখ্যা করা হয়েছে যা বিশ্ববিদ্যালয়ের নিয়মিত কোর্স ও গবেষণা প্রকল্পের জন্য অপরিহার্য।',
    this.badgeText,
    this.tentativeReturnDate = '২৪ এপ্রিল, ২০২৫',
    this.lateFeePolicy = '৳৫.০০ / দিন',
    this.isOnlineReserved = true,
  });

  String get ratingTextBengali {
    final ratingStr = rating.toStringAsFixed(1);
    final countStr = reviewCount.toString();
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
    final r = ratingStr.split('').map((e) => map[e] ?? e).join('');
    final c = countStr.split('').map((e) => map[e] ?? e).join('');
    return '★ $r ($c রিভিউ)';
  }

  String get copiesTextBengali {
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
    };
    final c = availableCopies.toString().split('').map((e) => map[e] ?? e).join('');
    return 'Available ($c কপি)';
  }

  String get shelfCopiesTextBengali {
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
    };
    final c = availableCopies.toString().split('').map((e) => map[e] ?? e).join('');
    return 'উপলব্ধ: $cটি কপি শেলফে';
  }

  static BookModel defaultPythonDetailsBook() {
    return BookModel(
      id: 'dsa_python_1',
      title: 'Data Structures & Algorithms in Python',
      author: 'Michael T. Goodrich, Roberto Tamassia, Michael H. Goldwasser',
      rating: 4.8,
      reviewCount: 118,
      availableCopies: 7,
      rack: 'CS-08',
      category: 'Computer Science',
      coverStyle: BookCoverStyle.pythonDataStructures,
      primaryColor: const Color(0xFF132F5C),
      badgeText: 'CS Core',
      publisher: 'WILEY STUDENT EDITION',
      edition: '2nd Edition',
      publicationYear: '২০২৩ (৭৪৮ পৃঃ)',
      isbn: '978-11182',
      shelfLocation: 'সেন্ট্রাল লাইব্রেরি ২য় তলা, র‍্যাক: CS-08, শেলফ: ৩',
      indexNumber: '005.133',
      description:
          'কম্পিউটার সায়েন্স ও সফটওয়্যার ইঞ্জিনিয়ারিংয়ের অ্যালগরিদম ও ডেটা স্ট্রাকচারের মৌলিক ও আধুনিক ধারণাসমূহ নিয়ে লিখিত প্রামাণ্য বই। পাইথন ভাষার অবজেক্ট-ওরিয়েন্টেড ডিজাইন, রিকার্শন, সার্চিং ও সর্টিং অ্যালগরিদম, ট্রি ও গ্রাফের মতো জটিল বিষয়াদি প্রাঞ্জল ভাষায় ব্যাখ্যা করা হয়েছে যা বিশ্ববিদ্যালয়ের নিয়মিত কোর্স ও গবেষণা প্রকল্পের জন্য অপরিহার্য।',
      tentativeReturnDate: '২৪ এপ্রিল, ২০২৫',
      lateFeePolicy: '৳৫.০০ / দিন',
      isOnlineReserved: true,
      isAvailable: true,
    );
  }
}
