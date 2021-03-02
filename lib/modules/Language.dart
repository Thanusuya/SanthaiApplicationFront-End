import 'package:flutter/material.dart';
import 'package:uyir_angadi/classes/languagetype.dart';
import 'package:uyir_angadi/localization/language_constants.dart';
import 'package:uyir_angadi/main.dart';

import 'Mainpage.dart';

class languages extends StatefulWidget {
  @override
  _languagesState createState() => _languagesState();
}

class _languagesState extends State<languages> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: <Color>[
            Colors.white,
            Colors.white,
            Colors.deepPurple[50],
            Colors.deepPurple[100],
            Colors.deepPurple[200],
          ]),
        ),
        child: Center(
          child: Container(
            height: 200,
            width: 300,
            child: Container(
              width: 500,
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'CHOOSE YOUR LANGUAGE',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        shadows: [
                          Shadow(
                              color: Colors.blueAccent,
                              offset: Offset(2, 1),
                              blurRadius: 10)
                        ]),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                      child: DropdownButton<Language>(
                    iconSize: 30,
                    hint: Text("change language"),
                    onChanged: (Language language) {
                      _changeLanguage(language);
                    },
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Mainpage();
                      }));
                    },
                    items: Language.languageList()
                        .map<DropdownMenuItem<Language>>(
                          (e) => DropdownMenuItem<Language>(
                            value: e,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  e.flag,
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(e.name)
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
