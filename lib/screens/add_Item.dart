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
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Enter name of item'),
                ),
                validator: (value) {
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Center(
                child: SizedBox(
                  // width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //_saveExpense();
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => const HomeScreen(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color.fromARGB(255, 197, 168, 6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        )),
                    child: const Text(
                      'Save Expense',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
