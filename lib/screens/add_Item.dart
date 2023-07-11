import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item to purchase : '),
      ),
      body: const Center(
        child: Text('form to appear'),
      ),
    );
  }
}
