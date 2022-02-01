
import 'package:flutter/material.dart';
import 'package:workport/Strings.dart';
import 'package:workport/app_data.dart';
import 'package:workport/widget.dart';

class UpcomingRides extends StatefulWidget{
  @override
  _UpcomingRides createState() => _UpcomingRides();
}

class _UpcomingRides extends State<UpcomingRides> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppData.greyLight,
    /*  body: ,*/
      body: Column(

        children: [

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
                   /* child: ListView.builder(
                      itemCount: 5,
                      // shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return AllRidesHistory();
                      },
                    ),*/
                  child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {

                  return AllRidesHistory();

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

  AllRidesHistory() {

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
                                  color: AppData.grey

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
                                  color: AppData.grey

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
                                        color: AppData.white

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
                                  color: AppData.themered

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
                                  color: AppData.black
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
                                  color: AppData.black
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

}