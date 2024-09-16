import 'package:flutter/material.dart';

class Product {
  final String name;
  final String moq;
  final double price;
  final double discountPrice;

  Product({
    required this.name,
    required this.moq,
    required this.price,
    required this.discountPrice,
  });
}

class ProductListsScreen extends StatelessWidget {
  final List<Product> products = List.generate(5, (index) {
    return Product(
      name: "Tomato",
      moq: "AB11001",
      price: 1299,
      discountPrice: 999,
    );
  });

  ProductListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
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
            const SizedBox(width: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name: ${product.name}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('MOQ: ${product.moq}',
                     style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
        const SizedBox(width: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text('Price: ${product.price}', 
                      style: const TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text('Discount Price: ${product.discountPrice}',
                       style: const TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15,),
            Padding(
              padding: const EdgeInsets.only(right: 1.0, bottom: 40, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      // Edit action
                    },
                    icon: const Icon(Icons.edit, color: Colors.black, size: 16,),
                    color: Colors.grey,
                  ),
                  
                  IconButton(
                    onPressed: () {
                      // Delete action
                    },
                    icon: const Icon(Icons.delete_forever, color: Colors.black, size: 16,),
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

void main() => runApp(MaterialApp(home: ProductListsScreen()));
