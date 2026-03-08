import 'package:flutter/material.dart';

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
