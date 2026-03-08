import 'package:flutter/material.dart';

class OrderReviewRow extends StatelessWidget {
  final String title;
  final String value;
  final Color textLight;

  const OrderReviewRow({
    Key? key,
    required this.title,
    required this.value,
    required this.textLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 14, color: textLight)),
        Text(value, style: TextStyle(fontSize: 14, color: textLight)),
      ],
    );
  }
}
