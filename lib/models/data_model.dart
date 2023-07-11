//import 'package:flutter/material.dart';
import 'package:shopping_list/models/cat_model.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class DummyDataItem {
  final String id;
  final String name;
  //final double amount;
  final DateTime date;
  final Category category;

  DummyDataItem(
      {required this.category, required this.name, required this.date})
      : id = uuid.v4();
}
