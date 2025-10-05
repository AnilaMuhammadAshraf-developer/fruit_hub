import 'package:flutter/material.dart';

class AppNavigation {
  
static void pop(BuildContext context) async {
   Navigator.of(context).pop();   
  }

  static void pushTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void pushReplacement(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

   static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static void doubleGoBack(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }

    static void pushToScreen(
    BuildContext context,Widget screen
      ) async {
    Navigator.push(context,MaterialPageRoute(builder: (context)=>screen));
  }
}
