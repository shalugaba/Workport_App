import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workport/Basic_screens/signup.dart';
import 'package:workport/Menu_Screens/MyMapPage.dart';
import 'package:workport/Strings.dart';
import 'package:workport/app_data.dart';
import 'package:workport/intro/splash.dart';
import 'package:workport/Basic_screens/login.dart';
import 'package:workport/widget.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Strings.logo),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 18.0),
            child: appText(
              title: 'Welcome to the WorkPort Rider App',
              maxLines: 2,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
                width: 170,
                child: customButton(
                    margin: 0,
                    textColor: AppData.white,
                    title: 'SIGN IN',
                    color: AppData.red,
                    borderColor: AppData.red,
                    onCustomButtonPressed: () async {

                      final SharedPreferences prefs =await SharedPreferences.getInstance();
                      prefs.setString('welcome_type', 'login');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }),
              ),
              SizedBox(
                height: 50,
                width: 170,
                child: customButton(
                    margin: 0,
                    textColor: AppData.red,
                    title: 'SIGN UP',
                    borderColor: AppData.red,
                    onCustomButtonPressed: () async {

                      final SharedPreferences prefs =await SharedPreferences.getInstance();
                      prefs.setString('welcome_type', 'signup');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()));
                    }),
              ),
            ],
          ),
          SizedBox(height: 10),
          Align(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyMapPage())).whenComplete(() => {});
              },
              child: Text(
                'Ready to earn? Open the driver app',
                style: TextStyle(
                  letterSpacing: 1,
                  fontFamily: themeFont,
                  fontStyle: FontStyle.italic,
                  color: Colors.black45,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


