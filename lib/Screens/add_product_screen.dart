import 'package:applications/Screens/product_screen.dart';
import 'package:applications/Themes/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                           IconButton(
                           icon: const Icon(Icons.close_sharp, size: 30, color: Colors.black),
                           onPressed:() {
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
                           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                           textAlign: TextAlign.center,
                           ),
                         ),
                         ),
                        ),]
                     ),
                      Image.asset('assets/unnamed.png',
                      width: 200,
                      height: 200,),
                   ],
                 ),
                 Padding(padding: const EdgeInsets.all(20),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      // const SizedBox(height: 8.0),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextFormField(
                      controller: _productNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
        color: Colors.red, // Default border color
        width: 1.0,
      ),
                        ),
           
                      ),
                      validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Name';
                      }
                      // Add  validation if needed
                      return null;
                    },
                    ),
                    const SizedBox(height: 16.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                     Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Product Name',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                    TextFormField(
                      controller: _productNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter product name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Product Name',
                        hintText: 'Enter Product Name',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // MOQ
                    TextFormField(
                      controller: _moqController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter MOQ';
                        }
                        if (int.parse(value) <= 0) {
                          return 'MOQ must be greater than 0';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'MOQ',
                        hintText: 'Enter MOQ',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Price
                    TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter price';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Price must be greater than 0';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Price',
                        hintText: 'Enter Price',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Discount Price
                    TextFormField(
                      controller: _discountPriceController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isNotEmpty && double.parse(value) < 0) {
                          return 'Discount price cannot be negative';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Discount Price',
                        hintText: 'Enter Discount Price',
                      ),
                    ),
                    const SizedBox(height: 32.0),
                              SizedBox(
                              width: double.infinity,
                        child: ElevatedButton( 
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                            backgroundColor: kMainColor,
                            foregroundColor: Colors.white
                          ),
                          onPressed: () {
                             if (_formKey.currentState!.validate()) {
                            // Product name: _productNameController.text
                            // MOQ: _moqController.text
                            // Price: _priceController.text
                            // Discount price: _discountPriceController.text
                            // Submit data to server or database
                              Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>  const ProductScreen()),);
                             }
                          },
                          child: const Text("Submit",
                          style: TextStyle(color: Colors.white),
                          ),)
                      ),
                  ],
                ),],),),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.grid_on),
      //       label: 'Grid',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Account',
      //     ),
      //   ],
      // ),
    );
  }
}