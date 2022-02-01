import 'package:flutter/material.dart';
import 'package:workport/NeoText.dart';

import 'app_data.dart';

Widget statusBar(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).padding.top,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(color: AppData.mainBlue),
  );
}

Widget appText(
    {  String? title,
       FontWeight? fontWeight,
       double? fontSize,
       int? maxLines,
       Color? color,
       FontStyle? fontStyle
    }) {
  return Text(
    title!,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: themeFont,
        color: color,
        fontStyle: fontStyle,
        ),
  );
}


Widget settingsHeading(
    { String? title,
      dynamic controller,
      FontWeight? fontWeight,
      Function? onTap,
      VoidCallback? onCustomTextPressed,
      double? fontSize,
      int? maxLines,
      Color? color,
      FontStyle? fontStyle,
      TextAlign? textAlign, recognizer,
      InkWell? inkWell

    }) {
  return Text(
    title!,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
   /* onTap: onCustomTextPressed,*/
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: themeFont,
      color: color,
      fontStyle: fontStyle

    ),

  );

/*  return Text(
    title!,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
   *//* onTap: onCustomTextPressed,*//*
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: themeFont,
        color: color,
        fontStyle: fontStyle

    ),
  );*/

  /*Gaurav code bottom*/
/*  return Text(
    title!,
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
    // \onTap: onCustomTextPressed,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: themeFont,
        color: color,
        fontStyle: fontStyle

    ),
  );*/
 }

Widget customMainAppBar(
    { onPressed, IconData? icon, trailing, String? title}) {
  return Container(
    color: AppData.themered,
    child: ListTile(
      title: Text(
        title!,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: AppData.white),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      leading: Material(
        color: Colors.transparent,
        // color: AppData.white,
        child: InkWell(
            child: Icon(icon, color: AppData.white, size: 25)),
      ),
      trailing: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Icon(trailing, color: AppData.white, size: 25)),
      ),
    ),
  );
}

Widget customButton(
    {String? title,
      VoidCallback? onCustomButtonPressed,
      Color? color,
      required Color borderColor,
      Color? textColor,
      double? margin,
      double? textSize,
      dynamic width,
      double? radius}) {
  return InkWell(
    // onTap: onTap,
    onTap: onCustomButtonPressed ,
    child: Container(
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: margin ?? 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: Border.all(
          color: borderColor,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: Text(
        title!,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontFamily: themeFont,
          fontSize: textSize ?? 18,
          letterSpacing: 0.5,
        ),
      ),
    ),
  );
}
Widget textField_edit_no({
  dynamic controller,
  String? title,
  IconData? icon,
  Widget? suffix,
  bool? isPassword,
  bool? readyOnly,
  bool? enabled,
  VoidCallback? onCustomButtonPressed,

  // int maxline,
  // int minline,
  TextInputType? keyboardType,
}) {
  return InkWell(
    // height: 60,
    onTap: onCustomButtonPressed ,
    child: TextFormField(
      controller: controller,
      validator: (val) => val!.isNotEmpty ? null : '$title Should Not Be Empty',
      keyboardType: keyboardType,
      obscureText: isPassword ?? false,
      readOnly: readyOnly ?? true,
      enabled: enabled ?? false,
      decoration: InputDecoration(
        suffix: suffix,
        isDense: true,
        hintText: 'Enter $title',
        labelText: title,
        labelStyle: TextStyle(color: Colors.black),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
      ),
    ),
  );
}

Widget textField({
  dynamic controller,
  String? title,
  IconData? icon,
  Widget? suffix,
  bool? isPassword,

  VoidCallback? onCustomButtonPressed,

  // int maxline,
  // int minline,
  TextInputType? keyboardType,
}) {
  return InkWell(
    // height: 60,
    onTap: onCustomButtonPressed ,
    child: TextFormField(
      controller: controller,
      validator: (val) => val!.isNotEmpty ? null : '$title Should Not Be Empty',
      keyboardType: keyboardType,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        suffix: suffix,
        isDense: true,
        hintText: 'Enter $title',
        labelText: title,
        labelStyle: TextStyle(color: Colors.black),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
      ),
    ),
  );
}

