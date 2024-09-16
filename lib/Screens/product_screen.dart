import 'package:applications/Screens/add_product_screen.dart';
import 'package:applications/Screens/product_list_screen.dart';
import 'package:applications/Themes/colors.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final _formKey = GlobalKey<FormState>();

  int _selectedIndex = 0;

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductScreen()),
        );
        break;
      case 1:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const AddProductScreen()),
          
        // );
        break;
      case 2:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const ProductListScreen()),
        // );
        break;
    }
    }

    int? _selectedChipIndex;

    final List<String> _chipLabels = [
    'Cabbage and lettuce (14)',
    'Cucumbers and tomato',
    'Onions and garlic (8)',
    'Peppers (7)',
    'Potatoes and ca'
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) =>
                            IconButton(
                            icon: const Icon(Icons.menu, size: 30, color: Colors.black),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            })                     
                        ),
                         const Padding(
                           padding: EdgeInsets.all(12.0),
                           child: SizedBox(
                            child: Align(
                           alignment: Alignment.bottomLeft,
                           child: Text(
                           'Vegetables',
                           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                           textAlign: TextAlign.center,
                           ),
                         ),
                         ),
                        ),
                      ],
                    ),
                    Image.asset('assets/unnamed.png',
                      width: 200,
                      height: 200,),
                  ],
                ),
                const Row(
                  children: [
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0,),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                              bottom: Radius.circular(20.0),
                            ) ,
                            // borderSide: BorderSide(color: Colors.grey,),
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
                    ),
                     SizedBox(width: 10,),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
        padding: const EdgeInsets.only(left: 10,right: 10, bottom: 2),
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _chipLabels.length,
            itemBuilder: (context, index) {
              final bool isSelected = _selectedChipIndex == index;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0,),
                child: ChoiceChip(
                  label: Text(_chipLabels[index]),
                  selected: isSelected,
                  selectedColor: kMainColor,
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedChipIndex = selected ? index : null;
                    });
                  },
                  backgroundColor: Colors.grey.shade200, 
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.purple : Colors.black54, 
                  ),
                  showCheckmark: false,
                   avatar: isSelected 
                    ? const Icon(
                        Icons.check, 
                        color: Colors.purple,
                      ) 
                    : null,
                ),
              );
            },
          ),
        ),
      ),
                Expanded(
                  child: ListView(
                    children: const [
                      VegetableItem(
                        title: 'Boston Lettuce',
                        price: '1.10 € / piece',
                        image: 'assets/img1.png',
                      ),
                      VegetableItem(
                        title: 'Purple Cauliflower',
                        price: '1.85 €/kg',
                        image: 'assets/img2.png',
                      ),
                      VegetableItem(
                        title: 'Savoy Cabbage',
                        price: '1.45 €/kg',
                        image: 'assets/img3.png', 
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "",
            // 'Grid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "",
            // 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
            // 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kMainColor, 
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, 
      ),
      drawer: SizedBox(width: 240,
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 30, color: Colors.black,),
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                ),
              ),
         
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Card(
                  margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                  child: SizedBox(
                    width: 180,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      ListTile(
                        leading: const Icon(Icons.production_quantity_limits_sharp),
                        title: const Text('Add Product'),
                        onTap: () {
                                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> const AddProductScreen()),);
                        },
                      ),
                      const Divider(
                      height: 20,
                      indent: 10,
                      endIndent: 10,
                      ),
                      ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: const Text('View Listing'),
                      onTap: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> const ProductListScreen()),);
                    },
                              ),
                              ],
                              ),
                  ),
                          ),
              ),
            ],
          ),
               ),
       ),
    );
  }
}


class VegetableItem extends StatefulWidget {
  final String title;
  final String price;
  final String image;

  const VegetableItem({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<VegetableItem> createState() => _VegetableItemState();
}

class _VegetableItemState extends State<VegetableItem> {
    bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        children: [
          Image.asset(
            widget.image,
            width: 200,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25,),
                RichText(
                  text: TextSpan(
                    text: '', 
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: _getPriceDigits(widget.price),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, 
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: _getPriceNonDigits(widget.price),
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, 
            children: [
             SizedBox(
                        child: ElevatedButton.icon(
                           label: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey
                          ),
                          onPressed: () {
                            setState(() {
                            isFavorite = !isFavorite;
                          });
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Icon button pressed')),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
                SizedBox(
                        child: ElevatedButton.icon(
                          label: const Icon(Icons.shopping_cart) ,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                            backgroundColor: kMainColor,
                            foregroundColor: Colors.white
                          ),
                          onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Icon button pressed')),
                );
              },)
                      ),
            ],
          ),
        ],
      ),
    )]));
  }
}

String _getPriceDigits(String price) {
    return price.replaceAll(RegExp(r'[^\d.,]'), ''); // Removes non-digit chars
  }
 String _getPriceNonDigits(String price) {
    return price.replaceAll(RegExp(r'[\d.,]'), ''); // Removes digit chars
  }