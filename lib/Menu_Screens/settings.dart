

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:workport/Menu_Screens/add_addresses.dart';
import 'package:workport/app_data.dart';
import 'package:workport/Basic_screens/login.dart';
import 'package:workport/widget.dart';

import '../NeoText.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppData.themered,
                    ),

                   alignment: Alignment.center,
                   child:settingsHeading(
                       title: 'Settings',
                       textAlign: TextAlign.start,
                       fontSize: 22,
                       fontWeight: FontWeight.normal,
                       color: Colors.white

                   ) ,

                 ),

                 SizedBox(
                     height: MediaQuery.of(context).size.height * 0.05
                 ),
                 Align(
                   alignment: Alignment.centerLeft,
                   child: settingsHeading(
                     title: 'Personal Info',
                     textAlign: TextAlign.start,
                     fontSize: 20,
                     fontWeight: FontWeight.normal,
                     color: Colors.black
                   ),
                 ),

                 SizedBox(
                   height: 10,width: 300
                 ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.supervised_user_circle,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {

                        });
                      },
                    ),

                    Container(
                      height: 30,
                      width: 300,
                      alignment: Alignment.centerLeft,
                      child:settingsHeading(
                          title: 'Prabheesh Kumar',
                          textAlign: TextAlign.start,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: AppData.grey

                      ),

                    ),
                  ],
                ),

                 SizedBox(
                     height: 1,width: 300

                 ),
                 Container(
                   height: 1,
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                       color: AppData.greyLight
                   ),
                 ),

                 SizedBox(
                     height: 10,width: 300
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,

                   children: [
                     IconButton(
                       icon: Icon(
                         Icons.email,
                         color: Colors.red,
                       ),
                       onPressed: () {
                         setState(() {

                         });
                       },
                     ),

                     Container(
                       height: 30,
                       width: 300,
                       alignment: Alignment.centerLeft,
                       child:settingsHeading(
                           title: 'test.workport@mail.com',
                           textAlign: TextAlign.start,
                           fontSize: 18,
                           fontWeight: FontWeight.normal,
                           color: AppData.grey

                       ),

                     ),
                   ],
                 ),

                 SizedBox(
                     height: 1,width: 300

                 ),
                 Container(
                   height: 1,
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                       color: AppData.greyLight
                   ),
                 ),

                 SizedBox(
                     height: 10,width: 300
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,

                   children: [
                     IconButton(
                       icon: Icon(
                         Icons.phone,
                         color: Colors.red,
                       ),
                       onPressed: () {
                         setState(() {
                         });
                       },
                     ),

                     Container(
                       height: 30,
                       width: 300,
                       alignment: Alignment.centerLeft,
                       child:settingsHeading(
                           title: '+91 7719491228',
                           textAlign: TextAlign.start,
                           fontSize: 18,
                           fontWeight: FontWeight.normal,
                           color: AppData.grey

                       ),

                     ),
                   ],
                 ),

                 SizedBox(
                     height: 1,width: 300

                 ),
                 Container(
                   height: 1,
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                       color: AppData.greyLight
                   ),
                 ),

                 SizedBox(
                     height: 5,width: 300

                 ),


                 SizedBox(
                     height: MediaQuery.of(context).size.height * 0.05
                 ),
                 Align(
                   alignment: Alignment.centerLeft,
                   child: settingsHeading(
                       title: 'Favorites',
                       textAlign: TextAlign.start,
                       fontSize: 20,
                       fontWeight: FontWeight.normal,
                       color: Colors.black
                   ),
                 ),

                 SizedBox(
                     height: 10,width: 300
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,

                   children: [
                     IconButton(
                       icon: Icon(
                         Icons.home,
                         color: Colors.red,
                       ),
                       onPressed: () {
                         setState(() {

                         });
                       },
                     ),

                     Container(
                       height: 30,
                       width: 300,
                       alignment: Alignment.centerLeft,
                      child:  NeoText(
                        text: 'Add Home Address',
                        color: AppData.grey,
                        size: 18,
                        wordSpacing: 2.0,
                        fontWeight: FontWeight.normal,
                        onClick: ()
                          {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddAddressesPage()));},
                      ),
                      /* child:settingsHeading(
                           title: 'Add Home',
                           textAlign: TextAlign.start,
                           fontSize: 18,
                           fontWeight: FontWeight.normal,
                           color: AppData.grey,


                       ),*/

                     ),
                   ],
                 ),

                 SizedBox(
                     height: 1,width: 300

                 ),
                 Container(
                   height: 1,
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                       color: AppData.greyLight
                   ),
                 ),

                 SizedBox(
                     height: 10,width: 300
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,

                   children: [
                     IconButton(
                       icon: Icon(
                         Icons.work,
                         color: Colors.red,
                       ),
                       onPressed: () {
                         setState(() {

                         });
                       },
                     ),

                     InkWell(

                       child: Container(
                         height: 30,
                         width: 300,
                         alignment: Alignment.centerLeft,
                         child:settingsHeading(
                             title: 'Add Work',
                             textAlign: TextAlign.start,
                             fontSize: 18,
                             fontWeight: FontWeight.normal,
                             color: AppData.grey
                         ),

                       ),

                       onTap: ()=>{Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => AddAddressesPage()))},

                     ),


                   ],
                 ),

                 SizedBox(
                     height: 1,width: 300

                 ),
                 Container(
                   height: 1,
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                       color: AppData.greyLight
                   ),
                 ),

                 SizedBox(
                     height: 10,width: 300
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,

                   children: [
                     IconButton(
                       icon: Icon(
                         Icons.work,
                         color: Colors.red,
                       ),
                       onPressed: () {
                         setState(() {
                         });
                       },
                     ),

                     InkWell(

                       child: Container(
                         height: 30,
                         width: 300,
                         alignment: Alignment.centerLeft,
                         child:settingsHeading(
                             title: 'Add Others',
                             textAlign: TextAlign.start,
                             fontSize: 18,
                             fontWeight: FontWeight.normal,
                             color: AppData.grey

                         ),

                       ),

                       onTap: ()=>{Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => AddAddressesPage()))},

                     ),

                   ],
                 ),

                 SizedBox(
                     height: 1,width: 300

                 ),
                 Container(
                   height: 1,
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                       color: AppData.greyLight
                   ),
                 ),

                 SizedBox(
                     height: 5,width: 300

                 ),

                 SizedBox(
                     height: MediaQuery.of(context).size.height * 0.05
                 ),
                 Align(
                   alignment: Alignment.centerLeft,
                   child: settingsHeading(
                       title: 'View Address',
                       textAlign: TextAlign.start,
                       fontSize: 20,
                       fontWeight: FontWeight.normal,
                       color: Colors.black
                   ),
                 ),

                 SizedBox(
                     height: 10,width: 300
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,

                   children: [
                     IconButton(
                       icon: Icon(
                         Icons.home,
                         color: Colors.red,
                       ),
                       onPressed: () {
                         setState(() {

                         });
                       },
                     ),

                     InkWell(

                       child: Container(
                         height: 30,
                         width: 300,
                         alignment: Alignment.centerLeft,

                         child:settingsHeading(
                           title: 'View Default Address',
                           textAlign: TextAlign.start,
                           fontSize: 18,
                           fontWeight: FontWeight.normal,
                           color: AppData.grey
                         ),

                       ),
                       onTap: ()=>{Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => AddAddressesPage()))},

                     ),

                   ],
                 ),

                 SizedBox(
                     height: 1,width: 300
                 ),

                 Container(
                   height: 1,
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                       color: AppData.greyLight
                   ),
                 ),

                 SizedBox(
                     height: 60,width: 300
                 ),


               ],
             ),
          ),

        ),

    );
  }
}