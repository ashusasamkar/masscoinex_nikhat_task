import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'file:///E:/Ashwini_Work/Flutter_Workspace/masscoinex_nikhat_task/masscoinex_nikhat_task/lib/ui/dashboard.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    const RoundedRectangleBorder roundedRectangleBorder =
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)));
    return Scaffold(
      appBar: AppBar(
        shape: roundedRectangleBorder,
        title: Text(
          'Masscoinex',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: myDrawer(),
      body: Center(
        child: Text(
          'Welcome to Masscoinex !',
          style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget myDrawer() {
    List<int> imgBytes = model.image.readAsBytesSync();
    String BASE64_STRING = base64Encode(imgBytes);
    Uint8List bytes = base64Decode(BASE64_STRING);
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('ashvinee@masscoinex.com'),
            accountName: Text('Ashvinee'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: MemoryImage(bytes),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Check Balance'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Complete KYC'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Feedback'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}
