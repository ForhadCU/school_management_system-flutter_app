import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Config/constants/constants.dart';
import '../../Controller/common/common_controller.dart';
import '../../Model/response_model.dart';
import '../../Singletones/app_data.dart';
import '../toast_utils.dart';

class CallAPI {
  //make it singleTone class
  static final CallAPI _singleton = CallAPI._internal();
  factory CallAPI() {
    return _singleton;
  }
  CallAPI._internal();

  static int timeOutSec = 15;
  //DEV:
// final  String _host = 'http://10.0.2.2:8080';
// final  String _getHost = '10.0.2.2:8080';
// final  String _url = 'http://10.0.2.2:8080/api/app/';
// final  String _getMiddlePoint = '/api/app/';

  //***PROD: ALSO MAKE HTTP TO HTTPS Uri.https ***\
/*   final String _host = 'https://cms.goecworld.com';
  // ignore: non_constant_identifier_names
  final String _get_host = 'cms.goecworld.com';
  final String _url = 'https://cms.goecworld.com/Chargetron/api/';
  // ignore: non_constant_identifier_names
  final String _get_middle_point = '/Chargetron/api/'; */

  //***PROD: ALSO MAKE HTTP TO HTTPS Uri.https ***\
  static const String _host = 'https://cms.goecworld.com';
  static const String _https = 'https://';
  static const String _get_host = '.theworld.com.bd';
  // static const String _getHostForSubmition = 'https://fccdc.theworld.com.bd';
  static const String _url = 'https://cms.goecworld.com/Chargetron/api/';
  static const String _get_middle_point = '/Chargetron/api/';

/////////POST DATA/////////////////
  static Future<ResponseModel> postData(
      Map<String, dynamic> data, String endPoint) async {
    try {
      kLog('POST $endPoint');
      http.Response res = await http.post(
        Uri.https(_get_host, _get_middle_point + endPoint),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('post request end');
      dynamic body;
      if (res.statusCode == 200) body = json.decode(res.body);
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
    }
    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> postPublicData(
      String endPoint, Map<String, dynamic> payload) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    try {
      kLog('POST $endPoint');
      showLoading("Please wait...");

      http.Response res = await http.post(
        Uri.https(siteAlias! + _get_host, endPoint),
        body: jsonEncode(payload),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('post request end');
      dynamic body;
      if (res.statusCode == 200) {
        body = json.decode(res.body);
        showSuccess("Success");
      }
      ;
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
    }
    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> userLogin(
      String endPoint, Map<String, dynamic> payload) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    // kLog("Site Alis is ${sitelistModel.siteAlias}");
    try {
      kLog('POST $endPoint');
      showLoading("Please wait...");
      http.Response res = await http.post(
        Uri.https(siteAlias! + _get_host, endPoint),
        body: jsonEncode(payload),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('post request end');
      dynamic body;
      if (res.statusCode == 200) {
        body = json.decode(res.body);
        showSuccess("Success");
      }
      ;
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
    }
    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> userLogout(
      String endPoint, Map<String, dynamic> payload, String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    // kLog("Site Alis is ${sitelistModel.siteAlias}");

    kLog(siteAlias! + _get_host + endPoint);
    try {
      kLog('POST $endPoint');
      showLoading("Please wait...");
      http.Response res = await http.post(
        Uri.https(siteAlias + _get_host, endPoint),
        body: jsonEncode(payload),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('post request end');
      dynamic body;
      if (res.statusCode == 200 || res.statusCode == 401) {
        body = json.decode(res.body);
        // showSuccess("Success");
      }
      hideLoading();

      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
    }
    return ResponseModel(statusCode: 404, body: null);
  }

////////GET DATA/////////////////
  static Future<ResponseModel> getData(
      String endPoint, Map<String, dynamic>? params,
      {String? url}) async {
    dynamic body;
    kLog('GET + $endPoint');
    try {
      http.Response res = await http.get(
        Uri.https(_get_host, _get_middle_point + endPoint, params),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      if (res.statusCode == 200) {
        body = json.decode(res.body);
      }

      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError('Failed to get data');
    }

    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> getPublicData(
      String endPoint, Map<String, dynamic>? params,
      {String? url}) async {
    dynamic body;
    kLog('GET + $endPoint');
    showLoading("Please wait...");

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;

    try {
      http.Response res = await http.get(
        Uri.https(siteAlias! + _get_host, endPoint, params),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',

          // 'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      if (res.statusCode == 200) {
        body = json.decode(res.body);
        hideLoading();
      }
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError('Failed to get data');
    }

    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> getStudentData(
      String endPoint, Map<String, dynamic>? params, String token,
      {String? url}) async {
    dynamic body;
    kLog('GET + $endPoint');
    showLoading("Please wait...");

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    try {
      http.Response res = await http.get(
        Uri.https(siteAlias! + _get_host, endPoint, params),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",

          // 'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      if (res.statusCode == 200) {
        body = json.decode(res.body);
        hideLoading();
      }
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError('Failed to get data');
    }

    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> getTeacherData(
      String endPoint, Map<String, dynamic>? params, String token,
      {String? url, bool? isShowLoading}) async {
    dynamic body;
    kLog('GET + $endPoint');
    isShowLoading == null || isShowLoading
        ? showLoading("Please wait...")
        : null;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    try {
      http.Response res = await http.get(
        Uri.https(siteAlias! + _get_host, endPoint, params),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",

          // 'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      if (res.statusCode == 200) {
        body = json.decode(res.body);
        hideLoading();
      }
      hideLoading();

      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError('Failed to get data');
    }

    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> getRoutineData(
      String endPoint, Map<String, dynamic>? params, String token, bool? isPdf,
      {String? url}) async {
    dynamic body;
    kLog('GET + $endPoint');
    showLoading("Please wait...");
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    try {
      http.Response res = await http.get(
        Uri.https(siteAlias! + _get_host, endPoint, params),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",

          // 'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });

      if (res.statusCode == 200) {
        if (isPdf != null) {
          body = res.bodyBytes;
        } else {
          body = json.decode(res.body);
        }
        // showSuccess("Success");
      }
      hideLoading();
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError('Failed to get data');
    }

    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> postStudentData(
      String endPoint, Map<String, dynamic> payload, String token,
      [bool? isPdf]) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    try {
      kLog('POST $endPoint');
      showLoading("Please wait...");

      http.Response res = await http.post(
        Uri.https(
          siteAlias! + _get_host,
          endPoint,
        ),
        body: jsonEncode(payload),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('post request end');
      dynamic body;

      if (res.statusCode == 200) {
        if (isPdf != null) {
          body = res.bodyBytes;
          hideLoading();
        } else {
          body = json.decode(res.body);
          showSuccess("Success");
        }
      }
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError("Failed");
    }
    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> getDownloadDemandSlipPdf(
    String endPoint,
    Map<String, dynamic> payload,
    String token,
  ) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    try {
      kLog('POST $endPoint');
      showLoading("Please wait...");

      http.Response res = await http.post(
        Uri.https(
          siteAlias! + _get_host,
          endPoint,
        ),
        body: jsonEncode(payload),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('post request end');
      dynamic body;

      if (res.statusCode == 200) {
        body = res.bodyBytes;

        showSuccess("Success");
      }
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError("Failed");
    }
    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> postStudentDataSaveQuiz(String endPoint,
      Map<String, dynamic> payload, String token, String params) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    try {
      kLog('POST $endPoint');
      // showLoading("Please wait...");

      Map<String, dynamic> paramMap = {"api_access_key": params};
      // String urlWithParams = Uri.parse('$_get_host$endPoint')
      String urlWithParams = Uri.parse('$_https$siteAlias$_get_host$endPoint')
          .replace(queryParameters: paramMap)
          .toString();
      kLog(urlWithParams);
      http.Response res = await http.post(
        // Uri.https(_get_host, endPoint),
        Uri.parse(urlWithParams),
        body: jsonEncode(payload),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('post request end');
      dynamic body;

      if (res.statusCode == 200) {
        body = json.decode(res.body);

        // showSuccess("Submited");
      }
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError("Failed");
    }
    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> postStudentDataSaveQuizFinallEnd(String endPoint,
      Map<String, dynamic> payload, String token, String params) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    try {
      kLog('POST $endPoint');
      showLoading("Please wait...");

      Map<String, dynamic> paramMap = {"api_access_key": params};
      // String urlWithParams = Uri.parse('$_get_host$endPoint')
      String urlWithParams = Uri.parse('$_https$siteAlias$_get_host$endPoint')
          .replace(queryParameters: paramMap)
          .toString();
      kLog(urlWithParams);
      http.Response res = await http.post(
        // Uri.https(_get_host, endPoint),
        Uri.parse(urlWithParams),
        body: jsonEncode(payload),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('post request end');
      dynamic body;

      if (res.statusCode == 200) {
        body = json.decode(res.body);

        showSuccess("Submitted");
      }
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError("Failed");
    }
    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> getSiteData(
      /* String endPoint, */ /* Map<String, dynamic>? params, */
      {String? url}) async {
    dynamic body;
    print('GET + get-site-list');
    try {
      http.Response res = await http.get(
        // Uri.https(_get_host, _get_middle_point + endPoint, params),
        Uri.https("eduworld.theworld.com.bd", "/api/site/get-site-list"),
        headers: {
          // "Access-Control-Allow-Origin": "*",
          'Content-type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      if (res.statusCode == 200) {
        body = json.decode(res.body);
        hideLoading();
      }

      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      print(e.toString());
      hideLoading();
      showError('Failed to get data');
    }

    return ResponseModel(statusCode: 404, body: null);
  }

  static Future<ResponseModel> postTeacherData(
      {required String endPoint,
      required Map<String, dynamic> bodyData,
      required String token,
      required Map<String, dynamic> payload}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    SitelistModel sitelistModel = SitelistModel.fromMap(
        jsonDecode(sharedPreferences.getString(kSiteListModel)!));
    final siteAlias = sitelistModel.siteAlias;
    try {
      kLog('POST $endPoint');
      showLoading("Please wait...");

      // Map<String, dynamic> paramMap = {"api_access_key": params};
      // String urlWithParams = Uri.parse('$_get_host$endPoint')
      String urlWithParams = Uri.parse('$_https$siteAlias$_get_host$endPoint')
          .replace(queryParameters: payload)
          .toString();
      kLog(urlWithParams);
      http.Response res = await http.post(
        // Uri.https(_get_host, endPoint),
        Uri.parse(urlWithParams),
        body: jsonEncode(bodyData),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('post request end');
      dynamic body;

      if (res.statusCode == 200) {
        body = json.decode(res.body);

        showSuccess("Submitted");
      }
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError("Failed");
    }
    return ResponseModel(statusCode: 404, body: null);
  }

////////////////PUT//////////////////////
  static Future<ResponseModel> putData(
      Map<String, dynamic> data, String endPoint) async {
    try {
      kLog('PUT $endPoint');
      http.Response res = await http.put(
        Uri.parse(_url + endPoint),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('PUT request end');
      dynamic body;
      kLog(res.statusCode.toString());
      kLog(res.body.toString());
      if (res.statusCode == 200) body = json.decode(res.body);
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError('Failed to put data');
    }
    return ResponseModel(statusCode: 404, body: null);
  }

///////DELETE API///////////////
  static Future<ResponseModel> deleteData(
      Map<String, dynamic> data, String endPoint) async {
    try {
      kLog('DELETE $endPoint');
      http.Response res = await http.delete(
        Uri.parse(_url + endPoint),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'JWT-${appData.token}',
        },
      ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
        hideLoading();
        return http.Response('Error', 408);
      });
      kLog('delete request end');
      dynamic body;
      // if (res.statusCode == 200) {

      // }
      body = json.decode(res.body);
      return ResponseModel(statusCode: res.statusCode, body: body);
    } on Exception catch (e) {
      kLog(e.toString());
      hideLoading();
      showError('Failed to delete!');
    }
    return ResponseModel(statusCode: 404, body: null);
  }

/////////PATCH DATA////////////////
  static Future<ResponseModel> patchData(
      String endPoint, Map<String, dynamic>? params) async {
    http.Response res = await http.patch(
      Uri.http(
          // '35.154.49.246',
          _host,
          "Chargetron/api/app/ + $endPoint",
          params),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'JWT-${appData.token}',
      },
    ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
      hideLoading();
      return http.Response('Error', 408);
    });
    dynamic body;
    // if (res.statusCode == 200) {

    // } else {}

    body = json.decode(res.body);
    // kLog(body.toString());
    return ResponseModel(statusCode: res.statusCode, body: body);
  }

//////IMAGE UPLOAD//////
  static uploadFile(String text, File file) async {
    //create multipart request for POST or PATCH method
    showLoading('uploading...');
    var request = http.MultipartRequest(
        "POST", Uri.parse("https://voxryde.com/api/v1/customer/update/image"));
    //add text fields
    request.fields["text_image"] = text;
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath('image', file.path);
    //add multipart to request
    request.files.add(pic);
    request.headers.addAll({
      'Authorization': 'JWT-${appData.token}',
    });
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    hideLoading();
    var res = jsonDecode(responseString);
    kLog(res['image']);
    // appData.userModel.image = res['image'] ?? '';
    return res['image'];
  }

  /*  Future<void> download(String endPoint, var param, String fileName) async {
    http.Response response = await http.get(
      Uri.https(_get_host, _get_middle_point + endPoint, param),
      headers: {
        // 'Content-type': 'application/json',
        // 'Accept': 'application/json',
        'Authorization': 'JWT-${appData.token}',
      },
    ).timeout(Duration(seconds: timeOutSec), onTimeout: () {
      hideLoading();
        return http.Response('Error', 408);
    });

    if (response.statusCode == 200) {
      final Uint8List data = response.bodyBytes;
      final blob = html.Blob([data], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      final anchor = html.AnchorElement(href: url)
        ..target = 'download_link'
        ..download = fileName;

      anchor.click();

      // Optionally, clean up the object URL after the download
      html.Url.revokeObjectUrl(url);
    } else {
      // Handle error (e.g., show an error message)
      kLog('Failed to download PDF file: ${response.statusCode}');
    }
  }
 */
  /*  void downloadFile(List<int> content, String filename) {
    final blob = html.Blob([content]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..target = 'download_link'
      ..download = filename;

    anchor.click();

    // Optionally, clean up the object URL after the download
    html.Url.revokeObjectUrl(url);
  } */

//EASY FUNCTIONS
  static Future easyGet<T>(
      {required Map<String, dynamic> query,
      required String endpoint,
      required bool isList,
      required var model}) async {
    var res = await getData(endpoint, query);
    kLog(res.statusCode.toString());
    if (res.statusCode == 200 &&
        res.body['result'] != null &&
        res.body['success']) {
      kLog(res.body['result'].toString());
      if (isList) {
        List<T> list = [];
        res.body['result'].forEach((element) {
          list.add(model.fromJson(element));
        });
        return list;
      } else {
        return model.fromJson(res.body['result']);
      }
    }
    return isList ? <T>[] : model;
  }
}
