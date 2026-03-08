import 'package:flutter/material.dart';
import 'package:learn_flutter/models/popular_food_model.dart';
import 'package:learn_flutter/models/recommended_food_model.dart';
import 'package:learn_flutter/widgets/popular_food_card.dart';
import 'package:learn_flutter/widgets/recommended_food_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // colors
  final Color bgColor = const Color(0xFFFAFAFA);
  final Color textDark = const Color(0xFF1E2029);
  final Color textLight = const Color(0xFF9CA3AF);
  final Color greenStar = const Color(0xFF4CAF50);

  // List of PopularFoodModel
  final List<PopularFoodModel> popularFoods = [
    PopularFoodModel(
      imagePath: 'assets/images/Rectangle 29.png',
      title: 'Coco berry Salad',
      time: '30 Min',
      rating: 4.5,
      discountBadge: '-50',
    ),
    PopularFoodModel(
      imagePath: 'assets/images/Rectangle 29.png',
      title: 'Marinated Grilled Burger',
      time: '30 Min',
      rating: 4.5,
    ),
    PopularFoodModel(
      imagePath: 'assets/images/Rectangle 29.png',
      title: 'Fresh Salad with Letuce',
      time: '30 Min',
      rating: 4.5,
    ),
    PopularFoodModel(
      imagePath: 'assets/images/Rectangle 29.png',
      title: 'Fresh Salad Green berry',
      time: '30 Min',
      rating: 4.5,
      discountBadge: '-50',
    ),
  ];

  // List of RecommendedFoodModel
  final List<RecommendedFoodModel> recommendedFoods = [
    RecommendedFoodModel(
      imagePath: 'assets/images/Salad.png',
      title: 'Fresh Veg-Salad',
      subtitle: 'Fresh Salad with Green berry',
      price: 8.99,
      backgroundColor: const Color(0xFFFDECEB),
    ),
    RecommendedFoodModel(
      imagePath: 'assets/images/Salad.png',
      title: 'Veg Biryani',
      subtitle: 'Fresh Salad with Green berry',
      price: 12.99,
      backgroundColor: Colors.white,
    ),
    RecommendedFoodModel(
      imagePath: 'assets/images/Salad.png',
      title: 'Fresh Veg-Salad',
      subtitle: 'Fresh Salad with Green berry',
      price: 8.99,
      backgroundColor: const Color(0xFFEFEFEF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom App Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconButton(Icons.arrow_back_ios_new_rounded),
                    Text(
                      'Popular Food',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textDark,
                      ),
                    ),
                    _buildIconButton(Icons.search_rounded),
                  ],
                ),
                const SizedBox(height: 24),

                // Popular Food Grid
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: popularFoods.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    return PopularFoodCard(
                      food: popularFoods[index],
                      greenStar: greenStar,
                      textLight: textLight,
                    );
                  },
                ),
                const SizedBox(height: 30),

                // Recommended Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textDark,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: textDark,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'See All',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Recommended List
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedFoods.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return RecommendedFoodCard(
                      food: recommendedFoods[index],
                      textLight: textLight,
                      textDark: textDark,
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // create IconButton
  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: textDark, size: 20),
    );
  }
}
