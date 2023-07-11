import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Items To Buy ...'),
        ),
        body: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: ((context, index) => ListTile(
                  title: Text(dummyData[index].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: dummyData[index].category.color,
                  ),
                ))));
  }
}
