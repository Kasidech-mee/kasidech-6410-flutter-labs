import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/star_rating.dart';
import 'package:kasidech_widgets_exercises/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(productModel.name))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(// AI tell to use DecorationImage to make image fit cover
              image: DecorationImage(
                image: NetworkImage(productModel.imageUrl),
                fit: BoxFit.cover,
                ),
            ),
          ),
          Text(
            productModel.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "฿${productModel.price.toStringAsFixed(2)}",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.green),
          ),
          Row(
            children: [
              StarRating(starCount: productModel.rating),
              Text(
                " ${productModel.rating.toStringAsFixed(1)} / 5.0",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: Colors.grey),
              ),
            ],
          ),
          ColoredBox(color: Colors.grey.shade400, child: SizedBox(height: 1, width: double.infinity)),
          Text(
            "Description",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            productModel.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${productModel.name} added to cart!"),
              ),
            );
          },
            child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.greenAccent,
            ),
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart),
                Text(
                  "Add to Cart",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
