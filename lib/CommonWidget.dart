// ignore_for_file: file_names

// // ignore_for_file: file_names

// import 'package:applications/Themes/colors.dart';
// import 'package:applications/main.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// void showSnackBar({required BuildContext context, required String content}) {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       backgroundColor: kMainColor,
//       duration: const Duration(seconds: 5),
//       content: Text(
//         content,
//         textAlign: TextAlign.center,
//       )));
// }

// void showLoading() {
//   showDialog(
//       context:navigatorkey.currentState!.context,
//       barrierDismissible: false,
//       builder: (context) {
//         if (kDebugMode) {
//           print('---------showload');
//         }
//         return Center(
//             child: Container(
//           height: 40,
//           width: 40,
//           padding: const EdgeInsets.all(8),
//           decoration:
//               const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//           child: CircularProgressIndicator(
//             strokeWidth: 2,
//             color: kMainColor,
//           ),
//         ));
//       });
// }

// void hideLoading() {
//   Navigator.pop(navigatorkey.currentState!.context);
// }

// void showMessage(String message) {
//   showDialog(
//       context: navigatorkey.currentContext!,
//       builder: (context) => Center(
//               child: AlertDialog(
//             backgroundColor: Colors.white,
//             content: Material(
//               color: Colors.white,
//               child: Text(message),
//             ),
//             actions: [
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Ok"))
//             ],
//           ),
//         ),
//       );  
// }

// void noInternet() {
//   showDialog(
//       context: navigatorkey.currentContext!,
//       builder: (context) => Center(
//               child: AlertDialog(
//             content: Material(
//               color: Colors.white,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(
//                     'images/logos/nosignal.png',
//                     height: 100,
//                     width: 100,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text("Ooops!"),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   const Text(
//                     "No Internet Connection",
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   const Text("check your connection", style: TextStyle(fontSize: 14)),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.grey, fixedSize: const Size.fromWidth(100)),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text("ok"))
//                 ],
//               ),
//             ),
//           )));
// }