import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/product_card.dart';
import 'package:kasidech_widgets_exercises/models/product_model.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),themeMode: ThemeMode.system,
      home: MainProductGallery(
        productModel: ProductModel(
          id: 1,
          name: 'Product 1',
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScQZc_3jlaTEKH8YQ4jOQ07cpT9WKyIfHHOw&s',
          price: 29.99,
          description: 'Description for Product 1',
          rating: 1.0,
        ),
      ),
    ),
  );
}


class MainProductGallery extends StatefulWidget {
  const MainProductGallery({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<MainProductGallery> createState() => _MainProductGalleryState();
}

class _MainProductGalleryState extends State<MainProductGallery> {
  List<ProductModel> productData = [
    ProductModel(
      id: 1,
      name: 'Headphones',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlOjVCEaDcGaweenBcYNSH2dVRy2Vf4KV_-Q&s',
      price: 1899.00,
      description: 'Good Headphones for listening music and gaming. High quality sound with noise cancellation feature. Comfortable to wear for long hours. Durable build and stylish design.',
      rating: 4.0,
    ),
    ProductModel(
      id: 2,
      name: 'Smartwatch',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsQiV6s17X8vmSl1dDEmjPAC4INQXyKA8i7w&s',
      price: 2899.00,
      description: 'Good Smartwatch for fitness tracking and notifications. Features heart rate monitoring, GPS, and customizable watch faces. Water-resistant and long battery life.',
      rating: 3.4,
    ),
    ProductModel(
      id: 3,
      name: 'Speaker',
      imageUrl: 'https://t4.ftcdn.net/jpg/02/59/61/41/360_F_259614174_XvtZcUkT3UFYmAsEWKH14R8pHFCjvp6J.jpg',
      price: 890.00,
      description: 'Good Speaker for high-quality audio playback. Portable design with Bluetooth connectivity. Powerful bass and clear treble for an immersive listening experience.',
      rating: 3.2,
    ),
    ProductModel(
      id: 4,
      name: 'Laptop Stand',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUmLmtiXEdWAseWJoq9OHeCztu2katxkZthQ&s',
      price: 590.00,
      description: 'Good Laptop Stand for ergonomic support and portability. Adjustable height and angle for comfortable typing and viewing.',
      rating: 4.8,
    ),
    ProductModel(
      id: 5,
      name: 'Keyboard',
      imageUrl: 'https://www.creativefabrica.com/wp-content/uploads/2021/12/27/Keyboard-Icon-Graphics-22400602-1-1-580x386.jpg',
      price: 1199.00,
      description: 'Good Keyboard for efficient typing and gaming. Mechanical keys with customizable RGB lighting. Durable build and comfortable wrist rest included.',
      rating: 3.0,
    ),
    ProductModel(
      id: 6,
      name: 'Mouse',
      imageUrl: 'https://www.creativefabrica.com/wp-content/uploads/2021/12/27/Keyboard-Icon-Graphics-22400602-1-1-580x386.jpg',
      price: 890.00,
      description: 'Good Mouse for precise cursor control and gaming. Ergonomic design and customizable buttons.',
      rating: 1.0,
    ),
    ProductModel(
      id: 7,
      name: 'Mouse pad',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAnspdLlS_oAEBfwRRvGFs6N-DGsX1sdEBmg&s',
      price: 780.00,
      description: 'Good Mouse pad for smooth cursor movement and comfortable grip.',
      rating: 1.0,
    ),
    ProductModel(
      id: 8,
      name: 'TV',
      imageUrl: 'https://png.pngtree.com/element_our/sm/20180516/sm_5afbfa01e121d.jpg',
      price: 1200.00,
      description: 'Good TV for watching movies and shows. High resolution display with vibrant colors and immersive sound.',
      rating: 1.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Product Gallery by 663040641-0')),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: productData.length,
        itemBuilder: (context,index) {
          return ProductCard(productModel: productData[index],);
        }
      ),
    );
  }
}
