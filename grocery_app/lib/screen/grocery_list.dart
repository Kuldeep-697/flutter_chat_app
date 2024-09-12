import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:grocery_app/data/categories_data.dart';
import 'package:grocery_app/models/grocery_item_model.dart';
import 'package:grocery_app/widget/new_item.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryItemState();
}

class _GroceryItemState extends State<GroceryListScreen> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String _errorMessage = '';

  //Without firebase
  /*
  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem == null) {
      return;
    } else {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }
  */

  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  void _loadItem() async {
    final url = Uri.https(
        'shopping-app-9e80b-default-rtdb.firebaseio.com', 'shopping-list.json');

    try {
      final response = await http.get(url);

      if (response.statusCode >= 400) {
        setState(() {
          _errorMessage = 'Failed to load data: ${response.reasonPhrase}';
        });
        return;
      }

      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);

      final List<GroceryItem> loadedItems = [];

      for (final item in listData.entries) {
        final category = categories.entries
            .firstWhere(
                (catItem) => catItem.value.title == item.value['category'])
            .value;

        loadedItems.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category,
          ),
        );
      }

      setState(() {
        _groceryItems = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _errorMessage = 'An error occurred: $error';
      });
    }
  }

  //With firebase
  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void _removeItem(GroceryItem item) {
    final url = Uri.https('shopping-app-9e80b-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');

    http.delete(url);

    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text('Nothing here try adding some items'));

    if (_isLoading) {
      mainContent = const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != '') {
      mainContent = Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(child: Text(_errorMessage, textAlign: TextAlign.center)),
      );
    }

    if (_groceryItems.isNotEmpty) {
      mainContent = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(_groceryItems[index].id),
                onDismissed: (direction) {
                  _removeItem(_groceryItems[index]);
                },
                child: ListTile(
                  title: Text(_groceryItems[index].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: _groceryItems[index].category.color,
                  ),
                  trailing: Text(_groceryItems[index].quantity.toString()),
                ),
              ));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Grocery'),
          actions: [
            IconButton(
                onPressed: () {
                  _addItem();
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: mainContent);
  }
}
