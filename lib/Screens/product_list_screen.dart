import 'package:applications/Screens/test_screen.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final _formKey = GlobalKey<FormState>();
  late final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Builder(
                              builder: (context) => IconButton(
                                  icon: const Icon(Icons.menu,
                                      size: 30, color: Colors.black),
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  })),
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: SizedBox(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Product List',
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
                _searchBar(),
                const SizedBox(
                  height: 10,
                ),
                // Container(
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     itemBuilder: (context, index){
                //     return ListTile();
                //   }),),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  // color: kMainColor, //Theme.of(context).scaffoldBackgroundColor,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 10,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width: 150,
                                  height: 100,
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Price: ${product.price}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'MOQ: ${product.moq}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Price: ${product.price}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Discount Price: ${product.discountPrice}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ])),
                              const SizedBox(
                                width: 10,
                              ),
                              // Container(
                              //   width: 160,
                              //   height: 100,
                              //   decoration: const BoxDecoration(
                              //     color: Colors.green,
                              //   ),
                              // ),
                              //  Text(
                              //       'Product Name: ${product.name}',
                              //       style: const TextStyle(fontWeight: FontWeight.bold),
                              //     ),
                              //  Column(
                              //   children: [
                              //     Text(
                              //       'Product Name: ${product.name}',
                              //       style: const TextStyle(fontWeight: FontWeight.bold),
                              //     ),
                              //   ],
                              //  )
                              //  SizedBox(
                              //   width: 100,
                              //   child: Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              // Text(
                              //   'Product Name: ${product.name}',
                              //   style: const TextStyle(fontWeight: FontWeight.bold),
                              // ),
                              //     const SizedBox(height: 8),
                              //     Text('MOQ: ${product.moq}',
                              //      style: const TextStyle(fontWeight: FontWeight.bold),
                              //     ),
                              //   ],
                              // ),
                              //  )
                            ],
                          ))
                      // child: const Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     Text('Product Name'),
                      //   ]
                      // ),
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

Widget _searchBar() {
  return const Padding(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20),
    child: TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
            bottom: Radius.circular(20.0),
          ),
          // borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
            bottom: Radius.circular(20.0),
          ),
          borderSide: BorderSide(color: Colors.black54, width: 2.0),
        ),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(Icons.search, color: Colors.black),
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Row(
          children: [
            Container(
              width: 12,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name: ${product.name}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'MOQ: ${product.moq}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        'Price: ${product.price}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        'Discount Price: ${product.discountPrice}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 1.0, bottom: 40, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 16,
                    ),
                    color: Colors.grey,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.black,
                      size: 16,
                    ),
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
