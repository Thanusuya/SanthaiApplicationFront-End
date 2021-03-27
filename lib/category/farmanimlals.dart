import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:uyir_angadi/malvi.dart';

class Farmcategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'.tr()),
        shadowColor: Colors.greenAccent[100],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.green[700],
                  Colors.greenAccent,
                ]),
          ),
        ),
      ),
      backgroundColor: Colors.green[100],
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 2.0,
            runSpacing: 11.0,
            direction: Axis.horizontal,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    IconButton(
                        color: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blue,
                        splashRadius: 80,
                        icon: new Icon(MdiIcons.cow),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Cow";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "COW".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    IconButton(
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blue,
                        splashRadius: 80,
                        icon: new Icon(MdiIcons.sheep),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Sheep";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "SHEEP".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    IconButton(
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blue,
                        splashRadius: 80,
                        icon: Image.asset('assets/goaticon.jpg'),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Goat";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "GOAT".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    IconButton(
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blue,
                        splashRadius: 80,
                        icon: Image.asset('assets/hencock.png'),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Hen";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "HEN".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    IconButton(
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blue,
                        splashRadius: 80,
                        icon: new Icon(MdiIcons.pig),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Pig";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "PIG".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    IconButton(
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blue,
                        splashRadius: 80,
                        icon: new Icon(MdiIcons.duck),
                        iconSize: 130,
                        onPressed: () {
                          categoryname = "Duck";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "DUCK".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    IconButton(
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blue,
                        splashRadius: 80,
                        icon: Image.asset('assets/buffalo.jpg'),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Buffalo";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "BUFFALO".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
