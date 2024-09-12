import 'package:flutter/material.dart';
import 'package:expanse_tracker/model/expanse.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expanse expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsValid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsValid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Make sure a valid title, amount, date and category was entered'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(Expanse(
      title: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
    ));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Widget inputTitle() {
    return Expanded(
      child: TextField(
        controller: _titleController,
        maxLength: 50,
        decoration: const InputDecoration(
          label: Text('Title :'),
        ),
      ),
    );
  }

  Widget inputAmount() {
    return Expanded(
      child: TextField(
        controller: _amountController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          prefixText: '\$ ',
          label: Text('Amount :'),
        ),
      ),
    );
  }

  Widget categoryDropdown() {
    return DropdownButton(
      value: _selectedCategory,
      items: Category.values
          .map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(
                category.name.toUpperCase(),
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value == null) {
          return;
        }
        setState(() {
          _selectedCategory = value;
        });
      },
    );
  }

  Widget selectDateField() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_selectedDate == null
              ? 'No date selected'
              : formatter.format(_selectedDate!)),
          IconButton(
            onPressed: _presentDatePicker,
            icon: const Icon(
              Icons.calendar_month,
            ),
          ),
        ],
      ),
    );
  }

  Widget cancelButton() {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Cancel'),
    );
  }

  Widget saveExpenseButton() {
    return ElevatedButton(
      onPressed: _submitExpenseData,
      child: const Text('Save Expense'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inputTitle(),
                      const SizedBox(width: 24),
                      inputAmount(),
                    ],
                  )
                else
                  Row(
                    children: [
                      inputTitle(),
                    ],
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      categoryDropdown(),
                      const SizedBox(width: 24),
                      selectDateField(),
                    ],
                  )
                else
                  Row(
                    children: [
                      inputAmount(),
                      const SizedBox(width: 16),
                      selectDateField(),
                    ],
                  ),
                const SizedBox(height: 16),
                if (width >= 600)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      cancelButton(),
                      saveExpenseButton(),
                    ],
                  )
                else
                  Row(
                    children: [
                      categoryDropdown(),
                      const Spacer(),
                      cancelButton(),
                      saveExpenseButton(),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
