import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/components/star_rating.dart';
import 'package:kasidech_widgets_exercises/models/product_model.dart';
import 'package:kasidech_widgets_exercises/screens/product_detail.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.surfaceVariant,
        ),
        child: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,

              width: double.infinity / 2,
              decoration: BoxDecoration(
                // AI tell to use DecorationImage to make image fit cover
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                image: DecorationImage(
                  image: NetworkImage(productModel.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    "฿${productModel.price.toStringAsFixed(2)}",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: Colors.green),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [StarRating(starCount: productModel.rating)],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetail(productModel: productModel),
        ),
      ),
    );
  }
}
