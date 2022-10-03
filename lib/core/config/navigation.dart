import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Classed used for navigation in the app
class Navigation {
  /// Function to go to previous screen
  static back(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      SystemNavigator.pop();
    }
  }

  /// Function to navigate to new screen without data passing
  static intent(BuildContext context, String nameRouted) {
    Navigator.pushNamed(context, nameRouted);
  }

  /// Function to navigate to new screen by replacing it with new screen
  static intentWithoutBack(
      BuildContext context, String nameRouted, Object argumentClass) {
    Navigator.pushReplacementNamed(context, nameRouted,
        arguments: argumentClass);
  }


  /// Function to navigate to new screen and passing some data
  static intentWithData(
      BuildContext context, String nameRouted, Object? argumentClass) {
    Navigator.pushNamed(context, nameRouted, arguments: argumentClass);
  }
}
