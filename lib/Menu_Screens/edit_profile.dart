
import 'dart:convert';
import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workport/Menu_Screens/MyMapPage.dart';
import 'package:workport/app_data.dart';
import 'package:workport/widget.dart';
import 'package:http/http.dart' as http;


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePage createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage> {

  final _picker = ImagePicker();
  File? _image;
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
                      height: 30, width: 300
                  ),

                  Container(

                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                        color: AppData.themered,
                      ),

                      alignment: Alignment.center,
                      child: settingsHeading(
                          title: 'Edit Profile',
                          textAlign: TextAlign.start,
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                          color: Colors.white

                      )

                  ),

                  Container(

                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(left: 30.0, top: 20),

                      alignment: Alignment.centerLeft,
                      child: settingsHeading(
                          title: 'Update Information',
                          textAlign: TextAlign.start,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black

                      )

                  ),


                  GestureDetector(
                    onTap: () {
                      _showPicker(context);

                      print("Container clicked");
                    },
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: AppData.themered,
                      child: _image != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(60),

                        child: Image.file(
                          _image!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      )
                          : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                            Icons.person_add, color: AppData.themered,
                            size: 40)
                      ),
                    ),



                  ),


                  SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Container(
                        height: 40,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.42,
                        margin: const EdgeInsets.only(right: 5.0, left: 15.0),
                        child: textField(
                          title: 'First Name',
                          keyboardType: TextInputType.text,
                          suffix: Icon(
                              Icons.edit, color: AppData.themered, size: 14),
                          controller: firstController,
                        ),
                      ),

                      Container(
                        height: 40,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.40,
                        margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                        child: textField(
                          title: 'Last Name',
                          keyboardType: TextInputType.text,
                          suffix: Icon(
                              Icons.edit, color: AppData.themered, size: 14),
                          controller: lastController,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),

                  Container(
                      height: 40,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: textField(
                        title: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        suffix: Icon(
                            Icons.phone, color: AppData.themered, size: 14),
                        controller: phoneController,
                      )
                  ),


                  SizedBox(height: 20),

                  Container(
                      height: 40,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: textField(
                        title: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        suffix: Icon(
                            Icons.email, color: AppData.themered, size: 14),
                        controller: emailController,
                      )
                  ),

                  SizedBox(height: 155),

                  Container(
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: customButton(
                        margin: 0,
                        textColor: AppData.white,
                        title: 'SUBMIT',
                        color: AppData.themered,
                        borderColor: AppData.themered,
                        onCustomButtonPressed: () async {

                          String firstname= firstController.text;
                          String lastname= lastController.text;
                          String phone= phoneController.text;
                          String email= emailController.text;
                          String Userid= "105";

                          if (!firstname.isEmpty) {

                            if (!lastname.isEmpty) {

                              if (_image != null) {

                                Uri urL =Uri.parse('http://grillmasters.in/workportrides/profileupdate.php');

                          var data = {'user_id': Userid, 'profile_pic' : _image!= null ? 'data:image/png;base64,' +
                          base64Encode(_image!.readAsBytesSync()) : '', 'first_name' : firstname, 'last_name' : lastname};
                          var response = await http.post(urL, body: data); // REMOVED [email]

                          if (response.statusCode == 200) {

                            print ("Profile Updated Successfully");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => MyMapPage()));
                          }
                          else {
                            print (response.body);
                          }}
                              else {
                                print('Please Upload Image');
                              }}
                            else {
                              print('Please Enter Last Name');
                            }}
                          else {
                            print('Please Enter First Name');
                          }}

                      )
                  ),

                ],

              ),

            )
        )
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  _imgFromCamera() async {
    PickedFile  image = (await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    )) as PickedFile;

    setState(() {
      _image = image.path as File?;
    });
  }

  _imgFromGallery() async {
    PickedFile image = (await _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    )) as PickedFile;

    setState(() {
      _image = image.path as File?;
    });
  }
}
