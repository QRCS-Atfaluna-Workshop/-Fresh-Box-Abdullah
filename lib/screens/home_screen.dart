import 'package:flutter/material.dart';

// ==========================================
// 1. Models (هياكل البيانات)
// ==========================================

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

class RecommendedFoodModel {
  final String imagePath;
  final String title;
  final String subtitle;
  final double price;
  final Color backgroundColor;

  RecommendedFoodModel({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.backgroundColor,
  });
}

// ==========================================
// 2. Main Screen (الشاشة الرئيسية)
// ==========================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

// Grid View
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

/// بطاقة الأطعمة الموصى بها (القائمة / List)
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
