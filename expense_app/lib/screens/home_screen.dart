import 'package:expense_tracker/models/category_enum.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expenses_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController prisecontroller = TextEditingController();
  late DateTime? selectedDate;

  void addExpenseToList() {
    setState(() {
      if (selectedDate != null) {
        expensesList.add(Expense(
          title: titlecontroller.text,
          amount: double.parse(prisecontroller.text),
          date: selectedDate!,
          category: ExpenseCategory.cinema,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Expense tracker',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                            controller: titlecontroller,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              border: InputBorder.none,
                              labelText: 'Name'
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: TextField(
                            controller: prisecontroller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              border: InputBorder.none,
                              labelText: 'Price',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        IconButton(
                          onPressed: () async {
                            final pickDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2017, 9, 7),
                              lastDate: DateTime(2101, 12, 31),
                            );
                            setState(() {
                              selectedDate = pickDate;
                            });
                          },
                          icon: const Icon(Icons.calendar_month),
                        ),
                        ElevatedButton(
                          onPressed: addExpenseToList,
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.pink.shade300,
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              height: 100,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        expensesList[index].title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            expensesList[index].amount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            expensesList[index]
                                .date
                                .toString()
                                .substring(0, 10),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: expensesList.length,
      ),
    );
  }
}
