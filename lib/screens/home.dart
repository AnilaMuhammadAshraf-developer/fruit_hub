import 'package:flutter/material.dart';
import 'package:fruit_hub/providers/product_provider.dart';
import 'package:fruit_hub/providers/user_provider.dart';
import 'package:fruit_hub/utils/app_asset.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    final userProvider = Provider.of<UserProvider>(context);
     final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar:AppBar(
        leading:IconButton(onPressed:(){print("button pressed");}, icon:Image.asset(AppAsset.leadingIcon)),
        title: Text(userProvider.userName),
        actions: [
          IconButton(onPressed:(){}, icon:Image.asset(AppAsset.cartIcon))
        ],
      ) ,
    );
  }
}