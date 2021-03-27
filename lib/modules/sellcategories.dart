import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:uyir_angadi/Form.dart';
import 'package:uyir_angadi/category/farmanimlals.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:uyir_angadi/category/petanimals.dart';

import 'package:uyir_angadi/modules/language.dart';

class sellcategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 160,
            ),
            ImageButton(
              children: <Widget>[],
              height: 140,
              width: 140,
              pressedImage: Image.asset(
                "assets/farm_animals.jpeg",
              ),
              unpressedImage: Image.asset("assets/farm_animals.jpg"),
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.ease);
                          return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return FormData();
                        }));
              },
            ),
            Text(
              "FARM ANIMALS".tr(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
            ImageButton(
              children: <Widget>[],
              height: 140,
              width: 140,
              pressedImage: Image.asset(
                "assets/pet_animals.jpg",
              ),
              unpressedImage: Image.asset("assets/pet_animals.jpg"),
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.ease);
                          return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return FormData();
                        }));
              },
            ),
            Text(
              "PET ANIMALS".tr(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
