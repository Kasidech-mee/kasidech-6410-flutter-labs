class ProductModel {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final double rating;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.rating,
  });
}