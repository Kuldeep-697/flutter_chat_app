import 'package:api_integration/models/user.dart';
import 'package:api_integration/services/user_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [ ];

  @override
  void initState() {
    super.initState();
    fetchUserdata();
  }

  Future<void> fetchUserdata() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rest Api Call')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final username = user.fullName;
          final userEmail = user.email;
          final imageUrl = user.picture.thumbnail;
          return ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(imageUrl),
            ),
            title: Text(username),
            subtitle: Text(userEmail),
          );
        },
      ),
    );
  }
}
