import 'package:flutter/material.dart';
import 'package:shopping_list/models/cat_model.dart';
import 'package:shopping_list/models/data_model.dart';
//import 'package:shopping_list/models/cat_model.dart';
import '../data/categories.dart';
import 'package:intl/intl.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _dateControl = TextEditingController();
  var _enteredName = '';
  var _enteredCategory = categories[Categories.food]!;
  var _enteredDate = '2000-01-01';

  @override
  void dispose() {
    _dateControl.dispose();
    super.dispose();
  }

  //save item logic

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    print(_enteredName);
    print(_enteredCategory);
    print(_enteredDate);

    Navigator.of(context).pop(DummyDataItem(
        category: _enteredCategory, name: _enteredName, date: _enteredDate));
  }

  void _resetForm() {
    _formKey.currentState!.reset();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _dateControl.text = DateFormat('yyyy-MM-dd')
            .format(pickedDate); // Set the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Item to purchase : '),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
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
                    return null;
                  },
                  onSaved: (value) {
                    _enteredName = value!;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        value: _enteredCategory,
                        items: [
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
                        ],
                        onChanged: (value) {
                          _enteredCategory = value!;
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                          controller: _dateControl,
                          decoration:
                              const InputDecoration(label: Text('date')),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please pick date ';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredDate = value!;
                          }),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      iconSize: 22,
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: _resetForm, child: const Text('Reset Form')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: _saveItem,
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
