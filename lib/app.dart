import 'package:flutter/material.dart';
import 'package:mobile_shipper/resources/login_page.dart';
class shipper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}