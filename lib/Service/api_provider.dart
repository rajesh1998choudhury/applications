// // ignore_for_file: unnecessary_nullable_for_final_variable_declarations, unused_field, prefer_typing_uninitialized_variables, avoid_print, no_leading_underscores_for_local_identifiers

// import 'dart:convert';
// import 'dart:io';
// import 'dart:async';
// import 'package:applications/AppConstants.dart';
// import 'package:applications/commonWidget.dart';
// import 'package:applications/custom_exception.dart';
// import 'package:applications/main.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class ApiProvider {
//   final String? _baseUrl = BaseUrl;

//     //prefs
//   getToken() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     return pref.getString("token");
//   }
  
//   //future post
//   Future<dynamic> post(String url, requestJson) async {
//     // var cookie = await getCookie();
//     // var cookie =
//     // '.ASPNETAUTH=010247697CBFFFF1D908FE47C74C7200F2D9080007730074006900770061007200790000012F00FF';
//     // print('cookie value ' + cookie);
//     var responseJson;
//     String token = await getToken();
//     print('$token--------token');
//     print('${_baseUrl!}$url--------api');
//     print(requestJson + '----------requestjson');
//     try {
//       final response = await http
//           .post(Uri.parse(_baseUrl + url), body: requestJson, headers: {
//             "Authorization": token,
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             // 'Cookie': cookie,
//           })
//           .timeout(
//             const Duration(seconds: 20),
//           )
//           .onError((error, stackTrace) {
//             showSnackBar(
//                 context: navigatorkey.currentContext!,
//                 content: "No Internet Connection Found. check your connection");

//             throw error.toString();
//           });
//       print('reposne = ${response.statusCode}');
//       responseJson = _response(response, url);
//     } on SocketException {
//       //Get.defaultDialog(title: 'No Internet connection',middleText: 'I guess your Internet is not available!');
//       throw FetchDataException('No Internet connection');
//     }

//     return responseJson;
//   }

//   //future post
//   Future<dynamic> postwithoutCookie(String url, requestJson) async {
//     var responseJson;
//     String token = await getToken();
//     print('$token--------token');
//     print('${_baseUrl!}$url--------api');
//     print(requestJson + '----------requestjson');
//     try {
//       final response = await http
//           .post(Uri.parse(_baseUrl + url), body: requestJson, headers: {
//         "Authorization": token,
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       });
//       print('reposne = ${response.statusCode}');
//       responseJson = _response(response, url);
//     } on SocketException {
//       //Get.defaultDialog(title: 'No Internet connection',middleText: 'I guess your Internet is not available!');
//       throw FetchDataException('No Internet connection');
//     }

//     return responseJson;
//   }

//   dynamic _response(http.Response response, String url) async {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = json.decode(utf8.decode(response.bodyBytes));
//         print(responseJson.toString());
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 401:
//         hideLoading();
//         showMessage(response.body.toString());
//         break;
//       case 403:
//         SharedPreferences _prefs = await SharedPreferences.getInstance();
//         _prefs.clear();
//         // Navigator.pushAndRemoveUntil(
//         //     navigatorkey.currentContext!,
//         //     MaterialPageRoute(builder: (context) => LoginNavigator()),
//         //     (route) => false);
//         throw UnauthorisedException(response.body.toString());
//       //showMessage(response.body.toString());
//       //break;
//       case 404:

//       case 500:
//         showMessage("Internal Server error");
//         break;
//       default:
//         showMessage('Some error occurred');
//         throw FetchDataException(
//             'Error occurred while Communication with Server with StatusCode : ${response.statusCode} in url : $url');
//     }
//   }
// }

// void onError(error) {
//   return showMessage('');
// }
