
import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:workport/DistanceMatrix.dart';
import 'package:workport/Menu_Screens/Fare_Estimator.dart';
import 'package:workport/Menu_Screens/edit_profile.dart';
import 'package:workport/Menu_Screens/settings.dart';
import 'package:workport/Ride_History/ridehistory.dart';
import 'package:workport/Search/Search.dart';
import 'package:workport/Search/place_service.dart';
import 'package:workport/app_data.dart';
import 'package:workport/intro/splash.dart';
import 'package:workport/widget.dart';
import 'package:http/http.dart' as http;


class MyMapPage extends StatefulWidget{
  @override
  _MyMapPage createState() => _MyMapPage();
}

class _MyMapPage extends State<MyMapPage>{

  late final String title;
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController? mapController;
 // late final DistanceMatrix distanceMatrix;
  late Position _currentPosition;
  String _currentAddress = '';

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();
  List data=[];
  String _startAddress = '';
  String _destinationAddress = '';
  String? _placeDistance;
  Set<Marker> markers = {};

  PolylinePoints? polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Location> startPlacemark = await locationFromAddress(_startAddress);
      List<Location> destinationPlacemark =
      await locationFromAddress(_destinationAddress);

      // Use the retrieved coordinates of the current position,
      // instead of the address if the start position is user's
      // current position, as it results in better accuracy.
      double startLatitude = _startAddress == _currentAddress
          ? _currentPosition.latitude
          : startPlacemark[0].latitude;

      double startLongitude = _startAddress == _currentAddress
          ? _currentPosition.longitude
          : startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      // Start Location Marker
      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: _startAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: _destinationAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Adding the markers to the list
      markers.add(startMarker);
      markers.add(destinationMarker);

      // _createPolylines();
      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      // Accommodate the two locations within the
      // camera view of the map
      mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );


      setState(() {
      //  _placeDistance = totalDistance.toStringAsFixed(2);
        print('DISTANCE: $_placeDistance km');
        getTime(startLatitude, startLongitude, destinationLatitude,
            destinationLongitude);
       // getDirection(startLatitude, startLongitude, destinationLatitude,destinationLongitude);
       // https://maps.googleapis.com/maps/api/directions/json?origin=LAT,LON&destination=LAT,LON&key=API_KEY
      });

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();


    // mapLocate();
  }
  
  // Method for retrieving the current location
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');

        mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {

      print('CURRENT POS: 1');

      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
      //  startAddressController.text = _currentAddress;
   //     _startAddress = _currentAddress;

      });


    } catch (e) {
      print(e);
    }
  }

  // Create the polylines for showing the route between two places
  _createPolylines(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude,
      ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints!.getRouteBetweenCoordinates(
      "AIzaSyBIwvnH_ljtsgaOAHjPx2haa--e2ymFHxI", // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );

    String res = result.points.toString();
    print('Result : $res');
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }



  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return WillPopScope(
        onWillPop: () => Future.value(false),

      child:Scaffold(

      appBar: AppBar(title: Text('Workport') ,backgroundColor: AppData.themered,centerTitle: true,),
      body: Center(
        child: Scaffold(
          key: _scaffoldKey,
          body: Stack(
            children: <Widget>[
              // Map View
              GoogleMap(
                markers: Set<Marker>.from(markers),
                initialCameraPosition: _initialLocation,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                polylines: Set<Polyline>.of(polylines.values),
                onMapCreated: (GoogleMapController? controller) {
                  mapController = controller;
                },

              ),
              // Show zoom buttons
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.blue.shade100, // button color
                          child: InkWell(
                            splashColor: Colors.blue, // inkwell color
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.add),
                            ),
                            onTap: () {
                              mapController?.animateCamera(
                                CameraUpdate.zoomIn(),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ClipOval(
                        child: Material(
                          color: Colors.blue.shade100, // button color
                          child: InkWell(
                            splashColor: Colors.blue, // inkwell color
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.remove),
                            ),
                            onTap: () {
                              mapController?.animateCamera(
                                CameraUpdate.zoomOut(),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Show the place input fields & button for
              // showing the route
              SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      width: width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Places',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(height: 10),

                        Container(
                        height: 40,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                        child:  textField_edit_no(
                          title: 'Choose Pickup Point',
                          readyOnly: true,
                          keyboardType: TextInputType.streetAddress,
                          suffix: Icon(
                              Icons.location_on, color: AppData.red, size: 18),
                          controller: startAddressController,


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

                              startAddressController.text = placeDetails.street!;
                              _startAddress=placeDetails.street!;

                            }
                          },



                        ),

                      ),
                            SizedBox(height: 10),

                            Container(
                              height: 40,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                              child:  textField_edit_no(
                                title: 'Choose Destination',
                                readyOnly: true,
                                keyboardType: TextInputType.streetAddress,
                                suffix: Icon(
                                    Icons.location_on, color: AppData.green, size: 18),
                                controller: destinationAddressController,

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
                                    final placeDetails1 = await PlaceApiProvider(sessionToken)
                                        .getPlaceDetailFromId(result.placeId);

                                    destinationAddressController.text = placeDetails1.street!;
                                    _destinationAddress=placeDetails1.street!;

                                  }
                                },


                              ),

                            ),

                            SizedBox(height: 10),

                            Visibility(
                              visible: _placeDistance == null ? false : true,
                              child: Text(
                                'DISTANCE: $_placeDistance km',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            ElevatedButton(

                              onPressed: (_startAddress != '' &&
                                  _destinationAddress != '')
                                  ? () async {
                                startAddressFocusNode.unfocus();
                                desrinationAddressFocusNode.unfocus();
                                setState(() {
                                  if (markers.isNotEmpty) markers.clear();
                                  if (polylines.isNotEmpty)
                                    polylines.clear();
                                  if (polylineCoordinates.isNotEmpty)
                                    polylineCoordinates.clear();
                                  _placeDistance = null;
                                });
                                _calculateDistance().then((isCalculated) {
                                  if (isCalculated) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Distance Calculated Sucessfully'),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Error Calculating Distance'),
                                      ),
                                    );
                                  }
                                });
                              }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Show Route'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Show current location button
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                    child: ClipOval(
                      child: Material(
                        color: Colors.orange.shade100, // button color
                        child: InkWell(
                          splashColor: Colors.orange, // inkwell color
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(Icons.my_location),
                          ),
                          onTap: () {
                            mapController?.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: LatLng(
                                    _currentPosition.latitude,
                                    _currentPosition.longitude,
                                  ),
                                  zoom: 18.0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),

        drawer: Drawer(

          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[

              Container(

                height: 250,// <-- HEIGHT
                child: new DrawerHeader(

                  decoration: BoxDecoration(
                    color: AppData.themered,
                    image: DecorationImage(
                        image: AssetImage('assets/user_profile.png')),

                  ),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Container(
                        margin: const EdgeInsets.only(top: 120),
                        child: settingsHeading(
                            title: 'Prabheesh Kumar',
                            textAlign: TextAlign.start,
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            // onTap: getdata,
                            onCustomTextPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SplashScreen()));
                            }
                        ),
                        alignment: Alignment.bottomCenter,
                        height: 20,
                      ),


                      SizedBox(
                          height: 10, width: MediaQuery.of(context).size.width
                      ),

                      GestureDetector(

                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => EditProfilePage()));
                        },
                        child: Column(

                          children: [

                            Container(


                              child: Text('View Profile' , style: TextStyle(  fontSize: 17, color: Colors.white ), ),

                            )
                          ],
                        ),



                      ),
                 /*     Container(

                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 5),
                        child: settingsHeading(
                            title: 'View Profile',
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            // onTap: getdata,
                           *//* onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => EditProfilePage()));
                            },*//*
                            onCustomTextPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => EditProfilePage()));
                            }
                        ),
                        alignment: Alignment.bottomCenter,

                      ),*/
                    ],

                  ),

                ),

              ),

            /*  const DrawerHeader(

                decoration: BoxDecoration(
                    color: AppData.themered,
                    image: DecorationImage(
                        image: AssetImage('user.png')),

                ),
                child:  Text('Prabheesh Kumar'),
              ),*/
              ListTile(
                leading: Icon(Icons.home,color: AppData.themered,size: 24,),
                title: const Text('Home'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.history,color: AppData.themered,size: 24,),
                title: const Text('Ride History'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                //  RideHistoryPage();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RideHistoryPage()));
                },
              ),

              ListTile(
                leading: Icon(Icons.calculate_outlined,color: AppData.themered,size: 24,),
                title: const Text('Fare Estimator'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Fare_Estimator()));
                },
              ),

              ListTile(
                leading: Icon(Icons.payment,color: AppData.themered,size: 24,),
                title: const Text('View Profile'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()));
                },
              ),

              ListTile(
                leading: Icon(Icons.settings,color: AppData.themered,size: 24,),
                title: const Text('Setting'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),

              ListTile(
                leading: Icon(Icons.logout,color: AppData.themered,size: 24,),
                title: const Text('Logout'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                },
              ),
            ],
          ),

        ),




    ),


    );}

  void mapLocate() {

    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            _currentPosition.latitude,
            _currentPosition.longitude,
          ),
          zoom: 18.0,
        ),
      ),
    );

  }

  Future<void>  getTime(double startLatitude,double startLongitude,double destinationLatitude,
      double destinationLongitude) async{
    String urL = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$startLatitude,$startLongitude&destinations=$destinationLatitude,$destinationLongitude&key=AIzaSyBIwvnH_ljtsgaOAHjPx2haa--e2ymFHxI";

    var response = await http.post(Uri.parse(urL));
    PolylinePoints points = new PolylinePoints();

    Map<String, dynamic> map = jsonDecode(response.body);

    DistanceMatrix distanceMatrix = new DistanceMatrix.fromJson(json.decode(response.body));
    _getPolyline(startLatitude, startLongitude, destinationLatitude,
        destinationLongitude);
    Distance? data = distanceMatrix.elements![0].distance;
    String? distance = data!.text;
      print(response.body);
    print('DISTANCE2: $distance km');


}

  void getDirection(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude) async{
    String urL = "https://maps.googleapis.com/maps/api/directions/json?origin=$startLatitude,$startLongitude&destination=$destinationLatitude,$destinationLongitude&key=AIzaSyBIwvnH_ljtsgaOAHjPx2haa--e2ymFHxI";

    var response = await http.post(Uri.parse(urL));

    Map<String, dynamic> map = jsonDecode(response.body);

    dynamic directions = map["routes"][0]["overview_polyline"]['points'];

    _getPolyline(startLatitude, startLongitude, destinationLatitude,
        destinationLongitude);

  }

  void _getPolyline(double startLatitude,double startLongitude,double destinationLatitude,
      double destinationLongitude) async {
     PolylineResult? result = await polylinePoints!.getRouteBetweenCoordinates(
        "AIzaSyBIwvnH_ljtsgaOAHjPx2haa--e2ymFHxI",
        PointLatLng(startLatitude, startLongitude),
        PointLatLng(destinationLatitude, destinationLongitude),
        travelMode: TravelMode.driving);

    print('tiger : $result');

    if (result.points.isNotEmpty) {

      print('tiger');
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates,width: 3);
    polylines[id] = polyline;

    setState(() {});
  }
}
