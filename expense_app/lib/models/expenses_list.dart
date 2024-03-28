import 'package:expense_tracker/models/category_enum.dart';
import 'package:expense_tracker/models/expense.dart';

final List<Expense> expensesList = [
  Expense(
      title: "Flutter course",
      amount: 19.99,
      date: DateTime(2024, 3, 16),
      category: ExpenseCategory.work),
  Expense(
      title: "Travel to Paris",
      amount: 1200.00,
      date: DateTime(2024, 3, 13),
      category: ExpenseCategory.work),
  Expense(
      title: "Cinema",
      amount: 10.25,
      date: DateTime(2024, 3, 14),
      category: ExpenseCategory.work)
];
