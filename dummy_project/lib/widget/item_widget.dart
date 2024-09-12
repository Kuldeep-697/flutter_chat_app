import 'package:dummy_project/model/catalog.dart';
import 'package:flutter/material.dart';


class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
         
        },
        leading: Image.network(item.image), // placed left hand size 
        title: Text(item.name), 
        subtitle: Text(item.desc),
        trailing: Text( // placed right hand side 
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}