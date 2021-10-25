import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shipper/blocs/auth_bloc.dart';
import 'package:mobile_shipper/resources/home_page.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc authBloc = new AuthBloc();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back', style: TextStyle(
            color: Colors.blue
        ),),
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.blue),

        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(padding: const EdgeInsets.fromLTRB(90, 0, 50, 0),
                child: Image.asset('logo.png'),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 30, color: Colors.orange),
                  ),
                ),
                Text(
                  "Signup with in simple steps",
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                  child: StreamBuilder(
                      stream: authBloc.nameStream,
                      builder: (context, snapshot) => TextField(
                        controller: _nameController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            errorText:
                            snapshot.hasError ? snapshot.error : null,
                            labelText: "Name",
                            prefixIcon: Container(
                                width: 50, child: Icon(Icons.people)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                      )),
                ),

                StreamBuilder(
                    stream: authBloc.phoneStream,
                    builder: (context, snapshot) => TextField(
                      controller: _phoneController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Phone Number",
                          errorText:
                          snapshot.hasError ? snapshot.error : null,
                          prefixIcon: Container(
                              width: 50, child: Icon(Icons.phone)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)))),
                    )),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StreamBuilder(
                      stream: authBloc.emailStream,
                      builder: (context, snapshot) => TextField(
                        controller: _emailController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Email",
                            errorText:
                            snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                                width: 50, child: Icon(Icons.inbox)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                      )),
                ),

                StreamBuilder(
                    stream: authBloc.passStream,
                    builder: (context, snapshot) => TextField(
                      controller: _passController,
                      obscureText: true,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          errorText:
                          snapshot.hasError ? snapshot.error : null,
                          labelText: "Password",
                          prefixIcon: Container(
                              width: 50, child: Icon(Icons.lock)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffCED0D2), width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)))),
                    )),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: RaisedButton(
                      onPressed: _onSignUpClicked,
                      child: Text(
                        "Signup",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: RichText(
                    text: TextSpan(
                        text: "Already a User? ",
                        style: TextStyle(color: Color(0xff606470), fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Login now",
                              style: TextStyle(
                                  color: Color(0xff3277D8), fontSize: 16))
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  _onSignUpClicked() {
    var isValid = authBloc.isValid(_nameController.text, _emailController.text,
        _passController.text, _phoneController.text);
    if (isValid) {
      // create user
// authBloc.sigUp(_emailController.text, _passController.text, _phoneController.text, _nameController.text, (){
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomePage()));
};

    }
  }


