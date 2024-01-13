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
  static const String dummyUserid = "2315400002";
  static const String dummyUserPass = "123456";
  static const Map<String, dynamic> dummyQuizQuestionsModel = {
    "QuestionList": [
      {
        "id": 10046,
        "question_no": 101,
        "site_exam_question_info_id": 9649,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": 6,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-18 19:43:30",
        "updated_at": "2023-12-18 19:46:34",
        "answer_count": 1,
        "question": "<p>question 1</p>",
        "student_answer_ids": [],
        "site_quiz_question_details_for_student": [
          {
            "id": 40391,
            "site_exam_question_id": 10046,
            "option": "option2",
            "translations": [
              {
                "id": 40391,
                "site_exam_question_detail_id": 40391,
                "option": "option2",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40393,
            "site_exam_question_id": 10046,
            "option": "option4",
            "translations": [
              {
                "id": 40393,
                "site_exam_question_detail_id": 40393,
                "option": "option4",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40392,
            "site_exam_question_id": 10046,
            "option": "option3",
            "translations": [
              {
                "id": 40392,
                "site_exam_question_detail_id": 40392,
                "option": "option3",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40390,
            "site_exam_question_id": 10046,
            "option": "option1",
            "translations": [
              {
                "id": 40390,
                "site_exam_question_detail_id": 40390,
                "option": "option1",
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
            "id": 10046,
            "site_exam_question_id": 10046,
            "question": "<p>question 1</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10048,
        "question_no": 103,
        "site_exam_question_info_id": 9650,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": 6,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-18 19:46:18",
        "updated_at": "2023-12-18 19:46:34",
        "answer_count": 2,
        "question": "<p>question 2</p>",
        "student_answer_ids": [40398, 40399],
        "site_quiz_question_details_for_student": [
          {
            "id": 40398,
            "site_exam_question_id": 10048,
            "option": "option1",
            "translations": [
              {
                "id": 40398,
                "site_exam_question_detail_id": 40398,
                "option": "option1",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40400,
            "site_exam_question_id": 10048,
            "option": "option3",
            "translations": [
              {
                "id": 40400,
                "site_exam_question_detail_id": 40400,
                "option": "option3",
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
            "option": "option2",
            "translations": [
              {
                "id": 40399,
                "site_exam_question_detail_id": 40399,
                "option": "option2",
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
            "option": "option4",
            "translations": [
              {
                "id": 40401,
                "site_exam_question_detail_id": 40401,
                "option": "option4",
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
            "question": "<p>question 2</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      },
      {
        "id": 10047,
        "question_no": 102,
        "site_exam_question_info_id": 9650,
        "mark": 1,
        "question_level": "easy",
        "site_id": 154,
        "site_group_id": 0,
        "module_key": "quiz",
        "academic_group_id": 6,
        "status": 1,
        "question_status": "approved",
        "created_at": "2023-12-18 19:46:18",
        "updated_at": "2023-12-18 19:46:34",
        "answer_count": 1,
        "question": "<p>question 2</p>",
        "student_answer_ids": [],
        "site_quiz_question_details_for_student": [
          {
            "id": 40395,
            "site_exam_question_id": 10047,
            "option": "option2",
            "translations": [
              {
                "id": 40395,
                "site_exam_question_detail_id": 40395,
                "option": "option2",
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
            "option": "option3",
            "translations": [
              {
                "id": 40396,
                "site_exam_question_detail_id": 40396,
                "option": "option3",
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
            "option": "option1",
            "translations": [
              {
                "id": 40394,
                "site_exam_question_detail_id": 40394,
                "option": "option1",
                "locale": "en",
                "status": 1,
                "created_at": null,
                "updated_at": null
              }
            ]
          },
          {
            "id": 40397,
            "site_exam_question_id": 10047,
            "option": "option4",
            "translations": [
              {
                "id": 40397,
                "site_exam_question_detail_id": 40397,
                "option": "option4",
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
            "question": "<p>question 2</p>",
            "locale": "en",
            "created_at": null,
            "updated_at": null
          }
        ]
      }
    ],
    "QuizDetails": {
      "student_quiz_declare_id": 21,
      "quiz_declare_id": 2,
      "student_history_id": 58298,
      "quiz_name": "api test quiz",
      "start_date": "2023-12-19",
      "start_time": "00:51:00",
      "end_time": "23:00:00",
      "duration": 1329,
      "question_per_student": 3,
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
