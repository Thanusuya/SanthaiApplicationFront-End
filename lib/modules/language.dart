import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uyir_angadi/modules/Login.dart';
import 'package:uyir_angadi/modules/Mainpage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List languageCode = ["en", "ta", "hi", "ml"];
List countryCode = ["US", "IN", "IN", "IN"];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        button("English", 0),
        SizedBox(
          width: 50,
        ),
        button("தமிழ்", 1),
        SizedBox(
          width: 10,
        ),
        button("हिन्दी", 2),
        SizedBox(
          width: 10,
        ),
        button("മലയാളം", 3),
      ],
    );
  }

  Widget text(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
      ),
    );
  }

  Widget button(String text, int i) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.green[800]),
      ),
      color: Colors.green[200],
      onPressed: () {
        setState(() {
          EasyLocalization.of(context).locale =
              Locale(languageCode[i], countryCode[i]);
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Mainpage();
        }));
      },
    );
  }
}
