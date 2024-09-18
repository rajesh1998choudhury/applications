// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider extends ChangeNotifier {
  Future<void> addProduct(
      String name, String moq, String price, String discountPrice) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userLoginToken = prefs.getString('loginToken');
    if (userLoginToken == null) {
      throw Exception('Login token not found. Please login again.');
    }

    final url =
        Uri.parse('https://shareittofriends.com/demo/flutter/addProduct.php');
    try {
      var request = http.MultipartRequest('POST', url);
      request.fields['user_login_token'] = userLoginToken;
      request.fields['name'] = name;
      request.fields['moq'] = moq;
      request.fields['price'] = price;
      request.fields['discount_price'] = discountPrice;

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var result = json.decode(responseBody);

      if (response.statusCode == 200 && result['title'] == 'Success!') {
        // Handle success, show message or navigate
        print('Product added successfully');
      } else {
        throw Exception(result['message']);
      }
    } catch (error) {
      throw Exception('Product creation failed: $error');
    }
  }
}
