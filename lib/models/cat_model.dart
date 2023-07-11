import 'package:flutter/material.dart';

enum Categories { food, clothes, techApparatus, furniture }

class Category {
  final String title;
  final Color color;

  const Category({required this.title, required this.color});
}
