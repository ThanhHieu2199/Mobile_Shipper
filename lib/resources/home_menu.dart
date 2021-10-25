import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.people,color: Colors.blue),
          title: Text(
            "Thông tin",
            style: TextStyle(fontSize: 18, color: Colors.deepOrange),
          ),
        ),
        ListTile(
          leading: Icon(Icons.support, color: Colors.blue),
          title: Text(
            "Dịch vụ",
            style: TextStyle(fontSize: 18, color: Colors.deepOrange),
          ),
        ),
        ListTile(
          leading: Icon(Icons.stream,color: Colors.blue),
          title: Text(
            "Ưu đãi",
            style: TextStyle(fontSize: 18, color: Colors.deepOrange),
          ),
        ),
        ListTile(
          leading: Icon(Icons.add_alert_rounded,color: Colors.blue),
          title: Text(
            "Thông báo",
            style: TextStyle(fontSize: 18, color: Colors.deepOrange),
          ),
        ),
        ListTile(
          leading: Icon(Icons.phone,color: Colors.blue),
          title: Text(
            "Trợ giúp & Hỗ trợ",
            style: TextStyle(fontSize: 18, color: Colors.deepOrange),
          ),
        ),
        ListTile(
          leading: Icon(Icons.logout,color: Colors.blue),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 18, color: Colors.deepOrange),
          ),
        )
      ],
    );
  }
}