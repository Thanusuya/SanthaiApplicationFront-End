import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:uyir_angadi/modules/Mainpage.dart';
import 'package:uyir_angadi/modules/language.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ta', 'IN'),
        Locale('hi', 'IN'),
        Locale('ml', 'IN')
      ],
      path: 'trans',
      fallbackLocale: Locale('en', 'US'),
      saveLocale: true,
      child: MyApps(),
    ),
  );
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Center(
          child: SplashScreen(
            seconds: 5,
            navigateAfterSeconds: new MyHomePage(),
            image: new Image.asset(
                'assets/imgonline-com-ua-ReplaceColor-evNoSx8KpsRL_auto_x1.jpg'),
            backgroundColor: Colors.white,
            loaderColor: Colors.green,
            photoSize: 150.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
