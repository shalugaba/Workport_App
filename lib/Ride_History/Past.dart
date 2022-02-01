
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workport/Strings.dart';
import 'package:workport/app_data.dart';
import 'package:workport/widget.dart';
import 'package:http/http.dart' as http;


class PastRides extends StatefulWidget{
  @override
  _PastRides createState() => _PastRides();
}

class _PastRides extends State<PastRides> {

  String? Userid,Rideid,startpoint,Endpoint,date,time,price,ridetype,ridestatus;
  TextEditingController spointController = TextEditingController();
  TextEditingController epointController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ridestatusController = TextEditingController();
  Map<String , dynamic>? data;

  var userId;
  List rideData = [];
  var mapResponse;
  var dataResponse;

  @override
  void initState() {
    super.initState();
    GetData();

   /* GetHistoryDetails("29");*/

    // getuserId();
  }


  //dateController,timeController,ridestatusController,priceController,spointController,epointController

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppData.greyLight,
    /*  body: ,*/
      body: Column(

        children: [

    //  List<String> items = GetData(),



          Expanded(

          // child: Visibility(

              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                   // margin: EdgeInsets.all(8),

                    height: MediaQuery
                        .of(context)
                        .size
                        .height*0.852,

                  child: ListView.builder(

                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {

                  return PastRides();

                  }
                  ),
                ),
                 /* SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04),*/
                ],
              ),
         //   ),

          ),


        ],


      ),





    );
  }

  PastRides() {

    return Padding(padding: const EdgeInsets.only(top: 16, right: 8, left: 8),

      child: Container(

          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppData.bg_history,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: AppData.themered, blurRadius: 2)]
          ),

        child:Padding(
          padding: const EdgeInsets.all(10.0),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(

                    height: 70,
                    width: MediaQuery.of(context).size.width*0.45,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.calendar_today,color: Colors.red,
                            size: 45),

                        SizedBox(

                          width: 15,
                        ),

                        Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(

                              height: 10,
                            ),

                            Container(
                              height: 22,
                              width: 100,
                              alignment: Alignment.topLeft,
                              child:settingsHeading(
                                  title: 'Sep 25th,2021',
                                  textAlign: TextAlign.start,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: AppData.grey,
                                  controller: dateController

                              ),


                            ),

                            Container(
                              height: 25,
                              width: 100,
                              alignment: Alignment.topLeft,
                              child:settingsHeading(
                                  title: '10:00 AM',
                                  textAlign: TextAlign.start,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: AppData.grey,
                                  controller: timeController

                              ),

                            ),

                          ],
                        )
              ],

                    ),
                  ),

                  Container(

                    height: 70,
                    width: MediaQuery.of(context).size.width*0.45,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Column(

                          children: [

                            Container(

                              height: 34,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: AppData.themered,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(40)),
                                  boxShadow: [BoxShadow(color: AppData.themered, blurRadius: 2)]
                              ),
                              child: Row(

                                children: [

                                  SizedBox(
                                    width: 15,
                                  ),

                                  Icon(Icons.remove_circle_outline,color: Colors.white,
                                      size: 25),

                                  SizedBox(
                                    width: 15,
                                  ),

                                  Container(
                                    height: 30,
                                    width: 75,
                                    alignment: Alignment.centerLeft,
                                    child:settingsHeading(
                                        title: 'Cancelled',
                                        textAlign: TextAlign.start,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: AppData.white,
                                        controller: ridestatusController

                                    ),

                                  ),

                                ],

                              ),


                            ),

                            SizedBox(

                              height: 5,
                            ),

                            Container(

                              height: 30,
                              width: 165,
                              alignment: Alignment.center,
                              child:settingsHeading(
                                  title: '\$ 15.00 ',
                                  textAlign: TextAlign.start,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppData.themered,
                                  controller: priceController

                              ),

                            )
                          ],
                        ),

                      ],

                    ),

                  ),

                ],

              ),

                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppData.greyLight
                    ),
                  ),

              Column(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      Container(

                        height: 140,
                        width: MediaQuery.of(context).size.width*0.13,

                        child: Padding(padding: const EdgeInsets.all(10.0),

                        child: Image.asset(
                          Strings.ridehistory,
                        ),)

                      ),

                      Container(

                        height: 140,
                        width: MediaQuery.of(context).size.width*0.75,
                        alignment: Alignment.centerLeft,

                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerLeft,

                              child:settingsHeading(
                                  title: '4493 Lakeland Terrace,Southfield,Michigan,48075',
                                  textAlign: TextAlign.start,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: AppData.black,
                                  controller: spointController
                              ),

                            ),

                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerLeft,

                              child:settingsHeading(
                                  title: '86 St James Boulevard,Houghton Bank,DL2 4PW',
                                  textAlign: TextAlign.start,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: AppData.black,
                                  controller: epointController
                              ),

                            ),

                          ],

                        ),
                      )
                    ],
                  )

                ],

              )

            ],
          ),

        ),

      ),

    );
    
  }

  Future<void> GetData() async {
/*

    String urL ="http://grillmasters.in/workportrides/SendRidesToApp.php";
    String userid="80";

    var data1 = {'userid': userid};
    // print(data);
    // Starting Web API Call.
    var response = await http.post(urL, body: data1);

    if (response.statusCode == 200) {

      print("123");
      // var jsonResponse = jsonDecode(response.body);
      Map<String, dynamic> map = jsonDecode(response.body);
      var dataa = map['data'];

      print("list size : "+dataa.length);

      Userid = data!['userid'];
      Rideid = data!['Rideid'];
      startpoint = data!['startpoint'];
      Endpoint = data!['Endpoint'];
      date = data!['date'];
      time = data!['time'];
      price = data!['price'];
      ridetype = data!['ridetype'];
      ridestatus = data!['ridestatus'];

      startpoint = spointController.text as String;
      Endpoint = epointController.text as String;
      date = dateController.text as String;
      time = timeController.text as String;
      price = priceController.text as String;
      ridestatus = ridestatusController.text as String;

    }

 */
    String urL ="http://grillmasters.in/workportrides/SendRidesToApp.php";

      Map data = {
        'user_id': userId,
      };

      var response = await http.post(Uri.parse(urL), body: data);

      Map<String, dynamic> map = jsonDecode(response.body);

      int statusCode = map['statusCode'];
      rideData = map['data'] as List;

      print(statusCode);
      print(rideData.length);

/*      if (statusCode == 200) {

        mapResponse = json.decode(response.body) as Map;
        rideData = mapResponse['ridedata'];

        print(mapResponse);
        print(rideData);

      }
      else {
        throw Exception('Failed to load post');
      }*/

    }

}
/*

class Post_Rides {

  final String userid, Rideid, startpoint, Endpoint, date, time, price, ridetype, ridestatus;

  Post_Rides(this.userid, this.Rideid, this.startpoint, this.Endpoint, this.date,
      this.time, this.price, this.ridetype, this.ridestatus);

  factory Post_Rides.fromJson(Map<String, dynamic> json) {
    return new Post_Rides(
      json['userid'] as String,
      json['Rideid'] as String,
      json['startpoint'] as String,
      json['Endpoint'] as String,
      json['date'] as String,
      json['time'] as String,
      json['price'] as String,
      json['ridetype'] as String,
      json['ridestatus'] as String,
    );
  }
}
*/
