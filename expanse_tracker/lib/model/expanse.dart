import 'package:flutter/material.dart';
//import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

//const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expanse {
  //final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expanse(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category});

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expanse> expenses;

  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expanse> allExpense, this.category)
      : expenses = allExpense
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
