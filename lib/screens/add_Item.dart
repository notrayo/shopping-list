import 'package:flutter/material.dart';
//import 'package:shopping_list/models/cat_model.dart';
import '../data/categories.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Enter name of item'),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'please re-enter your item name';
                    }
                    return 'test ...';
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(category.value.title)
                                ],
                              ))
                      ], onChanged: (value) {}),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            label: Text('date and time ...')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter date';
                          }
                          return 'test ...';
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {}, child: const Text('Reset Form')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 240, 208, 24),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          )),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
