

// ignore_for_file: library_prefixes

import 'dart:convert';
import 'dart:io';
import 'package:applications/AppConstants.dart'as Appconstants;
import 'package:applications/Service/api_provider.dart';
import 'package:applications/commonWidget.dart';
import 'package:flutter/foundation.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier with DiagnosticableTreeMixin {
  final ApiProvider _apiProvider = ApiProvider();

register({name, email, password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        showLoading();
        prefs.getString("mob_no");
        String requestJson = jsonEncode({
          "mobile": prefs.getString("mob_no"),
          "name": name,
          "email": email,
          "password": password,
        });
        if (kDebugMode) {
          print(prefs.getString("mob_no"));
        }
        final response =
            await _apiProvider.post(Appconstants.REGISTER, requestJson);
        if (kDebugMode) {
          print('---------------register');
        }

        if (response["d"] != '') {
         
          return 'success';
        } else {
          showMessage(response["Message"]);
        }
        hideLoading();
      }
    } on SocketException catch (e) {
      noInternet();
      // showMessage('No Internet connection');
      if (kDebugMode) {
        print(e);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}