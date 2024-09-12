import 'package:dummy_project/model/catalog.dart';
import 'package:dummy_project/widget/drawer.dart';
import 'package:dummy_project/widget/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');

    final decodedData = jsonDecode(catalogJson);

    var productsData = decodedData["products"];

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Catalog App"),
    ),
    body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          },
        )),
    drawer: const MyDrawer(),
  );
}
}

























