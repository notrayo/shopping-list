import '../models/cat_model.dart';

import '../models/data_model.dart';
import './categories.dart';

final dummyData = [
  DummyDataItem(
      category: categories[Categories.food]!,
      name: 'Unga ya ugali',
      date: DateTime.now()),
  DummyDataItem(
      category: categories[Categories.clothes]!,
      name: 'Official Shoes',
      date: DateTime(2023, 7, 12)),
  DummyDataItem(
      category: categories[Categories.techApparatus]!,
      name: 'Arduino Kit',
      date: DateTime.now()),
  DummyDataItem(
      category: categories[Categories.furniture]!,
      name: 'Dining Table Repair',
      date: DateTime.now()),
];
