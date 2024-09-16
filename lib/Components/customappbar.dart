// import 'package:flutter/material.dart';

// class CustomAppBar extends StatefulWidget {
//   const CustomAppBar({super.key});

//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();
// }

// class _CustomAppBarState extends State<CustomAppBar> with SingleTickerProviderStateMixin {
//   bool _isMenuOpen = false;
//   OverlayEntry? _overlayEntry;
//   AnimationController? _controller;
//   Animation<double>? _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);
//   }

//   void _toggleMenu() {
//     if (_isMenuOpen) {
//       _controller!.reverse().then((_) {
//         _overlayEntry?.remove();
//         setState(() {
//           _isMenuOpen = false;
//         });
//       });
//     } else {
//       _overlayEntry = _createOverlayEntry();
//       Overlay.of(context).insert(_overlayEntry!);
//       _controller!.forward();
//       setState(() {
//         _isMenuOpen = true;
//       });
//     }
//   }

//   OverlayEntry _createOverlayEntry() {
//     return OverlayEntry(
//       builder: (context) => AnimatedBuilder(
//         animation: _animation!,
//         builder: (context, child) {
//           return Positioned(
//             top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top,
//             left: 0,
//             width: MediaQuery.of(context).size.width * 0.6, // Adjust width as needed
//             child: Opacity(
//               opacity: _animation!.value,
//               child: Material(
//                 color: Colors.black.withOpacity(0.7),
//                 child: Container(
//                   color: Colors.black.withOpacity(0.7),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ListTile(
//                         leading: const Icon(Icons.close, color: Colors.white),
//                         title: const Text('Close', style: TextStyle(color: Colors.white)),
//                         onTap: _toggleMenu,
//                       ),
//                       const Divider(color: Colors.white),
//                       ListTile(
//                         title: const Text('Option 1', style: TextStyle(color: Colors.white)),
//                         onTap: () {
//                           print('Option 1 selected');
//                           _toggleMenu();
//                         },
//                       ),
//                       ListTile(
//                         title: const Text('Option 2', style: TextStyle(color: Colors.white)),
//                         onTap: () {
//                           print('Option 2 selected');
//                           _toggleMenu();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         icon: const Icon(Icons.menu),
//         onPressed: _toggleMenu,
//       ),
//       title: const Text('Custom AppBar'),
//     );
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
// }
