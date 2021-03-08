import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:uyir_angadi/modules/Login.dart';

class Mainpage extends StatefulWidget {
  MainPage createState() => MainPage();
}

class MainPage extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        shadowColor: Colors.deepPurpleAccent[100],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.deepPurple,
                  Colors.deepPurple[300],
                ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search for animals",
                        hintStyle: TextStyle(color: Colors.black),
                        icon: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.mic, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 300.0,
              width: 350.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.deepPurple,
                Colors.deepPurple[100],
                Colors.deepPurple,
                Colors.deepPurple[100],
                Colors.deepPurple,
                Colors.deepPurple[100],
                Colors.deepPurple,
                Colors.deepPurple[100],
                Colors.deepPurple,
                Colors.deepPurple[100],
                Colors.deepPurple,
                Colors.deepPurple[100],
                Colors.deepPurple,
                Colors.deepPurple[100],
                Colors.deepPurple,
              ])),
              child: Center(
                child: SizedBox(
                  height: 250.0,
                  width: 300.0,
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
            Container(
              height: 400,
              width: 370,
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                childAspectRatio: 0.9,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: <Widget>[
                  myGridItems("Farm Animals", "assets/farm_animals.jpeg",
                      0xFF660099, 0xFFFFFFFF),
                  myGridItems("Pet Animals", "assets/pet_animals.jpeg",
                      0xFF660099, 0xFFFFFFFF),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                child: Icon(
                  Icons.add_business,
                  size: 40,
                )),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'vet',
          )
        ],
      ),
    );
  }

  Widget myGridItems(
      String gridName, String gridimage, int color1, int color2) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          gradient: new LinearGradient(
            colors: [
              Color(color1),
              Color(color2),
            ],
            begin: Alignment.centerLeft,
            end: new Alignment(1.0, 1.0),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.4,
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  image: DecorationImage(
                    image: new AssetImage(gridimage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: Text(" ",
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 16,
                            ))),
                    SizedBox(width: 20.0),
                    Container(
                      child: Text(" "),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                        child: Text(
                      " ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )),
                  ],
                )),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(gridName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ))),
              ],
            ),
            updateStateButton()
          ],
        ));
  }

  Align updateStateButton() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FlatButton(
            child: Text(''),
            color: Colors.transparent,
            height: 2000,
            minWidth: 250,
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secAnimation,
                          Widget child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.easeInOut);
                        return ScaleTransition(
                          alignment: Alignment.center,
                          scale: animation,
                          child: child,
                        );
                      },
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secAnimation) {
                        return SecondScreen();
                      }));
            }),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'VARIETY',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    blurRadius: 5, color: Colors.white60, offset: Offset(2, 4))
              ],
            ),
          ),
          elevation: 20,
          toolbarHeight: 50,
          backgroundColor: Colors.deepPurple[300]),
      body: Center(
        child: Text('opened'),
      ),
    );
  }
}
