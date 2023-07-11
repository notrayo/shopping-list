import 'package:flutter/material.dart';
import 'package:shopping_list/models/data_model.dart';
import '../data/dummy_data.dart';
import './add_Item.dart';

import 'dart:ui';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showItemDetails(BuildContext context, DummyDataItem item) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Customize the appearance of the modal sheet as needed
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Category: ${item.category.title}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Date: ${item.date.toString()}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Items To Buy ...'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddItem(),
                      ));
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                ))
          ],
        ),
        body: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: ((context, index) => InkWell(
                  onTap: () {
                    _showItemDetails(context, dummyData[index]);
                  },
                  child: ListTile(
                    title: Text(dummyData[index].name),
                    leading: Container(
                      width: 24,
                      height: 24,
                      color: dummyData[index].category.color,
                    ),
                  ),
                ))));
  }
}
