import 'package:flutter/material.dart';
import 'package:learn_flutter/models/popular_food_model.dart';

class PopularFoodCard extends StatelessWidget {
  final PopularFoodModel food;
  final Color greenStar;
  final Color textLight;

  const PopularFoodCard({
    Key? key,
    required this.food,
    required this.greenStar,
    required this.textLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة الطعام مع إشارة
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    food.imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (food.discountBadge != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF76B59),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.local_offer,
                            color: Colors.white,
                            size: 10,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            food.discountBadge!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // اسم الطعام
          Text(
            food.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E2029),
            ),
          ),
          const SizedBox(height: 8),
          // تفاصيل الوقت
          Row(
            children: [
              Icon(Icons.access_time, color: textLight, size: 14),
              const SizedBox(width: 4),
              Text(food.time, style: TextStyle(color: textLight, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          // التقييم وزر المفضلة
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: greenStar, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    food.rating.toString(),
                    style: TextStyle(
                      color: greenStar,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Icon(Icons.favorite, color: Colors.grey.shade300, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
