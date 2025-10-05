import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_hub/routes/app_route_name.dart';
import 'package:fruit_hub/utils/app_asset.dart';
import 'package:fruit_hub/utils/app_navigation.dart';


class SplashScreen extends StatefulWidget{
const SplashScreen({super.key});
@override
_SplashScreenState createState()=>_SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

   @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInExpo,
    );

    _controller.forward();

  
    Timer(const Duration(seconds: 3), () {
        AppNavigation.pushReplacement(context,AppRouteName.WELCOME_SCREEN_ROUTE);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
      return Scaffold(
        body:SafeArea(
          child:Center(child: FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: _animation,
          child:Image.asset(AppAsset.appLogo)
          ),
            
          ),
          )
        )
      );
  }
}