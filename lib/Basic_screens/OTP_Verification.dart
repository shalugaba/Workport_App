
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workport/app_data.dart';

class OTP_Verification extends StatefulWidget{

  @override
  _OTP_VerificationState createState() => _OTP_VerificationState();
}

class _OTP_VerificationState extends State<OTP_Verification> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
    child: Scaffold(
    body: SingleChildScrollView(
    padding: EdgeInsets.all(10),
    child: Column(

      //  crossAxisAlignment:  CrossAxisAlignment.center,
    children: [


      SizedBox(
          height: 30,width: 300
      ),

      Container(

          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppData.white,
          ),

          //  alignment: Alignment.bottomLeft,padding: const EdgeInsets.only(left: 40.0,bottom: 30,right: 40.0),
          child:Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:  CrossAxisAlignment.center,

            children: [


              Container(
                alignment: Alignment.topLeft,padding: const EdgeInsets.only(left: 20.0,top: 30,right: 20.0),

                child: IconButton(
                  icon: Icon(

                    Icons.arrow_back,
                    color: Colors.grey,
                    size: 35,
                  ),
                  onPressed: () {
                    setState(() {

                    });
                  },
                ),

              ),


              SizedBox(
                  height: 30,width: 300
              ),

            ],

          )

      ),
      Container(
        decoration: BoxDecoration(
          color: AppData.white,
        ),

        alignment: Alignment.bottomCenter,padding: const EdgeInsets.only(left: 40.0,right: 40.0,bottom: 10.0),

        child: Text(
          "Enter the code",
          maxLines: 2,
          style: TextStyle(
              fontSize: 25.0,
              color: AppData.txtcolor// insert your font size here
          ),
          overflow: TextOverflow.ellipsis,
        ),

      ),



      Row(

        crossAxisAlignment:  CrossAxisAlignment.center,

        children: [

          Container(

            width: MediaQuery.of(context).size.width*0.45,
            alignment: Alignment.centerRight,padding: const EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              color: AppData.white,
            ),

            child: Text(
              "sent to",
              maxLines: 1,
              style: TextStyle(
                  fontSize: 16.0,
                  color: AppData.txtcolor// insert your font size here
              ),
              overflow: TextOverflow.ellipsis,
            ),

          ),

          Container(
            width: MediaQuery.of(context).size.width*0.53,
            alignment: Alignment.centerLeft,padding: const EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
              color: AppData.white,
            ),

            child: Text(
              "+91 7719491228",
              maxLines: 1,
              style: TextStyle(
                  fontSize: 16.0,
                  color: AppData.txtcolor// insert your font size here
              ),
              overflow: TextOverflow.ellipsis,
            ),

          )



        ],
      ),


      SizedBox(height: 20),

      Container(

        child:
        Row(

         // crossAxisAlignment:  CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text(
              "3",
              maxLines: 1,
              style: TextStyle(
                  fontSize: 16.0,
                  color: AppData.txtcolor// insert your font size here
              ),
              overflow: TextOverflow.ellipsis,
            ),

            Text(
              "3",
              maxLines: 1,
              style: TextStyle(
                  fontSize: 16.0,
                  color: AppData.txtcolor// insert your font size here
              ),
              overflow: TextOverflow.ellipsis,
            ),

            Text(
              "3",
              maxLines: 1,
              style: TextStyle(
                  fontSize: 16.0,
                  color: AppData.txtcolor// insert your font size here
              ),
              overflow: TextOverflow.ellipsis,
            ),

            Text(
              "3",
              maxLines: 1,
              style: TextStyle(
                  fontSize: 16.0,
                  color: AppData.txtcolor// insert your font size here
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),



      )



    ]
    )
    )
    )
    );
  }
}