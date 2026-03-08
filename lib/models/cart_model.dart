class CartItemModel {
  final String imagePath;
  final String title;
  final double price;
  final double rating;
  final String? discountBadge;
  int quantity;

  CartItemModel({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
    this.discountBadge,
    this.quantity = 1,
  });
}
