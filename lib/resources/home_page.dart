import 'package:flutter/material.dart';
import 'package:mobile_shipper/resources/home_menu.dart';
import 'package:mobile_shipper/resources/location.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[

            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.orangeAccent,

                    title: Text(

                      "Shipper App",
                      style: TextStyle(color: Colors.white,),

                    ),

                    leading: FlatButton(
                        onPressed: () {
                          print("click menu");
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Icon(Icons.menu,color: Colors.blue, size: 40)),
                    actions: <Widget>[Image.asset("logo.png")],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: location(),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );
  }}