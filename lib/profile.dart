import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: profiledetails(title: 'Flutter Demo Home Page'),
    );
  }
}

class profiledetails extends StatefulWidget {
  profiledetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _profiledetailsState createState() => _profiledetailsState();
}

class _profiledetailsState extends State<profiledetails> {
  String _imageBg =
      "https://images.unsplash.com/photo-1561708232-fc2ac7e36676?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  String _userAvatar = "https://randomuser.me/api/portraits/men/46.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Profile'.tr()),
        backgroundColor: Colors.green,
      ),
      drawerScrimColor: Colors.transparent,
      drawer: Container(
        width: 300,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromARGB(180, 250, 250, 250),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(31, 38, 135, 0.4),
                blurRadius: 8.0,
              )
            ],
            border: Border(
                right: BorderSide(
              color: Colors.white70,
            ))),
        child: Stack(
          children: [
            SizedBox(
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.blueAccent.withOpacity(0.2),
                    ])),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(_userAvatar),
                        radius: 30.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text("User Name")
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                        title: Text("Home Page"),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        title: Text("Profile Page"),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        title: Text("Settings"),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        title: Text("Log Out"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(_imageBg),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
