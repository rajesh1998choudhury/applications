import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _signupToken;
  String? _loginToken;

  bool get isLoading => _isLoading;

  // Getter methods to access the tokens
  String? get signupToken => _signupToken;
  String? get loginToken => _loginToken;

  // Load tokens when the app starts
  Future<void> loadTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _signupToken = prefs.getString('signupToken');
    _loginToken = prefs.getString('loginToken');
    notifyListeners();
  }

  // Function to handle signup
  Future<void> signup(
      String name, String email, String mobile, String password) async {
    // _isLoading = true;
    // notifyListeners();

    final url =
        Uri.parse('https://shareittofriends.com/demo/flutter/Register.php');
    try {
      var request = http.MultipartRequest('POST', url);
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['mobile'] = mobile;
      request.fields['password'] = password;

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var result = json.decode(responseBody);

      if (response.statusCode == 200 && result['data']['user_token'] != null) {
        // Store signup token
        _signupToken = result['data']['user_token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('signupToken', _signupToken!);

        // Show success message
        await Future.delayed(const Duration(seconds: 1));
      } else {
        throw Exception(result['message']);
      }
    } catch (error) {
      _isLoading = false;
      throw Exception('Signup failed: $error');
    }

    notifyListeners();
  }

  // Function to handle login
  Future<void> login(String email, String password) async {
    // _isLoading = true;
    // notifyListeners();

    final url =
        Uri.parse('https://shareittofriends.com/demo/flutter/Login.php');
    try {
      var request = http.MultipartRequest('POST', url);
      request.fields['email'] = email;
      request.fields['password'] = password;

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var result = json.decode(responseBody);

      if (response.statusCode == 200 && result['data']['user_token'] != null) {
        // Store login token (overwriting signup token)
        _loginToken = result['data']['user_token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('loginToken', _loginToken!);

        // Clear signup token if needed
        await prefs.remove('signupToken');
      } else {
        throw Exception(result['message']);
      }
    } catch (error) {
      _isLoading = false;
      throw Exception('Login failed: $error');
    }

    notifyListeners();
  }

  Future<void> logout() async {
    _signupToken = null;
    _loginToken = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('signupToken');
    await prefs.remove('loginToken');
    notifyListeners();
  }
}
