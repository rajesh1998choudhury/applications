// ignore_for_file: unused_local_variable

import 'package:applications/Providers/auth_provider.dart';
import 'package:applications/Screens/login_screen.dart';
import 'package:applications/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;
  // final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox.shrink(),
                const Text(
                  '   Welcome to our\n   grocery shop',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Card(
                    color: Colors.white,
                    elevation: 10.0,
                    margin: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    surfaceTintColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          const SizedBox(height: 30.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Name',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          // Name Input Field
                          TextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            cursorColor: kFixColor,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  // borderSide: BorderSide(
                                  // color: Colors.red,
                                  // width: 1.0,
                                  //   ),
                                  ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kFixColor, width: 2.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              // Add  validation if needed
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          // Email Input Field
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: kFixColor,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kFixColor, width: 2.0),
                              ),
                              // prefixIcon: Icon(Icons.email),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please enter your email';
                              }
                              // Add  validation if needed
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Phone Number',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          // Phone Number Input Field
                          TextFormField(
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                            cursorColor: kFixColor,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kFixColor, width: 2.0),
                              ),
                              // prefixIcon: Icon(Icons.phone),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your mobile number';
                              }
                              // Add  validation if needed
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          // Password Input Field
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_passwordVisible,
                            cursorColor: kFixColor,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kFixColor, width: 2.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              // Add  validation if needed (e.g., password strength)
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const SizedBox(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                  child: authProvider.isLoading
                                      ? const CircularProgressIndicator()
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              backgroundColor: kMainColor,
                                              foregroundColor: Colors.white),
                                          onPressed: () async {
                                            // if (_formKey.currentState!
                                            //     .validate()) {
                                            //   authProvider
                                            //       .s(
                                            //     _nameController.text,
                                            //     _phoneNumberController.text,
                                            //     _passwordController.text,
                                            //   )
                                            //       .then((user) {
                                            //     if (mounted) {
                                            //       // Handle successful registration
                                            //       Navigator.push(
                                            //         context,
                                            //         MaterialPageRoute(
                                            //             builder: (context) =>
                                            //                 const ProductScreen()),
                                            //       );
                                            //     } else {
                                            //       // Handle registration failure
                                            //       ScaffoldMessenger.of(context)
                                            //           .showSnackBar(
                                            //         const SnackBar(
                                            //           content: Text(
                                            //               'Registration failed'),
                                            //         ),
                                            //       );
                                            //     }
                                            //   });
                                            // }
                                            if (_formKey.currentState!
                                                .validate()) {
                                              Provider.of<AuthProvider>(context,
                                                      listen: false)
                                                  .signup(
                                                      _nameController.text,
                                                      _emailController.text,
                                                      _phoneNumberController
                                                          .text,
                                                      _passwordController.text)
                                                  .then((_) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Congratulations! Your account is created.'),
                                                    duration:
                                                        Duration(seconds: 1),
                                                  ),
                                                );
                                                // Navigate to Login Screen after 1 seconds
                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, '/login');
                                                });
                                              }).catchError((error) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content:
                                                      Text(error.toString()),
                                                ));
                                              });
                                            }
                                          },
                                          child: const Icon(
                                              Icons.arrow_forward_rounded))),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already Have Account? "),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
