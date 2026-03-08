import 'package:flutter/material.dart';
import 'package:learn_flutter/models/cart_model.dart';
import 'package:learn_flutter/widgets/cart_item_card.dart';
import 'package:learn_flutter/widgets/order_review_row.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Color bgColor = const Color(0xFFFAFAFA);
  final Color textDark = const Color(0xFF1E2029);
  final Color textLight = const Color(0xFF9CA3AF);
  final Color primaryOrange = const Color(0xFFF26C54);
  final Color greenStar = const Color(0xFF4CAF50);
  final Color containerGrey = const Color(0xFFF3F4F6);

  // List of Cart Model
  final List<CartItemModel> cartItems = [
    CartItemModel(
      imagePath: 'assets/images/Rectangle 29.png',
      title: 'Fresh Sandwitch',
      price: 10.0,
      rating: 4.5,
      discountBadge: '-30',
      quantity: 1,
    ),
    CartItemModel(
      imagePath: 'assets/images/Rectangle 29.png',
      title: 'Grilled Sandwitch',
      price: 10.0,
      rating: 4.5,
      discountBadge: '-60',
      quantity: 1,
    ),
  ];

  // functions for increament and decreament
  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

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
                      'Cart',
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

                // Cart Items List
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return CartItemCard(
                      item: cartItems[index],
                      primaryOrange: primaryOrange,
                      greenStar: greenStar,
                      textDark: textDark,
                      textLight: textLight,
                      onIncrement: () => _incrementQuantity(index),
                      onDecrement: () => _decrementQuantity(index),
                    );
                  },
                ),
                const SizedBox(height: 30),

                // Recipient Address Section
                Text(
                  'Recipient Address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: containerGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '9224 Jailyn Terrace, block 2, North\nMaryjaneton, Tanzania, 4387242',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Order Review Section
                Text(
                  'Order Review',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),
                const SizedBox(height: 16),

                // ملخص الطلب
                OrderReviewRow(
                  title: 'Full Vegie Salad (1 items)',
                  value: '\$10',
                  textLight: textLight,
                ),
                const SizedBox(height: 12),
                OrderReviewRow(
                  title: 'Toasted Sandwich (1 items)',
                  value: '\$10',
                  textLight: textLight,
                ),
                const SizedBox(height: 12),
                OrderReviewRow(
                  title: 'Delivery Fee',
                  value: '\$5',
                  textLight: textLight,
                ),
                const SizedBox(height: 12),
                OrderReviewRow(
                  title: 'Discount',
                  value: '-\$8',
                  textLight: textLight,
                ),
                const SizedBox(height: 16),

                // Total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textDark,
                      ),
                    ),
                    Text(
                      '\$17',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: textDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Payment Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryOrange,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Process to Payment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
