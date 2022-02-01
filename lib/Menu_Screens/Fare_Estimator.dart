
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:workport/Search/Search.dart';
import 'package:workport/Search/address_search.dart';
import 'package:workport/Search/place_service.dart';
import 'package:workport/app_data.dart';
import 'package:workport/intro/splash.dart';
import 'package:workport/widget.dart';

class Fare_Estimator extends StatefulWidget{

  @override
  _Fare_Estimator createState() => _Fare_Estimator();
}

class _Fare_Estimator extends State<Fare_Estimator>{

  TextEditingController pickController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(

        body: Column(

          mainAxisAlignment: MainAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.center,

          children: [
/*


            SizedBox(
                height: 20, width: MediaQuery.of(context).size.width
            ),
*/

            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/logo.png',
              ),
            ),

            SizedBox(
                height: 60, width: MediaQuery.of(context).size.width
            ),

            Container(

              height: 40,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                  child:  textField_edit_no(
                    title: 'Pickup Point',
                    readyOnly: true,
                    enabled: false,
                    keyboardType: TextInputType.streetAddress,
                    suffix: Icon(
                        Icons.location_on, color: AppData.themered, size: 18),
                    controller: pickController,

                    onCustomButtonPressed: () async {
                      // generate a new token here
                      dynamic sessionToken = Uuid().v4();
                      print(sessionToken);
                      final Suggestion? result = await showSearch(
                        context: context,
                        delegate: Search(sessionToken),
                      );
                      // This will change the text displayed in the TextField
                      if (result != null) {
                        final placeDetails = await PlaceApiProvider(sessionToken)
                            .getPlaceDetailFromId(result.placeId);

                        pickController.text = placeDetails.street!;

                      }
                    },

                  ),

                ),

            SizedBox(
                height: 40, width: MediaQuery.of(context).size.width
            ),

            Container(
              height: 40,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: const EdgeInsets.only(right: 15.0, left: 15.0),
              child:  textField_edit_no(
                title: 'Destination Point',
                readyOnly: true,
                keyboardType: TextInputType.streetAddress,
                suffix: Icon(
                    Icons.location_on, color: AppData.green, size: 18),
                controller: destinationController,

                  onCustomButtonPressed: () async {
                    // generate a new token here
                    dynamic sessionToken = Uuid().v4();
                    print(sessionToken);
                    final Suggestion? result = await showSearch(
                      context: context,
                      delegate: Search(sessionToken),
                    );
                    // This will change the text displayed in the TextField
                    if (result != null) {
                      final placeDetails = await PlaceApiProvider(sessionToken)
                          .getPlaceDetailFromId(result.placeId);

                      destinationController.text = placeDetails.street!;

                    }
                  },

              ),

            ),

            SizedBox(
                height: 100, width: MediaQuery.of(context).size.width
            ),

        SizedBox(

          height: 50,
          width: MediaQuery.of(context).size.width*0.95,

            child: customButton(
                margin: 0,
                textColor: AppData.white,
                title: 'CALCULATE FARE',
                color: AppData.red,
                borderColor: AppData.red,
                onCustomButtonPressed: () {


                } ),
        ),
          ],

        ),


      ),
    );

  }
}