import 'package:expanse_tracker/widgets/chart/chart.dart';
import 'package:expanse_tracker/widgets/expanses_list.dart';
import 'package:expanse_tracker/model/expanse.dart';
import 'package:expanse_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<Expanses> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  final List<Expanse> _registeredExpanses = [
    Expanse(
        title: 'Flutter course',
        amount: 2000,
        date: DateTime.now(),
        category: Category.work),
    Expanse(
        title: 'Cinema',
        amount: 350,
        date: DateTime.now(),
        category: Category.leisure),
        
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expanse expanse) {
    setState(() {
      _registeredExpanses.add(expanse);
    });
  }

  void _removeExpense(Expanse expanse) {
    final expenseIndex = _registeredExpanses.indexOf(expanse);
    setState(() {
      _registeredExpanses.remove(expanse);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text(
          'Expense deleted',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              _registeredExpanses.insert(expenseIndex, expanse);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expense, Try adding some'),
    );

    if (_registeredExpanses.isNotEmpty) {
      mainContent = ExpansesList(
        expanses: _registeredExpanses,
        onRemoveExpanse: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Expance Tracker',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                const SizedBox(height: 10),
                Chart(expenses: _registeredExpanses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Chart(expenses: _registeredExpanses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
