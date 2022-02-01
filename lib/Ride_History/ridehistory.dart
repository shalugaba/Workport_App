import 'package:flutter/material.dart';
import 'package:workport/Ride_History/All_Rides.dart';
import 'package:workport/Ride_History/Past.dart';
import 'package:workport/Ride_History/Upcoming.dart';
import 'package:workport/widget.dart';

import '../app_data.dart';

class RideHistoryPage extends StatefulWidget {
  @override
  _RideHistoryPageState createState() => _RideHistoryPageState();
}

class _RideHistoryPageState extends State<RideHistoryPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: AppData.greyLight,
        body: Stack(
          children: [

            DefaultTabController(
              length: 3,
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  // color: Colors.green,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      toolbarHeight: 30,
                      backgroundColor: Colors.white,
                      backwardsCompatibility: true,
                      centerTitle: true,
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      bottom: TabBar(
                        indicatorWeight: 3,
                        unselectedLabelColor: AppData.grey,
                        unselectedLabelStyle:
                        TextStyle(color: AppData.grey),
                        indicatorColor: AppData.themered,
                        labelStyle: TextStyle(color: AppData.grey),
                        tabs: [
                          Tab(
                              child: appText(
                                title: 'ALL',
                                color: AppData.themered,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              )),
                          Tab(
                              child: appText(
                                title: 'PAST',
                                color: AppData.themered,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              )),
                          Tab(
                              child: appText(
                                title: 'UPCOMING',
                                color: AppData.themered,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        UpcomingRides(),
                        UpcomingRides(),
                        UpcomingRides(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
/*
            Column(
              children: [
                statusBar(context),
                customMainAppBar(
                  title: 'Ride History',
                ),
              ],
            ),
*/


            Container(

                height: 70,
                width: MediaQuery.of(context).size.width,
               // margin: const EdgeInsets.all(8),
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: AppData.themered,
                ),

                alignment: Alignment.center,
                child:settingsHeading(
                    title: 'Ride History',
                    textAlign: TextAlign.start,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white

                )

            ),
            // Container(
            //   color: Colors.yellow,
            //   height: 50,
            // )
          ],
        ));
  }
}
