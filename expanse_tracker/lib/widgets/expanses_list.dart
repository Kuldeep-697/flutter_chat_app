import 'package:expanse_tracker/model/expanse.dart';
import 'package:flutter/material.dart';

class ExpansesItem extends StatelessWidget {
  const ExpansesItem({super.key, required this.expanse});
  final Expanse expanse;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(expanse.title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 51, 32, 96),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(expanse.amount.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expanse.category]),
                    const SizedBox(width: 8),
                    Text(
                      expanse.formattedDate,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            )
          ])),
    );
  }
}

class ExpansesList extends StatelessWidget {
  const ExpansesList(
      {super.key, required this.expanses, required this.onRemoveExpanse});
  final List<Expanse> expanses;
  final void Function(Expanse expanse) onRemoveExpanse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expanses.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(expanses[index]),
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            ),
            onDismissed: (direction) {
              onRemoveExpanse(expanses[index]);
            },
            child: ExpansesItem(expanse: expanses[index])));
  }
}
