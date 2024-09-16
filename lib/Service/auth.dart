import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  Future<Map<String, dynamic>> register(String name, String mobile, String password) async {
    final url = Uri.parse('https://shareittofriends.com/demo/flutter/Register.php');
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'name': name,
      'mobile': mobile,
      'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_token', responseData['data']['user_token']);
        prefs.setInt('user_id', responseData['data']['id']);
        prefs.setString('user_name', responseData['data']['name']);
        prefs.setString('user_mobile', responseData['data']['mobile']);
        prefs.setString('user_email', responseData['data']['email']);

        return responseData;
      } else {
        throw Exception('Error registering user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }
}
