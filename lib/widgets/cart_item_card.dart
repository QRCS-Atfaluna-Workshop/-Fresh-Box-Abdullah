import 'package:flutter/material.dart';
import 'package:learn_flutter/models/cart_model.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel item;
  final Color primaryOrange;
  final Color greenStar;
  final Color textDark;
  final Color textLight;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemCard({
    Key? key,
    required this.item,
    required this.primaryOrange,
    required this.greenStar,
    required this.textDark,
    required this.textLight,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
      child: Row(
        children: [
          // صورة المنتج مع شارة الخصم
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item.imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                if (item.discountBadge != null)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
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
                            size: 8,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.discountBadge!,
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
          const SizedBox(width: 16),
          // تفاصيل المنتج وأزرار الكمية
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${item.price.toInt()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryOrange,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.title,
                  style: TextStyle(fontSize: 14, color: textDark),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // التقييم
                    Row(
                      children: [
                        Icon(Icons.star, color: greenStar, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          item.rating.toString(),
                          style: TextStyle(
                            color: greenStar,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // أزرار التحكم بالكمية
                    Row(
                      children: [
                        _buildQuantityButton(Icons.remove, onDecrement),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            item.quantity.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: textDark,
                            ),
                          ),
                        ),
                        _buildQuantityButton(Icons.add, onIncrement),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // تصميم زر زيادة/نقصان الكمية
  Widget _buildQuantityButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFE5E7EB),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 16, color: Colors.black87),
      ),
    );
  }
}
