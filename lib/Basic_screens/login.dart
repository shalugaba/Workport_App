import 'dart:convert';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workport/Basic_screens/signup.dart';
import 'package:workport/Interface/ApiRequest.dart';
import 'package:workport/Menu_Screens/MyMapPage.dart';
import 'package:workport/Menu_Screens/settings.dart';
import 'package:workport/POJO/Login_Register.dart';
import 'package:workport/app_data.dart';
import 'package:workport/intro/splash.dart';
import 'package:workport/main.dart';
import 'package:workport/welcome.dart';
import 'package:workport/widget.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _passwordVisible = false;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [

              SizedBox(
                height: 80,
                width: 170,
              ),

              SizedBox(height: 15),
              Align(
                child: appText(
                  title: 'What\'s your number ?',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15),
              Align(
                child: appText(
                  title: 'we\'ll text a code to verify your phone.',
                  fontSize: 22,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 80),
              Container(
                margin: const EdgeInsets.only(left: 15.0,right: 15.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.15,
                       // margin: const EdgeInsets.only(left: 15.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppData.lightgrey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.centerLeft,

                        padding: const EdgeInsets.only(right: 15.0,left: 15.0),
                        child: Stack(

                          children: [
                            TextFormField(
                              controller: phoneController,
                              readOnly: true,
                              decoration: new InputDecoration(
                                // hintText: '+91 7589219984',
                                border: InputBorder.none,
                              ),

                            ),
                            Positioned(

                              child: Container(

                                alignment: Alignment.centerLeft,
                                color: AppData.lightwhite,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("+1"),
                                  ],
                                ),


                              ),



                            ),

                          ],
                        )

                    ),

                    SizedBox(width: 5),

                    SizedBox(

                      height: 50,
                      width: MediaQuery.of(context).size.width*0.7,

                    child:textField(
                      title: 'Phone number',
                      keyboardType: TextInputType.phone,
                      suffix: Icon(Icons.phone),
                      controller: phoneController,
                    )
                    ),

                    //Country


                  ],
                ),
              ),


              SizedBox(height: 335),
/*              Image.asset(
                'assets/login_signup_btn.png',
                width: 25,
              ),*/
              SizedBox(
                height: 50,
                width: 170,
                
                child: /*Image.asset('login_signup_btn.png')*/
                
                customButton(
                    margin: 0,
                    textColor: AppData.white,
                    title: 'SUBMIT',
                    color: AppData.red,
                    borderColor: AppData.red,
                    onCustomButtonPressed: () async {

                     /* Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyMapPage()));*/
                      Uri urL =Uri.parse('http://grillmasters.in/workportrides/MobileNumberVerification.php');
                      String phn_number=phoneController.text;
                      String action="login";
                      String device_id="ghjfgsjdgfhd";
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      final String? welcome_type = prefs.getString('welcome_type');

                     /* print(phn_number);
                      print(action);
                      print(device_id);*/
                      if (!phn_number.isEmpty/* && phn_number.length !>10*/){

                        var data = {'PhnNumber': phn_number, 'action' : welcome_type, 'device_id' : device_id};
                       // print(data);
                        // Starting Web API Call.
                        var response = await http.post(urL, body: data); // REMOVED [email]



                      //  print('my response code '+code.toString());

                        if (response.statusCode == 200) {
                         // var jsonResponse = jsonDecode(response.body);
                          Map<String, dynamic> map= jsonDecode(response.body);

                          print("welcome_type : "+ welcome_type!);

                          if (welcome_type=="login"){

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => MyMapPage()));
                          }

                          else {

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Signup()));
                          }


                          int statusCode = map['statusCode'];
                          String sess_id = map['sess_id'];
                          int Otp = map['Otp'];
                          Map<String , dynamic> data = map['data'];

                          statusCode = phoneController.text as int;

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginPage()));
                         // Map<String, dynamic> datauser= jsonDecode(data);
                          String first_name = data['first_name'];

                          print(first_name);

                        }

                      }
                      else {

                        print('Please enter phone number');
                      }


                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


