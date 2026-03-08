import 'package:flutter/material.dart';
import 'package:learn_flutter/models/recommended_food_model.dart';

class RecommendedFoodCard extends StatelessWidget {
  final RecommendedFoodModel food;
  final Color textLight;
  final Color textDark;

  const RecommendedFoodCard({
    Key? key,
    required this.food,
    required this.textLight,
    required this.textDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: food.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow:
            food.backgroundColor == Colors.white
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
                : [],
      ),
      child: Row(
        children: [
          // الصورة الدائرية
          ClipOval(
            child: Image.asset(
              food.imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // النصوص والتفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  food.subtitle,
                  style: TextStyle(fontSize: 12, color: textLight),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${food.price}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: textDark,
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
