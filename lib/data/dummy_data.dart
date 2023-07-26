import '../models/cat_model.dart';

import '../models/data_model.dart';
import './categories.dart';

final dummyData = [
  DummyDataItem(
      category: categories[Categories.food]!,
      name: 'Unga ya ugali',
      date: '2023-06-09'),
  DummyDataItem(
      category: categories[Categories.clothes]!,
      name: 'Official Shoes',
      date: '2023-01-01'),
  DummyDataItem(
      category: categories[Categories.techApparatus]!,
      name: 'Arduino Kit',
      date: '2023-07-01'),
  DummyDataItem(
      category: categories[Categories.furniture]!,
      name: 'Dining Table Repair',
      date: '2021-01-10'),
];
