import 'package:applications/Providers/auth_provider.dart';
import 'package:applications/Screens/product_screen.dart';
import 'package:applications/Screens/signup_screen.dart';
import 'package:applications/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '  Welcome Back to \n  our grocery shop',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
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
                          const SizedBox(height: 50.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          const SizedBox(height: 10.0),
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
                                return 'Please enter your register email';
                              }
                              // Add  validation if needed
                              return null;
                            },
                          ),
                          const SizedBox(height: 30.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          const SizedBox(height: 10.0),
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
                              if (value!.isEmpty) {
                                return 'Please enter your set password';
                              }
                              // Add  validation if needed (e.g., password strength)
                              return null;
                            },
                          ),
                          const SizedBox(height: 40.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const SizedBox(
                                child: Text(
                                  'Log In',
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
                                            //     final email =
                                            //         _phoneNumberController.text;
                                            //     final password =
                                            //         _passwordController.text;

                                            //     Provider.of<AuthProvider>(
                                            //             context,
                                            //             listen: false)
                                            //         .login(email, password)
                                            //         .then((user) {
                                            //       if (mounted) {
                                            //         // Handle successful login
                                            //         // Navigate to home or other screen
                                            //         Navigator.pushReplacement(
                                            //           context,
                                            //           MaterialPageRoute(
                                            //               builder: (context) =>
                                            //                   const ProductScreen()),
                                            //         );
                                            //       } else {
                                            //         // Handle login failure
                                            //         ScaffoldMessenger.of(
                                            //                 context)
                                            //             .showSnackBar(
                                            //           const SnackBar(
                                            //             content: Text(
                                            //                 'Login failed'),
                                            //           ),
                                            //         );
                                            //       }
                                            //     }).catchError((error) {
                                            //       // Handle errors
                                            //       ScaffoldMessenger.of(context)
                                            //           .showSnackBar(
                                            //         SnackBar(
                                            //           content: Text(
                                            //               'An error occurred: $error'),
                                            //         ),
                                            //       );
                                            //     });
                                            //   }
                                            Provider.of<AuthProvider>(context,
                                                    listen: false)
                                                .login(_emailController.text,
                                                    _passwordController.text)
                                                .then((_) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ProductScreen()),
                                              );
                                            }).catchError((error) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content:
                                                        Text('Error: $error')),
                                              );
                                            });
                                          },
                                          child: const Icon(
                                              Icons.arrow_forward_rounded))),
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't Have Account? "),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen()),
                                  );
                                },
                                child: const Text(
                                  'Sign up',
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
