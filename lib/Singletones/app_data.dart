import '../Utils/debouncer.dart';

class AppData {
  //make it singleTone class
  static final AppData _singleton = AppData._internal();
  factory AppData() {
    return _singleton;
  }
  AppData._internal();
  //code starts from here
  // String token = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYW1lZXNAYWN1dGVhbmdsZS5pbyIsInNjb3BlcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9BRE1JTiJSwiaXNzIjoiaHR0cDovL2V6Ym90LmNvbSIsImlhdCI6MTcwMDEwNzgyOSwiZXhwIjoxNzMxNjQzODI5fQ.OodibBwm4CgzOBWqre2s70yHDjrizXaGbELUhRQoN1g';
  String token = '';
  static const String api_access_key = "api_app_access_254R68495324Y1W123";
  static const String eduWorldTheworldHostname =
      "https://eduworld.theworld.com.bd";
  static const String eduWorldErpHostname = "https://eduworld.eduworlderp.com";
  List<String> userPrivileges = [];
  static Debouncer debouncer = Debouncer(milliseconds: 1500);
  static const String dummyUserid = "2315400002 ";
  static const String dummyUserPass = "123456";
  static const Map<String, dynamic> dummyQuizQuestionsModel = {
    "QuestionList": [
      {
        "id": 10061,
        "question_no": 115,
        "site_exam_question_info_id": 9652,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:35:52",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>মুজিবুর রহমানের আত্মজীবনীমূলক গ্রন্থ &ldquo;অসমাপ্ত আত্মজীবনী&rdquo; সর্বশেষ কোন ভাষায় অনূদিত হয়?</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40451,
            "site_exam_question_id": 10061,
            "option": "চীনা",
            "translations": [
              {
                "id": 40451,
                "site_exam_question_detail_id": 40451,
                "option": "চীনা",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40449,
            "site_exam_question_id": 10061,
            "option": "রুশ",
            "translations": [
              {
                "id": 40449,
                "site_exam_question_detail_id": 40449,
                "option": "রুশ",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40450,
            "site_exam_question_id": 10061,
            "option": "ডাচ",
            "translations": [
              {
                "id": 40450,
                "site_exam_question_detail_id": 40450,
                "option": "ডাচ",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40452,
            "site_exam_question_id": 10061,
            "option": "ফ্রেঞ্চ",
            "translations": [
              {
                "id": 40452,
                "site_exam_question_detail_id": 40452,
                "option": "ফ্রেঞ্চ",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10061,
            "site_exam_question_id": 10061,
            "question":
                "<p>মুজিবুর রহমানের আত্মজীবনীমূলক গ্রন্থ &ldquo;অসমাপ্ত আত্মজীবনী&rdquo; সর্বশেষ কোন ভাষায় অনূদিত হয়?</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10066,
        "question_no": 120,
        "site_exam_question_info_id": 9653,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:39:36",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের &ldquo;অসমাপ্ত আত্মজীবনীর&rdquo; কোন সালে প্রথম প্রকাশিত হয়?</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40470,
            "site_exam_question_id": 10066,
            "option": "২০১৩",
            "translations": [
              {
                "id": 40470,
                "site_exam_question_detail_id": 40470,
                "option": "২০১৩",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40469,
            "site_exam_question_id": 10066,
            "option": "২০১৪",
            "translations": [
              {
                "id": 40469,
                "site_exam_question_detail_id": 40469,
                "option": "২০১৪",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40471,
            "site_exam_question_id": 10066,
            "option": "২০১১",
            "translations": [
              {
                "id": 40471,
                "site_exam_question_detail_id": 40471,
                "option": "২০১১",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40472,
            "site_exam_question_id": 10066,
            "option": "২০১২",
            "translations": [
              {
                "id": 40472,
                "site_exam_question_detail_id": 40472,
                "option": "২০১২",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10066,
            "site_exam_question_id": 10066,
            "question":
                "<p>জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের &ldquo;অসমাপ্ত আত্মজীবনীর&rdquo; কোন সালে প্রথম প্রকাশিত হয়?</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10059,
        "question_no": 113,
        "site_exam_question_info_id": 9652,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:35:52",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>মুজিবুর রহমানের আত্মজীবনীমূলক গ্রন্থ &ldquo;অসমাপ্ত আত্মজীবনী&rdquo; সর্বশেষ কোন ভাষায় অনূদিত হয়?</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40444,
            "site_exam_question_id": 10059,
            "option": "The Week UK",
            "translations": [
              {
                "id": 40444,
                "site_exam_question_detail_id": 40444,
                "option": "The Week UK",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40443,
            "site_exam_question_id": 10059,
            "option": "Outlook",
            "translations": [
              {
                "id": 40443,
                "site_exam_question_detail_id": 40443,
                "option": "Outlook",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40442,
            "site_exam_question_id": 10059,
            "option": "The Newsweek",
            "translations": [
              {
                "id": 40442,
                "site_exam_question_detail_id": 40442,
                "option": "The Newsweek",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40441,
            "site_exam_question_id": 10059,
            "option": "Time",
            "translations": [
              {
                "id": 40441,
                "site_exam_question_detail_id": 40441,
                "option": "Time",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10059,
            "site_exam_question_id": 10059,
            "question":
                "<p>মুজিবুর রহমানের আত্মজীবনীমূলক গ্রন্থ &ldquo;অসমাপ্ত আত্মজীবনী&rdquo; সর্বশেষ কোন ভাষায় অনূদিত হয়?</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10048,
        "question_no": 102,
        "site_exam_question_info_id": 9650,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:05:28",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>&nbsp;বঙ্গবন্ধু শেখ মুজিবুর রহমান এর আত্মজীবনীমূলক গ্রন্থের নাম&ndash;</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40400,
            "site_exam_question_id": 10048,
            "option": "১৪ আগস্ট ১৯৪৭ খৃঃ",
            "translations": [
              {
                "id": 40400,
                "site_exam_question_detail_id": 40400,
                "option": "১৪ আগস্ট ১৯৪৭ খৃঃ",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40401,
            "site_exam_question_id": 10048,
            "option": "২১ জুন ১৯৪১ খৃঃ",
            "translations": [
              {
                "id": 40401,
                "site_exam_question_detail_id": 40401,
                "option": "২১ জুন ১৯৪১ খৃঃ",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40398,
            "site_exam_question_id": 10048,
            "option": "১ মার্চ ১৯১৯ খৃঃ",
            "translations": [
              {
                "id": 40398,
                "site_exam_question_detail_id": 40398,
                "option": "১ মার্চ ১৯১৯ খৃঃ",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40399,
            "site_exam_question_id": 10048,
            "option": "১৭ মার্চ ১৯২০ খৃঃ",
            "translations": [
              {
                "id": 40399,
                "site_exam_question_detail_id": 40399,
                "option": "১৭ মার্চ ১৯২০ খৃঃ",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10048,
            "site_exam_question_id": 10048,
            "question":
                "<p>&nbsp;বঙ্গবন্ধু শেখ মুজিবুর রহমান এর আত্মজীবনীমূলক গ্রন্থের নাম&ndash;</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10065,
        "question_no": 119,
        "site_exam_question_info_id": 9653,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:39:36",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের &ldquo;অসমাপ্ত আত্মজীবনীর&rdquo; কোন সালে প্রথম প্রকাশিত হয়?</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40468,
            "site_exam_question_id": 10065,
            "option": "সৈয়দ শামসুল হক",
            "translations": [
              {
                "id": 40468,
                "site_exam_question_detail_id": 40468,
                "option": "সৈয়দ শামসুল হক",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40466,
            "site_exam_question_id": 10065,
            "option": "কবি কাজী নজরুল ইসলাম",
            "translations": [
              {
                "id": 40466,
                "site_exam_question_detail_id": 40466,
                "option": "কবি কাজী নজরুল ইসলাম",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40467,
            "site_exam_question_id": 10065,
            "option": "রবীন্দ্রনাথ ঠাকুর",
            "translations": [
              {
                "id": 40467,
                "site_exam_question_detail_id": 40467,
                "option": "রবীন্দ্রনাথ ঠাকুর",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40465,
            "site_exam_question_id": 10065,
            "option": "জাতির জনক বঙ্গবন্ধু শেখ মুজিবুর রহমান",
            "translations": [
              {
                "id": 40465,
                "site_exam_question_detail_id": 40465,
                "option": "জাতির জনক বঙ্গবন্ধু শেখ মুজিবুর রহমান",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10065,
            "site_exam_question_id": 10065,
            "question":
                "<p>জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের &ldquo;অসমাপ্ত আত্মজীবনীর&rdquo; কোন সালে প্রথম প্রকাশিত হয়?</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10063,
        "question_no": 117,
        "site_exam_question_info_id": 9653,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:39:36",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের &ldquo;অসমাপ্ত আত্মজীবনীর&rdquo; কোন সালে প্রথম প্রকাশিত হয়?</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40459,
            "site_exam_question_id": 10063,
            "option": "১৯৬৬ সাল",
            "translations": [
              {
                "id": 40459,
                "site_exam_question_detail_id": 40459,
                "option": "১৯৬৬ সাল",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40460,
            "site_exam_question_id": 10063,
            "option": "১৯৬৯ সাল",
            "translations": [
              {
                "id": 40460,
                "site_exam_question_detail_id": 40460,
                "option": "১৯৬৯ সাল",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40458,
            "site_exam_question_id": 10063,
            "option": "১৯৫২ সাল",
            "translations": [
              {
                "id": 40458,
                "site_exam_question_detail_id": 40458,
                "option": "১৯৫২ সাল",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40457,
            "site_exam_question_id": 10063,
            "option": "১৯৫৫ সাল",
            "translations": [
              {
                "id": 40457,
                "site_exam_question_detail_id": 40457,
                "option": "১৯৫৫ সাল",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10063,
            "site_exam_question_id": 10063,
            "question":
                "<p>জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের &ldquo;অসমাপ্ত আত্মজীবনীর&rdquo; কোন সালে প্রথম প্রকাশিত হয়?</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10053,
        "question_no": 107,
        "site_exam_question_info_id": 9651,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:14:15",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>বঙ্গবন্ধু শেখ মুজিবুর রহমান ১৯৬৬ সালের কোন মাসে ঐতিহাসিক ৬ দফা ঘোষণা করেন &ndash;</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40419,
            "site_exam_question_id": 10053,
            "option": "পল্টন ময়দান",
            "translations": [
              {
                "id": 40419,
                "site_exam_question_detail_id": 40419,
                "option": "পল্টন ময়দান",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40418,
            "site_exam_question_id": 10053,
            "option": "রেসকোর্স ময়দান",
            "translations": [
              {
                "id": 40418,
                "site_exam_question_detail_id": 40418,
                "option": "রেসকোর্স ময়দান",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40420,
            "site_exam_question_id": 10053,
            "option": "কোনটিই নয়",
            "translations": [
              {
                "id": 40420,
                "site_exam_question_detail_id": 40420,
                "option": "কোনটিই নয়",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10053,
            "site_exam_question_id": 10053,
            "question":
                "<p>বঙ্গবন্ধু শেখ মুজিবুর রহমান ১৯৬৬ সালের কোন মাসে ঐতিহাসিক ৬ দফা ঘোষণা করেন &ndash;</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10052,
        "question_no": 106,
        "site_exam_question_info_id": 9651,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:14:15",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>বঙ্গবন্ধু শেখ মুজিবুর রহমান ১৯৬৬ সালের কোন মাসে ঐতিহাসিক ৬ দফা ঘোষণা করেন &ndash;</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40416,
            "site_exam_question_id": 10052,
            "option": "৭ মার্চ, ১৯৭১",
            "translations": [
              {
                "id": 40416,
                "site_exam_question_detail_id": 40416,
                "option": "৭ মার্চ, ১৯৭১",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40417,
            "site_exam_question_id": 10052,
            "option": "২ ফেব্রুয়ারি, ১৯৬৯",
            "translations": [
              {
                "id": 40417,
                "site_exam_question_detail_id": 40417,
                "option": "২ ফেব্রুয়ারি, ১৯৬৯",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40414,
            "site_exam_question_id": 10052,
            "option": "২৩ ফেব্রুয়ারি, ১৯৬৯",
            "translations": [
              {
                "id": 40414,
                "site_exam_question_detail_id": 40414,
                "option": "২৩ ফেব্রুয়ারি, ১৯৬৯",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40415,
            "site_exam_question_id": 10052,
            "option": "২৫ জানুয়ারি, ১৯৭০",
            "translations": [
              {
                "id": 40415,
                "site_exam_question_detail_id": 40415,
                "option": "২৫ জানুয়ারি, ১৯৭০",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10052,
            "site_exam_question_id": 10052,
            "question":
                "<p>বঙ্গবন্ধু শেখ মুজিবুর রহমান ১৯৬৬ সালের কোন মাসে ঐতিহাসিক ৬ দফা ঘোষণা করেন &ndash;</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10064,
        "question_no": 118,
        "site_exam_question_info_id": 9653,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:39:36",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের &ldquo;অসমাপ্ত আত্মজীবনীর&rdquo; কোন সালে প্রথম প্রকাশিত হয়?</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40463,
            "site_exam_question_id": 10064,
            "option": "অসমাপ্ত আত্মজীবনী",
            "translations": [
              {
                "id": 40463,
                "site_exam_question_detail_id": 40463,
                "option": "অসমাপ্ত আত্মজীবনী",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40462,
            "site_exam_question_id": 10064,
            "option": "অবরুদ্ধ নয় মাস",
            "translations": [
              {
                "id": 40462,
                "site_exam_question_detail_id": 40462,
                "option": "অবরুদ্ধ নয় মাস",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40464,
            "site_exam_question_id": 10064,
            "option": "বাংলাদেশ কথা কয়",
            "translations": [
              {
                "id": 40464,
                "site_exam_question_detail_id": 40464,
                "option": "বাংলাদেশ কথা কয়",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40461,
            "site_exam_question_id": 10064,
            "option": "সত্য মামলা আগরতলা",
            "translations": [
              {
                "id": 40461,
                "site_exam_question_detail_id": 40461,
                "option": "সত্য মামলা আগরতলা",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10064,
            "site_exam_question_id": 10064,
            "question":
                "<p>জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের &ldquo;অসমাপ্ত আত্মজীবনীর&rdquo; কোন সালে প্রথম প্রকাশিত হয়?</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10060,
        "question_no": 114,
        "site_exam_question_info_id": 9652,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:35:52",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>মুজিবুর রহমানের আত্মজীবনীমূলক গ্রন্থ &ldquo;অসমাপ্ত আত্মজীবনী&rdquo; সর্বশেষ কোন ভাষায় অনূদিত হয়?</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40445,
            "site_exam_question_id": 10060,
            "option": "১৯৫৫ সাল",
            "translations": [
              {
                "id": 40445,
                "site_exam_question_detail_id": 40445,
                "option": "১৯৫৫ সাল",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40446,
            "site_exam_question_id": 10060,
            "option": "১৯৫২ সাল",
            "translations": [
              {
                "id": 40446,
                "site_exam_question_detail_id": 40446,
                "option": "১৯৫২ সাল",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40448,
            "site_exam_question_id": 10060,
            "option": "১৯৬৯ সাল",
            "translations": [
              {
                "id": 40448,
                "site_exam_question_detail_id": 40448,
                "option": "১৯৬৯ সাল",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40447,
            "site_exam_question_id": 10060,
            "option": "১৯৬৬ সাল",
            "translations": [
              {
                "id": 40447,
                "site_exam_question_detail_id": 40447,
                "option": "১৯৬৬ সাল",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10060,
            "site_exam_question_id": 10060,
            "question":
                "<p>মুজিবুর রহমানের আত্মজীবনীমূলক গ্রন্থ &ldquo;অসমাপ্ত আত্মজীবনী&rdquo; সর্বশেষ কোন ভাষায় অনূদিত হয়?</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10057,
        "question_no": 111,
        "site_exam_question_info_id": 9652,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:35:52",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>মুজিবুর রহমানের আত্মজীবনীমূলক গ্রন্থ &ldquo;অসমাপ্ত আত্মজীবনী&rdquo; সর্বশেষ কোন ভাষায় অনূদিত হয়?</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40433,
            "site_exam_question_id": 10057,
            "option": "হোসেন শহীদ সোহরাওয়ার্দী",
            "translations": [
              {
                "id": 40433,
                "site_exam_question_detail_id": 40433,
                "option": "হোসেন শহীদ সোহরাওয়ার্দী",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40434,
            "site_exam_question_id": 10057,
            "option": "শেরে বাংলা এ.কে ফজলুল হকের জন্মদিন",
            "translations": [
              {
                "id": 40434,
                "site_exam_question_detail_id": 40434,
                "option": "শেরে বাংলা এ.কে ফজলুল হকের জন্মদিন",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40435,
            "site_exam_question_id": 10057,
            "option": "বঙ্গবন্ধু শেখ মুজিবুর রহমানের জন্মদিন ও জাতীয় শিশু দিবস",
            "translations": [
              {
                "id": 40435,
                "site_exam_question_detail_id": 40435,
                "option":
                    "বঙ্গবন্ধু শেখ মুজিবুর রহমানের জন্মদিন ও জাতীয় শিশু দিবস",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40436,
            "site_exam_question_id": 10057,
            "option": "মাওলানা আবদুল হামিদ খান ভাসানীর মৃত্যু দিবস",
            "translations": [
              {
                "id": 40436,
                "site_exam_question_detail_id": 40436,
                "option": "মাওলানা আবদুল হামিদ খান ভাসানীর মৃত্যু দিবস",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10057,
            "site_exam_question_id": 10057,
            "question":
                "<p>মুজিবুর রহমানের আত্মজীবনীমূলক গ্রন্থ &ldquo;অসমাপ্ত আত্মজীবনী&rdquo; সর্বশেষ কোন ভাষায় অনূদিত হয়?</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10050,
        "question_no": 104,
        "site_exam_question_info_id": 9650,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:05:28",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>&nbsp;বঙ্গবন্ধু শেখ মুজিবুর রহমান এর আত্মজীবনীমূলক গ্রন্থের নাম&ndash;</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40406,
            "site_exam_question_id": 10050,
            "option": "শিশু দিবস",
            "translations": [
              {
                "id": 40406,
                "site_exam_question_detail_id": 40406,
                "option": "শিশু দিবস",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40408,
            "site_exam_question_id": 10050,
            "option": "শিক্ষা দিবস",
            "translations": [
              {
                "id": 40408,
                "site_exam_question_detail_id": 40408,
                "option": "শিক্ষা দিবস",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40407,
            "site_exam_question_id": 10050,
            "option": "নারী দিবস",
            "translations": [
              {
                "id": 40407,
                "site_exam_question_detail_id": 40407,
                "option": "নারী দিবস",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40409,
            "site_exam_question_id": 10050,
            "option": "স্বাস্থ্য দিবস",
            "translations": [
              {
                "id": 40409,
                "site_exam_question_detail_id": 40409,
                "option": "স্বাস্থ্য দিবস",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10050,
            "site_exam_question_id": 10050,
            "question":
                "<p>&nbsp;বঙ্গবন্ধু শেখ মুজিবুর রহমান এর আত্মজীবনীমূলক গ্রন্থের নাম&ndash;</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10054,
        "question_no": 108,
        "site_exam_question_info_id": 9651,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:14:15",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>বঙ্গবন্ধু শেখ মুজিবুর রহমান ১৯৬৬ সালের কোন মাসে ঐতিহাসিক ৬ দফা ঘোষণা করেন &ndash;</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40421,
            "site_exam_question_id": 10054,
            "option": "ঢাকা",
            "translations": [
              {
                "id": 40421,
                "site_exam_question_detail_id": 40421,
                "option": "ঢাকা",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40422,
            "site_exam_question_id": 10054,
            "option": "দিল্লীতে",
            "translations": [
              {
                "id": 40422,
                "site_exam_question_detail_id": 40422,
                "option": "দিল্লীতে",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40423,
            "site_exam_question_id": 10054,
            "option": "লাহোর",
            "translations": [
              {
                "id": 40423,
                "site_exam_question_detail_id": 40423,
                "option": "লাহোর",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40424,
            "site_exam_question_id": 10054,
            "option": "করাচি",
            "translations": [
              {
                "id": 40424,
                "site_exam_question_detail_id": 40424,
                "option": "করাচি",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10054,
            "site_exam_question_id": 10054,
            "question":
                "<p>বঙ্গবন্ধু শেখ মুজিবুর রহমান ১৯৬৬ সালের কোন মাসে ঐতিহাসিক ৬ দফা ঘোষণা করেন &ndash;</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10056,
        "question_no": 110,
        "site_exam_question_info_id": 9651,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:14:15",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>বঙ্গবন্ধু শেখ মুজিবুর রহমান ১৯৬৬ সালের কোন মাসে ঐতিহাসিক ৬ দফা ঘোষণা করেন &ndash;</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40429,
            "site_exam_question_id": 10056,
            "option": "জানুয়ারি মাসে",
            "translations": [
              {
                "id": 40429,
                "site_exam_question_detail_id": 40429,
                "option": "জানুয়ারি মাসে",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40431,
            "site_exam_question_id": 10056,
            "option": "জুলাই মাসে",
            "translations": [
              {
                "id": 40431,
                "site_exam_question_detail_id": 40431,
                "option": "জুলাই মাসে",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40432,
            "site_exam_question_id": 10056,
            "option": "আগস্ট মাসে",
            "translations": [
              {
                "id": 40432,
                "site_exam_question_detail_id": 40432,
                "option": "আগস্ট মাসে",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40430,
            "site_exam_question_id": 10056,
            "option": "ফেব্রুয়ারি মাসে",
            "translations": [
              {
                "id": 40430,
                "site_exam_question_detail_id": 40430,
                "option": "ফেব্রুয়ারি মাসে",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10056,
            "site_exam_question_id": 10056,
            "question":
                "<p>বঙ্গবন্ধু শেখ মুজিবুর রহমান ১৯৬৬ সালের কোন মাসে ঐতিহাসিক ৬ দফা ঘোষণা করেন &ndash;</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10049,
        "question_no": 103,
        "site_exam_question_info_id": 9650,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:05:28",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>&nbsp;বঙ্গবন্ধু শেখ মুজিবুর রহমান এর আত্মজীবনীমূলক গ্রন্থের নাম&ndash;</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40403,
            "site_exam_question_id": 10049,
            "option": "১৪ বছর",
            "translations": [
              {
                "id": 40403,
                "site_exam_question_detail_id": 40403,
                "option": "১৪ বছর",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40404,
            "site_exam_question_id": 10049,
            "option": "১০ বছর",
            "translations": [
              {
                "id": 40404,
                "site_exam_question_detail_id": 40404,
                "option": "১০ বছর",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40405,
            "site_exam_question_id": 10049,
            "option": "৮ বছর",
            "translations": [
              {
                "id": 40405,
                "site_exam_question_detail_id": 40405,
                "option": "৮ বছর",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40402,
            "site_exam_question_id": 10049,
            "option": "১২ বছর",
            "translations": [
              {
                "id": 40402,
                "site_exam_question_detail_id": 40402,
                "option": "১২ বছর",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10049,
            "site_exam_question_id": 10049,
            "question":
                "<p>&nbsp;বঙ্গবন্ধু শেখ মুজিবুর রহমান এর আত্মজীবনীমূলক গ্রন্থের নাম&ndash;</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10062,
        "question_no": 116,
        "site_exam_question_info_id": 9653,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:39:36",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের &ldquo;অসমাপ্ত আত্মজীবনীর&rdquo; কোন সালে প্রথম প্রকাশিত হয়?</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40453,
            "site_exam_question_id": 10062,
            "option": "শঙ্খ ঘোষ",
            "translations": [
              {
                "id": 40453,
                "site_exam_question_detail_id": 40453,
                "option": "শঙ্খ ঘোষ",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40456,
            "site_exam_question_id": 10062,
            "option": "মমতাজউদ্দিন আহমেদ",
            "translations": [
              {
                "id": 40456,
                "site_exam_question_detail_id": 40456,
                "option": "মমতাজউদ্দিন আহমেদ",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40454,
            "site_exam_question_id": 10062,
            "option": "শেখ মুজিবুর রহমান",
            "translations": [
              {
                "id": 40454,
                "site_exam_question_detail_id": 40454,
                "option": "শেখ মুজিবুর রহমান",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40455,
            "site_exam_question_id": 10062,
            "option": "শওকত আলী",
            "translations": [
              {
                "id": 40455,
                "site_exam_question_detail_id": 40455,
                "option": "শওকত আলী",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10062,
            "site_exam_question_id": 10062,
            "question":
                "<p>জাতির পিতা বঙ্গবন্ধু শেখ মুজিবুর রহমানের &ldquo;অসমাপ্ত আত্মজীবনীর&rdquo; কোন সালে প্রথম প্রকাশিত হয়?</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10058,
        "question_no": 112,
        "site_exam_question_info_id": 9652,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:35:52",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>মুজিবুর রহমানের আত্মজীবনীমূলক গ্রন্থ &ldquo;অসমাপ্ত আত্মজীবনী&rdquo; সর্বশেষ কোন ভাষায় অনূদিত হয়?</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40438,
            "site_exam_question_id": 10058,
            "option": "মুহম্মদ উল্লাহ",
            "translations": [
              {
                "id": 40438,
                "site_exam_question_detail_id": 40438,
                "option": "মুহম্মদ উল্লাহ",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40437,
            "site_exam_question_id": 10058,
            "option": "সৈয়দ নজরুল ইসলাম",
            "translations": [
              {
                "id": 40437,
                "site_exam_question_detail_id": 40437,
                "option": "সৈয়দ নজরুল ইসলাম",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40439,
            "site_exam_question_id": 10058,
            "option": "আবু সাঈদ চৌধুরী",
            "translations": [
              {
                "id": 40439,
                "site_exam_question_detail_id": 40439,
                "option": "আবু সাঈদ চৌধুরী",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40440,
            "site_exam_question_id": 10058,
            "option": "শেখ মুজিবুর রহমান",
            "translations": [
              {
                "id": 40440,
                "site_exam_question_detail_id": 40440,
                "option": "শেখ মুজিবুর রহমান",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10058,
            "site_exam_question_id": 10058,
            "question":
                "<p>মুজিবুর রহমানের আত্মজীবনীমূলক গ্রন্থ &ldquo;অসমাপ্ত আত্মজীবনী&rdquo; সর্বশেষ কোন ভাষায় অনূদিত হয়?</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10051,
        "question_no": 105,
        "site_exam_question_info_id": 9650,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:05:28",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>&nbsp;বঙ্গবন্ধু শেখ মুজিবুর রহমান এর আত্মজীবনীমূলক গ্রন্থের নাম&ndash;</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40413,
            "site_exam_question_id": 10051,
            "option": "আমার অত্মজীবনী",
            "translations": [
              {
                "id": 40413,
                "site_exam_question_detail_id": 40413,
                "option": "আমার অত্মজীবনী",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40411,
            "site_exam_question_id": 10051,
            "option": "বাংলাদেশ ও আমি",
            "translations": [
              {
                "id": 40411,
                "site_exam_question_detail_id": 40411,
                "option": "বাংলাদেশ ও আমি",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40412,
            "site_exam_question_id": 10051,
            "option": "আমার জীবনী",
            "translations": [
              {
                "id": 40412,
                "site_exam_question_detail_id": 40412,
                "option": "আমার জীবনী",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40410,
            "site_exam_question_id": 10051,
            "option": "অসমাপ্ত আত্মজীবনী",
            "translations": [
              {
                "id": 40410,
                "site_exam_question_detail_id": 40410,
                "option": "অসমাপ্ত আত্মজীবনী",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10051,
            "site_exam_question_id": 10051,
            "question":
                "<p>&nbsp;বঙ্গবন্ধু শেখ মুজিবুর রহমান এর আত্মজীবনীমূলক গ্রন্থের নাম&ndash;</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10055,
        "question_no": 109,
        "site_exam_question_info_id": 9651,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:14:15",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 1,
        "student_answer_ids": [],
        "question":
            "<p>বঙ্গবন্ধু শেখ মুজিবুর রহমান ১৯৬৬ সালের কোন মাসে ঐতিহাসিক ৬ দফা ঘোষণা করেন &ndash;</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40425,
            "site_exam_question_id": 10055,
            "option": "১৯৬৬ সালে",
            "translations": [
              {
                "id": 40425,
                "site_exam_question_detail_id": 40425,
                "option": "১৯৬৬ সালে",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40426,
            "site_exam_question_id": 10055,
            "option": "১৯৫২ সালে",
            "translations": [
              {
                "id": 40426,
                "site_exam_question_detail_id": 40426,
                "option": "১৯৫২ সালে",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40427,
            "site_exam_question_id": 10055,
            "option": "১৯৫৫ সালে",
            "translations": [
              {
                "id": 40427,
                "site_exam_question_detail_id": 40427,
                "option": "১৯৫৫ সালে",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40428,
            "site_exam_question_id": 10055,
            "option": "১৯৬৭ সালে",
            "translations": [
              {
                "id": 40428,
                "site_exam_question_detail_id": 40428,
                "option": "১৯৬৭ সালে",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10055,
            "site_exam_question_id": 10055,
            "question":
                "<p>বঙ্গবন্ধু শেখ মুজিবুর রহমান ১৯৬৬ সালের কোন মাসে ঐতিহাসিক ৬ দফা ঘোষণা করেন &ndash;</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10047,
        "question_no": 101,
        "site_exam_question_info_id": 9650,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": null,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-19 21:05:28",
        "updated_at": "2024-01-03 20:34:26",
        "answer_count": 2,
        "student_answer_ids": [],
        "question":
            "<p>&nbsp;বঙ্গবন্ধু শেখ মুজিবুর রহমান এর আত্মজীবনীমূলক গ্রন্থের নাম&ndash;</p>",
        "site_quiz_question_details_for_student": [
          {
            "id": 40397,
            "site_exam_question_id": 10047,
            "option": "১০ জানুয়ারি ১৯৭২",
            "translations": [
              {
                "id": 40397,
                "site_exam_question_detail_id": 40397,
                "option": "১০ জানুয়ারি ১৯৭২",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40396,
            "site_exam_question_id": 10047,
            "option": "৮ জানুয়ারি ১৯৭২",
            "translations": [
              {
                "id": 40396,
                "site_exam_question_detail_id": 40396,
                "option": "৮ জানুয়ারি ১৯৭২",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40394,
            "site_exam_question_id": 10047,
            "option": "৯ জানুয়ারী ১৯৭২",
            "translations": [
              {
                "id": 40394,
                "site_exam_question_detail_id": 40394,
                "option": "৯ জানুয়ারী ১৯৭২",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40395,
            "site_exam_question_id": 10047,
            "option": "১৬ ডিসেম্বর ১৯৭২",
            "translations": [
              {
                "id": 40395,
                "site_exam_question_detail_id": 40395,
                "option": "১৬ ডিসেম্বর ১৯৭২",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          }
        ],
        "translations": [
          {
            "id": 10047,
            "site_exam_question_id": 10047,
            "question":
                "<p>&nbsp;বঙ্গবন্ধু শেখ মুজিবুর রহমান এর আত্মজীবনীমূলক গ্রন্থের নাম&ndash;</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      }
    ],
    "QuizDetails": {
      "student_quiz_declare_id": 41,
      "quiz_declare_id": 11,
      "student_history_id": 39851,
      "quiz_name": "Test Quiz 6",
      "start_date": "2024-01-21",
      "start_time": "13:00:00",
      "end_time": "15:00:00",
      "duration": 120,
      "question_per_student": 20,
      "is_start": 1,
      "is_end": 0
    },
    "time_left": 12342,
    "quiz_declare_id": 2,
    "backup_second": 60
  };

  //APPDATA GLOBAL DATA
/*     RxList<ChargeStationModel> chargeStationModelList = RxList();
  RxList<ChargePointModel> chargePointModelList = RxList(); */
}

AppData appData = AppData();

class PageOrientation {
  // make this class singleton
  PageOrientation._internal();
  static final PageOrientation _singleton = PageOrientation._internal();
  factory PageOrientation() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static const String portrait = "portrate";
  static const String landscape = "landscape";
}
