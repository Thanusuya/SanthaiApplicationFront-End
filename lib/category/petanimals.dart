import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:uyir_angadi/malvi.dart';
import 'package:easy_localization/easy_localization.dart';

class MyPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "PetAnimals",
      theme: new ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: PetCategory(),
    );
  }
}

class PetCategory extends StatelessWidget {
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
                        icon: new Icon(MdiIcons.dog),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Dog";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "DOG".tr(),
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
                        icon: new Icon(MdiIcons.cat),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Cat";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "CAT".tr(),
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
                        icon: new Icon(MdiIcons.bird),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Bird";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "BIRD".tr(),
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
                        icon: new Icon(MdiIcons.fish),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Fish";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "FISH".tr(),
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
                        icon: new Icon(MdiIcons.horse),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Horse";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "HORSE".tr(),
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
                        icon: Image.asset('assets/mice.png'),
                        iconSize: 130,
                        onPressed: () {
                          categoryname = "Rat";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "RAT".tr(),
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
                        icon: new Icon(MdiIcons.rabbit),
                        iconSize: 120,
                        onPressed: () {
                          categoryname = "Rabbit";
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyHomePagevariety();
                          }));
                        }),
                    Text(
                      "RABBIT".tr(),
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
