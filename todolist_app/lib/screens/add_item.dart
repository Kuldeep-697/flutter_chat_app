import 'package:flutter/material.dart';
import 'package:todolist_app/services/todo_services.dart';
import 'package:todolist_app/utils/snakebar_helper.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key, this.todo});
  final Map? todo;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descripitionController = TextEditingController();

  bool isEditPage = false;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    
    if (todo != null) {
      isEditPage = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descripitionController.text = description;
    }
  }

  Future<void> addTodoItem() async {
    final title = titleController.text;
    final descripition = descripitionController.text;

    final body = {
      "title": title,
      "description": descripition,
      "is_completed": false
    };

    final response = await TodoServices.addTodo(body);    

    Navigator.pop(context);

    if (response) {
      //setting empty string in order to reset the form
      titleController.text = '';
      descripitionController.text = '';
      showSuccessMessage(context , message : 'Creation Success');
    } 
    else {
      showErrorMessage(context , message : 'Creation Failed');
    }
  }

  Future<void> editTodo() async {
    final todo = widget.todo;
    
    if (todo == null) {
      print('You cannot call editTodo without todo data');
      return;
    }

    final id = todo['_id'];

    // get the data from the form
    final title = titleController.text;
    final descripition = descripitionController.text;

    final body = {
      "title": title,
      "description": descripition,
      "is_completed": false
    };

    // submit updated data to the server
    final isSuccess = await TodoServices.updateTodo(id, body);

    Navigator.pop(context);

    if (isSuccess) {
      showSuccessMessage(context , message : 'Updated Successfully');
    } 
    else {
      showErrorMessage(context , message : 'Updation Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditPage ? 'Edit Todo' : 'Add items'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title :'),
          ),

          const SizedBox(height: 6),

          TextField(
            controller: descripitionController,
            decoration: const InputDecoration(hintText: 'Descripition :'),
            keyboardType: TextInputType.multiline,
            minLines: 4,
            maxLines: 6,
          ),

          const SizedBox(height: 22),

          ElevatedButton(
            onPressed: isEditPage ? editTodo : addTodoItem,
            child: Text(isEditPage ? 'Update' : 'Submit')
          )
        ],
      ),
    );
  }
}
