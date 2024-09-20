// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:applications/Models/product_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductListModel> _products = [];
  final bool _loading = false;
  final String _errorMessage = '';

  List<ProductListModel> get products => _products;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  Future<void> addProduct(
      String name, String moq, String price, String discountPrice) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userLoginToken = prefs.getString('loginToken');

    final url =
        Uri.parse('https://shareittofriends.com/demo/flutter/addProduct.php');
    try {
      var request = http.MultipartRequest('POST', url);
      request.fields['user_login_token'] = userLoginToken!;
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

  // Future<void> fetchProductList() async {
  //   // _loading = true;
  //   // _errorMessage = '';
  //   // notifyListeners();

  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? loginToken = prefs.getString('loginToken');
  //     await prefs.setString('loginToken', loginToken!);

  //     var url = Uri.parse(
  //         'https://shareittofriends.com/demo/flutter/productList.php');
  //     var response = await http.post(url, body: {
  //       'loginToken': loginToken,
  //     });

  //     if (response.statusCode == 200) {
  //       List<ProductListModel> products =
  //           productListModelFromJson(response.body);
  //       _products = products;
  //     } else {
  //       throw Exception(
  //           'Failed to load product list. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     _errorMessage = error.toString();
  //   } finally {
  //     _loading = false;
  //     notifyListeners();
  //   }
  // }

  // Fetch Product List
}
