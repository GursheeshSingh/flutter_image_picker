import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color kDarkGray = Color(0xFFA3A3A3);

class CustomDialog {
  static void show(context, String heading, String subHeading,
      String positiveButtonText, Function onPressedPositive,
      [String negativeButtonText, Function onPressedNegative]) {
    if (Platform.isIOS) {
      // iOS-specific code
      showCupertinoDialog(
        context: context,
        useRootNavigator: false,
        builder: (_) => CupertinoAlertDialog(
          title: Text(
            heading,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            subHeading,
            style: TextStyle(
              color: kDarkGray,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                negativeButtonText ?? 'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            FlatButton(
              onPressed: onPressedPositive,
              child: Text(positiveButtonText),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        useRootNavigator: false,
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            heading,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            subHeading,
            style: TextStyle(
              color: kDarkGray,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                if (onPressedNegative != null) {
                  onPressedNegative();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text(
                negativeButtonText ?? 'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            FlatButton(
              onPressed: onPressedPositive,
              child: Text(positiveButtonText),
            ),
          ],
        ),
      );
    }
  }
}
