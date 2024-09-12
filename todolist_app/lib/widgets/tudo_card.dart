import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.index,
    required this.item,
    required this.navigateToEdit,
    required this.deleteById
  });

  final int index;
  final Map item;
  final Function(Map item) navigateToEdit;
  final Function(String id) deleteById;

  @override
  Widget build(BuildContext context) {
    final todoId = item['_id'];

    return Card(
      shadowColor: Colors.white,
      
      child: ListTile(
        leading: CircleAvatar(child: Text('${index + 1}')),

        title: Text(item['title']),

        subtitle: Text(item['description']),
        
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') {
              navigateToEdit(item);
            } else if (value == 'delete') {
              deleteById(todoId);
            }
          },

          icon: const Icon(Icons.more_horiz_rounded),

          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 'edit',
                child: Text('Edit'),
              ),

              const PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ];
          }
        ),
      ),
    );
  }
}
