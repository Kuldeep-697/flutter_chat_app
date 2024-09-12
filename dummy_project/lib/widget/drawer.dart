import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: const [

        DrawerHeader(
          padding: EdgeInsets.zero,
          child: UserAccountsDrawerHeader(
            accountName: Text('Kuldeep prajapati'),
            accountEmail: Text('kuldeepiimt109@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/myImage.jpeg'),
            ),
          ),
        ),

        ListTile(
          leading: Icon(
            Icons.home,
            color:Colors.blue,
          ),
          title: Text(
            "Home",
            textScaleFactor: 1.2, 
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),

        ListTile(
          leading: Icon(
            Icons.account_circle,
            color:Colors.blue,
          ),
          title: Text(
            "Profile",
            textScaleFactor: 1.2, 
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),

        ListTile(
          leading: Icon(
            Icons.mail,
            color:Colors.blue,
          ),
          title: Text(
            "Email",
            textScaleFactor: 1.2, 
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        )

      ]),
    );
  }
}
