import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uyir_angadi/category/farmanimlals.dart';
import 'package:uyir_angadi/category/petanimals.dart';

import 'package:uyir_angadi/modules/sellcategories.dart';
import 'package:uyir_angadi/profile.dart';
import 'package:uyir_angadi/settings.dart';

var baseUrl = "http://192.168.43.69:8081/";

String mFormatBaseUrl(String url) {
  return baseUrl + url;
}

class Mainpage extends StatefulWidget {
  MainPage createState() => MainPage();
}

class MainPage extends State<Mainpage> {
  Future<List<Result>> _getUusers() async {
    var data = await http.get(Uri.http("192.168.43.69:8081", "productlisting"));
    // var data =
    //   await http.get(Uri.http("192.168.43.69:8081", "productfilter/Husky"));
    var jsonData = json.decode(data.body);
    List<Result> users = [];

    var mResult = jsonData["result"];
    for (var u in mResult) {
      Result user = Result(
          u["category"],
          u["image"],
          u["variety"],
          u["price"],
          u["age"],
          u["colour"],
          u["description"],
          u["height"],
          u["weight"],
          u["location"],
          u["gender"],
          u,
          json);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page'.tr(),
        ),
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
      backgroundColor: Colors.green[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              width: 350.0,
              child: Center(
                child: SizedBox(
                  height: 200.0,
                  width: 350.0,
                  child: Carousel(
                    autoplay: true,
                    autoplayDuration: Duration(seconds: 3),
                    animationCurve: Curves.fastOutSlowIn,
                    dotSize: 1.0,
                    dotIncreasedColor: Color(0xFFFF335C),
                    dotBgColor: Colors.transparent,
                    dotVerticalPadding: 10.0,
                    showIndicator: true,
                    indicatorBgPadding: 7.0,
                    images: [
                      AssetImage("assets/dog.jpg"),
                      AssetImage("assets/cat.jpg"),
                      AssetImage("assets/hen.jpg"),
                      AssetImage("assets/cow.jpg"),
                      AssetImage("assets/sheep.jpg"),
                      AssetImage("assets/goat.jpg"),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "   " + "CATEGORIES".tr(),
                  style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.green,
                      height: 145,
                      width: 145,
                      child: Center(
                        child: ImageButton(
                          children: <Widget>[],
                          height: 140,
                          width: 140,
                          pressedImage: Image.asset(
                            "assets/farm_animals.jpg",
                          ),
                          unpressedImage:
                              Image.asset("assets/farm_animals.jpg"),
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
                                          parent: animation,
                                          curve: Curves.ease);
                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secAnimation) {
                                      return Farmcategory();
                                    }));
                          },
                        ),
                      ),
                    ),
                    Text(
                      "FARM ANIMALS".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Container(
                      height: 145,
                      width: 145,
                      color: Colors.green,
                      child: Center(
                        child: ImageButton(
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
                                          parent: animation,
                                          curve: Curves.ease);
                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secAnimation) {
                                      return MyPet();
                                    }));
                          },
                        ),
                      ),
                    ),
                    Text(
                      "PET ANIMALS".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "    " + "RECENT POSTS".tr(),
                  style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                child: FutureBuilder(
                  future: _getUusers(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text('Loading'.tr()),
                        ),
                      );
                    } else {
                      return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: GridTile(
                                    child: GestureDetector(
                                      child: Center(
                                        child: Container(
                                          height: 100,
                                          child: Image.network(
                                            mFormatBaseUrl(
                                                snapshot.data[index].image),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(
                                                        snapshot.data[index])));
                                      },
                                    ),
                                    footer: Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.only(top: 3),
                                        height: 60,
                                        child: Column(
                                          children: [
                                            Text(
                                              snapshot.data[index].variety,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "₹" + snapshot.data[index].price,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "Location" +
                                                  "  :" +
                                                  snapshot.data[index].location,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ))));
                          });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return profile();
                  }));
                },
                child: Icon(
                  Icons.person,
                  size: 30,
                )),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return sellcategories();
                  }));
                },
                child: Icon(
                  Icons.add_business,
                  size: 30,
                )),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingsPage();
                  }));
                },
                child: Icon(
                  Icons.settings,
                  size: 30,
                )),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  Result result;
  DetailPage(this.result);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: <Widget>[
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(baseUrl + result.image),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.9),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          result.variety,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "(" + result.gender + ")",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Price".tr(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '₹' + result.price,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          wordSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Height".tr(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      result.height + " feet",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      " " + "Weight".tr(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      result.weight + "kg",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Colour".tr(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      result.colour,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Age",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      result.age + " years",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Location",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              result.location,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    /*Column(
                        children: [
                          Text(
                            "Posted Date",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "posted date",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),*/
                    Column(
                      children: [
                        Text(
                          "Description                                           ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          result.description,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.green[100],
                                    Colors.green
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 90.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Buy",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.greenAccent[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 3),
                        RaisedButton(
                          onPressed: () => sendmessage(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.green[100],
                                    Colors.green
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 100.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Call",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.greenAccent[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 3),
                        RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.green[100],
                                    Colors.green
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 100.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Add to Cart",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.greenAccent[900],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 30,
                top: height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sendmessage() async {
    const uri = 'sms:9486154165?body=hello%20there';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'sms:9486154165?body=hello%2.0there';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        print('Could not launch $uri');
      }
    }
  }
}

class Users {
  Users({
    this.success,
    this.message,
    this.result,
  });

  bool success;
  String message;
  List<Result> result;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        success: json["success"],
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result(
      this.category,
      this.image,
      this.variety,
      this.price,
      this.age,
      this.colour,
      this.description,
      this.height,
      this.weight,
      this.location,
      this.gender,
      u,
      json);
  String category;
  String image;
  String variety;
  String price;
  String colour;
  String age;
  String description;
  String height;
  String weight;
  String location;
  String gender;
  factory Result.fromJson(Map<String, dynamic> json) => Result(
      json["category"],
      json["image"],
      json["variety"],
      json["price"],
      json["colour"],
      json["age"],
      json["description"],
      json["height"],
      json["weight"],
      json["location"],
      json["gender"],
      json["age"],
      json["age"]);

  Map<String, dynamic> toJson() => {
        "category": category,
        "image": image,
        "variety": variety,
        "price": price,
        "colour": colour,
        "age": age,
        "description": description,
        "height": height,
        "weight": weight,
        "location": location,
        "gender": gender
      };
}
