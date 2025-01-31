import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MyFun {
  static navigatToPage(context, Widget pageName) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
  }

  static navigatToPagewithoutBack(context, Widget pageName) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => pageName),
        (Route<dynamic> route) => false);
  }

  static bool isMobiledevice() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return true;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return true;
    } else {
      return false;
    }
  }
}
