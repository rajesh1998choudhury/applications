import 'package:applications/Screens/product_screen.dart';
import 'package:applications/Themes/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _moqController = TextEditingController();
  final _priceController = TextEditingController();
  final _discountPriceController = TextEditingController();

  // You can create a method to handle the product addition
  Future<void> _addProduct() async {
    String productName = _productNameController.text;
    int moq = int.parse(_moqController.text);
    double price = double.parse(_priceController.text);
    double discountPrice = _discountPriceController.text.isNotEmpty
        ? double.parse(_discountPriceController.text)
        : 0.0;

    // Here you can manage the data, for example, send it to an API or save it locally.
    // This is just an example print statement.
    if (kDebugMode) {
      print('Product Name: $productName');
    }
    if (kDebugMode) {
      print('MOQ: $moq');
    }
    if (kDebugMode) {
      print('Price: $price');
    }
    if (kDebugMode) {
      print('Discount Price: $discountPrice');
    }

    // Optionally, you can show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product added successfully!')),
    );

    // Clear the text fields after adding
    _productNameController.clear();
    _moqController.clear();
    _priceController.clear();
    _discountPriceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.close_sharp,
                                size: 30, color: Colors.black),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: SizedBox(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Add Product',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ]),
                    Image.asset(
                      'assets/unnamed.png',
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '   Product Name',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: _productNameController,
                        decoration: InputDecoration(
                          filled: true, // Enable filling the background
                          fillColor: Colors.white,
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
                          if (value!.isEmpty) {
                            return 'Please enter product name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        '   MOQ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: _moqController,
                        keyboardType: TextInputType.number,
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
                          if (value!.isEmpty) {
                            return 'Please enter MOQ';
                          }
                          if (int.parse(value) <= 0) {
                            return 'MOQ must be greater than 0';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        '   Price',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
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
                          if (value!.isEmpty) {
                            return 'Please enter price';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Price must be greater than 0';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        '   Discount Price',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: _discountPriceController,
                        keyboardType: TextInputType.number,
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
                          if (value!.isNotEmpty && double.parse(value) < 0) {
                            return 'Discount price cannot be negative';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32.0),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                backgroundColor: kMainColor,
                                foregroundColor: Colors.white),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Product name: _productNameController.text;
                                // MOQ: _moqController.text
                                // Price: _priceController.text
                                // Discount price: _discountPriceController.text
                                // Submit data to server or database
                                _addProduct();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductScreen()),
                                );
                              }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
