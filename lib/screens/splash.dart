import 'package:flutter/material.dart';
import 'package:fruit_hub/utils/app_asset.dart';


class SplashScreen extends StatefulWidget{
const SplashScreen({super.key});
@override
_SplashScreenState createState()=>_SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  Widget build(BuildContext context){
      return Scaffold(
        body:SafeArea(child:Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAsset.appLogo),
            ],
          )
        ))
      );
  }
}