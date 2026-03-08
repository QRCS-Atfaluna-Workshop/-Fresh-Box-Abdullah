class PopularFoodModel {
  final String imagePath;
  final String title;
  final String time;
  final double rating;
  final String? discountBadge;

  PopularFoodModel({
    required this.imagePath,
    required this.title,
    required this.time,
    required this.rating,
    this.discountBadge,
  });
}
