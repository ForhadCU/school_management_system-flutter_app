class PayLoads {
  // make this class singleton
  PayLoads._internal();
  static final PayLoads _singleton = PayLoads._internal();
  factory PayLoads() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static Map<String, dynamic> allNotice({
    required String api_access_key,
    required String site_id,
    required String paginate,
    // String? research_txt,
    required String date_range,
    required String status,/*  required String api_access_key,
    required int site_id,
    required int paginate,
    // String? research_txt,
    required Map<String, dynamic> date_range,
    required int status, */
  }) {
    return {
      "api_access_key": api_access_key,
      "site_id": site_id,
      "paginate": paginate,
      // "research_txt": research_txt,
      "date_range": date_range,
      "status": status,
    };
  }

  static Map<String, dynamic> dateRange({
    required String start,
    required String end,
  }) {
    return {
      "start": start,
      "end": end,
    };
  }

  static Map<String, dynamic> aboutUs({
    required int site_id,
    required String api_access_key,
  }) {
    return {
      "site_id": site_id,
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> imageGallery({
    required String api_access_key,
    required int site_id,
    required int paginate,
  }) {
    return {
      "api_access_key": api_access_key,
      "site_id": site_id,
      "paginate": paginate,
    };
  }

  static Map<String, dynamic> academicGroupList({
    required String api_access_key,
    required String site_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "site_id": site_id,
    };
  }

  static Map<String, dynamic> monthWiseCalendarList({
    required String api_access_key,
    required int site_id,
    required int academic_group_id,
    required int monthIncrement,
  }) {
    return {
      "api_access_key": api_access_key,
      "key": site_id,
      "academic_group_id": academic_group_id,
      "monthIncrement": monthIncrement,
    };
  }
}
