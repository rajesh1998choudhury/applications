// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:applications/Service/auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthProvider with ChangeNotifier {
//   final AuthService _authService = AuthService();
//   bool _isLoading = false;
//   String? _errorMessage;

//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;

//   Future<void> register(String name, String mobile, String password) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       await _authService.register(name, mobile, password);
//       _isLoading = false;
//       _errorMessage = null;
//     } catch (error) {
//       _isLoading = false;
//       _errorMessage = error.toString();
//     }

//     notifyListeners();
//   }

//   Future<void> login(String email, String password) async {
//     _isLoading = true;
//     notifyListeners();

//     const url = 'https://shareittofriends.com/demo/flutter/Login.php';
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         body: {
//           'email': email,
//           'password': password,
//         },
//       );
//       final data = jsonDecode(response.body);

//       if (response.statusCode == 200 && data['title'] == "Logged In!") {
//         // Save user data in shared preferences
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('user_token', data['data']['user_token']);
//         await prefs.setString('user_id', data['data']['id']);
//         await prefs.setString('user_name', data['data']['name']);
//         await prefs.setString('user_email', data['data']['email']);
//         await prefs.setString('user_mobile', data['data']['mobile']);

//         // Show success message
//         if (kDebugMode) {
//           print(data['message']);
//         }
//       } else {
//         throw Exception('Failed to log in');
//       }
//     } catch (error) {
//       rethrow;
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
