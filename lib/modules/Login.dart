import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uyir_angadi/modules/Mainpage.dart';
import 'package:uyir_angadi/modules/Register.dart';
import 'package:http/http.dart' as http;
import 'package:uyir_angadi/modules/logindata.dart';
import 'package:uyir_angadi/modules/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

var callnumber;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  void showToast() {
    Fluttertoast.showToast(
        msg: 'Phonenumber and password not found',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }

  Future<logindata> save() async {
    var url = Uri.parse("http://192.168.43.69:8081/Login");
    var res = await http.post(url, headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8'
    }, body: <String, String>{
      'phonenumber': user.phonenumber,
      'password': user.password,
    });
    callnumber = user.phonenumber;
    if (res.statusCode == 200) {
      var userResponse = logindata.fromJson(jsonDecode(res.body));
      print(userResponse.status);

      if (userResponse.status == true) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Mainpage();
        }));
      } else if (userResponse.status == false) {
        //showAlertDialog(context);

        showToast();
      }
    }
  }

  User user = User(
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    'Sign in'.tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.green[800]),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      maxLength: 10,
                      controller: TextEditingController(text: user.phonenumber),
                      onChanged: (value) {
                        user.phonenumber = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter something';
                        } else if (RegExp(
                                r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return 'Enter valid phonenumber';
                        }
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                          hintText: 'Enter Mobilenumber',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.green)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.password),
                      onChanged: (value) {
                        user.password = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter something';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.green,
                          ),
                          hintText: 'Enter Password',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.green)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                    child: Container(
                      height: 50,
                      width: 400,
                      child: FlatButton(
                          color: Colors.green[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              save();
                            } else {
                              print("not ok");
                            }
                          },
                          child: Text(
                            "Signin",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(95, 20, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            "Not have Account ? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
