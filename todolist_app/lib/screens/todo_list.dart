import 'package:flutter/material.dart';
import 'package:todolist_app/screens/add_item.dart';
import 'package:todolist_app/services/todo_services.dart';
import 'package:todolist_app/utils/snakebar_helper.dart';
import 'package:todolist_app/widgets/tudo_card.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAllTodoItems();
  }

  void _navigateToaddTodo() {
    final route = MaterialPageRoute(builder: (context) => const AddItem());
    Navigator.push(context, route);
  }

  Future<void> getAllTodoItems() async {
    final result = await TodoServices.getAllTodoItems();

    if (result != null) {
      setState(() {
        items = result;
      });
    } 
    else {
      showErrorMessage(context, message: 'Error while fetching data');
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> navigateToEditTodo(Map item) async {
    final route = MaterialPageRoute(builder: (context) => AddItem(todo: item));
    await Navigator.push(context, route);
  }

  Future<void> deleteTodoById(String id) async {
    final isSuccess = await TodoServices.deleteTodoById(id);

    if (isSuccess) {
      final itemAfterDelete =
          items.where((element) => element['_id'] != id).toList();

      setState(() {
        items = itemAfterDelete;
      });
    } 
    else {
      showErrorMessage(context, message: 'Error while Deleting data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: RefreshIndicator(
          onRefresh: getAllTodoItems,
          child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return TodoCard(
                    index : index,
                    item : item,
                    navigateToEdit: navigateToEditTodo,
                    deleteById : deleteTodoById
                  );
                }
              ),
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: FloatingActionButton.extended(
            extendedPadding: const EdgeInsets.symmetric(horizontal: 18),
            onPressed: _navigateToaddTodo,
            label: const Text('Add item'),
          ),
        ),
      ),
    );
  }
}
