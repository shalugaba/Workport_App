
//flutter build apk --release --no-sound-null-safety

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workport/Menu_Screens/MyMapPage.dart';
import 'package:workport/Menu_Screens/settings.dart';
import 'package:workport/NeoText.dart';
import 'package:workport/app_data.dart';
import 'package:workport/intro/splash.dart';
import 'package:workport/widget.dart';
import 'package:http/http.dart' as http;


class AddAddressesPage extends StatefulWidget {

  @override
  _AddAddressesPage createState() => _AddAddressesPage();
}

class _AddAddressesPage extends State<AddAddressesPage>{

  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController zipController = TextEditingController();

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
                title: 'Add Home Address',
                textAlign: TextAlign.start,
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                 // onTap: getdata,
              onCustomTextPressed: () {
                  Navigator.push(context,
                 MaterialPageRoute(builder: (context) => SplashScreen()));
                   }
                  )
          ),
              SizedBox(

                height: 35,
                width:MediaQuery.of(context).size.width

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Container(

                    height: 105,
                    width: 105,
                    margin: const EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      color: AppData.themered,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: AppData.white, spreadRadius: 1),
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(

                          height: 10

                        ),

                        SizedBox(


                            child: new IconButton(
                            alignment: Alignment.center,
                            padding: new EdgeInsets.all(0.0),
                            color: AppData.white,
                            icon: new Icon(Icons.home, size: 38.0), onPressed: () {  },

                        )

                        ),


                        SizedBox(

                            height: 5

                        ),


                        Container(
                            height: 30,
                            width: 300,
                            alignment: Alignment.center,
                            child:settingsHeading(
                                title: 'Home',
                                textAlign: TextAlign.center,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppData.white

                            ),

                          ),

                        ]
                    ),

                  ),

                  Container(

                    height: 105,
                    width: 105,

                    decoration: BoxDecoration(
                      color: AppData.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: AppData.themered, spreadRadius: 1),
                      ]

                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(

                              height: 10

                          ),

                          SizedBox(


                              child: new IconButton(
                                alignment: Alignment.center,
                                padding: new EdgeInsets.all(0.0),
                                color: AppData.themered,
                                icon: new Icon(Icons.work, size: 38.0), onPressed: () {  },

                              )

                          ),


                          SizedBox(

                              height: 5

                          ),


                          Container(
                            height: 30,
                            width: 300,
                            alignment: Alignment.center,
                            child:settingsHeading(
                                title: 'Work',
                                textAlign: TextAlign.center,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppData.themered

                            ),

                          ),

                        ]
                    ),



                  ),

                  Container(

                    height: 105,
                    width: 105,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      color: AppData.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: AppData.themered, spreadRadius: 1),
                        ]
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(

                              height: 10

                          ),

                          SizedBox(

                              child: new IconButton(
                                alignment: Alignment.center,
                                padding: new EdgeInsets.all(0.0),
                                color: AppData.themered,
                                icon: new Icon(Icons.add_location_rounded, size: 38.0), onPressed: () {  },

                              )

                          ),

                          SizedBox(

                              height: 5

                          ),

                          Container(
                            height: 30,
                            width: 300,
                            alignment: Alignment.center,
                            child:settingsHeading(
                                title: 'Others',
                                textAlign: TextAlign.center,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppData.themered

                            ),

                          ),

                        ]
                    ),

                  ),

                ],
              ),

              SizedBox(
                  height: 20
              ),

              SizedBox(height: 15),
              textField(
                title: 'Street',
                keyboardType: TextInputType.text,
                suffix: Icon(Icons.streetview,color: AppData.themered,size: 14),
                controller: streetController,
              ),

              SizedBox(
                height: 2
              ),

              SizedBox(height: 15),
              textField(
                title: 'City',
                keyboardType: TextInputType.text,
                suffix: Icon(Icons.location_city,color: AppData.themered,size: 14),
                controller: cityController,
              ),

              SizedBox(
                  height: 2
              ),

              SizedBox(height: 15),
              textField(
                title: 'State',
                keyboardType: TextInputType.text,
                suffix: Icon(Icons.phone,color: AppData.themered,size: 14),
                controller: stateController,
              ),


              SizedBox(
                  height: 2
              ),

              SizedBox(height: 15),
              textField(
                title: 'Country',
                keyboardType: TextInputType.text,
                suffix: Icon(Icons.phone,color: AppData.themered,size: 14),
                controller: countryController,
              ),


              SizedBox(
                  height: 2
              ),

              SizedBox(height: 15),
              textField(
                title: 'Zip Code',
                keyboardType: TextInputType.text,
                suffix: Icon(Icons.post_add,color: AppData.themered,size: 14),
                controller: zipController,
              ),

              SizedBox(height: 55),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: customButton(
                    margin: 0,
                    textColor: AppData.white,
                    title: 'SUBMIT',
                    color: AppData.themered,
                    borderColor: AppData.themered,
                  onCustomButtonPressed:() async {

                      String street= streetController.text;
                      String city= cityController.text;
                      String state= stateController.text;
                      String country= countryController.text;
                      String zip= zipController.text;
                      String addresstype= "home";
                      String Userid= "105";


                      if (!street.isEmpty){

                        if (!city.isEmpty){

                          if (!state.isEmpty){

                            if (!country.isEmpty){

                              if (!zip.isEmpty){

                                Uri urL =Uri.parse('http://grillmasters.in/workportrides/addressapi.php');

                                var data = {'UserId': Userid, 'address_type' : addresstype, 'street' : street, 'city' : city, 'state' : state, 'country' : country, 'zip_code' : zip};
                                // print(data);
                                // Starting Web API Call.
                                var response = await http.post(urL, body: data); // REMOVED [email]

                                if (response.statusCode == 200) {

                                  streetController.clear();
                                  cityController.clear();
                                  stateController.clear();
                                  countryController.clear();
                                  zipController.clear();

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => SettingsPage()));
                                }
                                else {
                                  print (response.body);
                                }
                              }
                              else {
                                print('Please enter Street');
                              }
                            }

                            else {

                              print('Please enter Street');
                            }

                          }

                          else {

                            print('Please enter Street');
                          }

                        }

                        else {

                          print('Please enter Street');
                        }

                      }

                      else {

                        print('Please enter Street');
                      }
                  }),

              ),

              SizedBox(height: 15),

              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: customButton(
                    margin: 0,
                    textColor: AppData.themered,
                    title: 'CLOSE',
                    color: AppData.white,
                    borderColor: AppData.themered

                  )
              ),

              SizedBox(height: 35)

            ]


              )
            )
          )
    );
  }

 void getdata() {

    print("hello");

  }
}

/*
NeoText(
text: 'Add Home Address',
color: Colors.blue,
size: 22,
wordSpacing: 2.0,
fontWeight: FontWeight.bold,
onClick: () {
Navigator.push(context,
MaterialPageRoute(builder: (context) => SplashScreen()));
},
),*/
