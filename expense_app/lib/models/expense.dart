
import 'package:expense_tracker/models/category_enum.dart';

class Expense {
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category});
}
