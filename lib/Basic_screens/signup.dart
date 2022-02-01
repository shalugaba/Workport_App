
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workport/app_data.dart';
import 'package:workport/widget.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget{
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<Signup> {

  List UserData = [];
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
      body: SingleChildScrollView(
      padding: EdgeInsets.all(10),
        child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

        children: [


          SizedBox(
              height: 30,width: 300
          ),

          Container(

              height: 190,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppData.themered,
              ),

            //  alignment: Alignment.bottomLeft,padding: const EdgeInsets.only(left: 40.0,bottom: 30,right: 40.0),
              child:Column(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [


                  Container(
                    alignment: Alignment.topLeft,padding: const EdgeInsets.only(left: 20.0,top: 30,right: 20.0),

                    child: IconButton(
                      icon: Icon(

                        Icons.arrow_back,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {

                        });
                      },
                    ),

                  ),

                  Container(

                    alignment: Alignment.bottomLeft,padding: const EdgeInsets.only(left: 40.0,bottom: 30,right: 40.0),

                    child: Text(
                      "Let\'s start with creating your account",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 24.0,
                          color: AppData.white// insert your font size here
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                  )

                ],

              )

          ),

          SizedBox(height: 70),

          Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 15.0,left: 15.0),
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
                          Text(""),
                        ],
                      ),


                    ),



                  ),

                ],
              )

          ),


          SizedBox(height: 30),

          Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 15.0,left: 15.0),
              child: textField(
                title: 'First Name',
                keyboardType: TextInputType.text,
                suffix: Icon(Icons.edit,color: AppData.themered,size: 16),
                controller: firstnameController,
              )
          ),


          SizedBox(height: 30),

          Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 15.0,left: 15.0),
              child: textField(
                title: 'Last Name',
                keyboardType: TextInputType.text,
                suffix: Icon(Icons.edit,color: AppData.themered,size: 16),
                controller: lastnameController,
              )
          ),


          SizedBox(height: 30),

          Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 15.0,left: 15.0),
              child: textField(
                title: 'E-mail Address',
                keyboardType: TextInputType.emailAddress,
                suffix: Icon(Icons.email_outlined,color: AppData.themered,size: 16),
                controller: emailController,
              )
          ),

          SizedBox(height: 155),

          Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 15.0,left: 15.0),
              child: customButton(
                margin: 0,
                textColor: AppData.white,
                title: 'SUBMIT',
                color: AppData.themered,
                borderColor: AppData.themered,
                onCustomButtonPressed:  () async {

                  Uri urL =Uri.parse('http://grillmasters.in/workportrides/UserRegister.php');
                  String phn_number="7589219984";
                 // print("phn_number : " + phn_number);
                  String first_name=firstnameController.text;
                  String last_name=lastnameController.text;
                  String email=emailController.text;
                  String countrycode="+1";
                  String device_id="ghjfgsjdgfhd";

                  // if (first_name.isEmpty)


                  var data = {'CountryCode': countrycode , 'PhoneNumber' : phn_number, 'FirstName' : first_name, 'LastName' : last_name, 'Email' : email, 'device_id' : device_id};
                   print(data);
                  // Starting Web API Call.
                  var response = await http.post(urL, body: data); // REMOVED [email]

                  print(response.statusCode);

                  if (response.statusCode == 200) {
                    // var jsonResponse = jsonDecode(response.body);
                    Map<String, dynamic> map= jsonDecode(response.body);

                    int statusCode = map['statusCode'];
                    String sess_id = map['sess_id'];
                    int user_id = map['user_id'];
                    String message = map['message'];
                    Map<String , dynamic> data = map['userdata'];

                   // statusCode = phoneController.text as int;
                   // Map<String, dynamic> datauser= jsonDecode(data);

                    String first_name = data['first_name'];

                    UserData = map['userdata'] as List;

                   /* print(first_name);*/

                  }

                }),

              )





        ]
      )
      )
      )

    );
  }
}