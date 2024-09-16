
import 'package:applications/Screens/signup_screen.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();

    Timer(const Duration(seconds: 5), () {
      if(mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );}
    });
  }

  _startAnimation() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) {
      setState(() {
        _opacity = 1.0;
      });}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/shopping_cart.PNG',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 10), 
                
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'eGrocery',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                  'your daily needs',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}