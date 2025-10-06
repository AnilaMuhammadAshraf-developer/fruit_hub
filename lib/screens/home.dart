import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/providers/product_provider.dart';
import 'package:fruit_hub/providers/user_provider.dart';
import 'package:fruit_hub/utils/app_asset.dart';
import 'package:fruit_hub/utils/app_color.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appWhiteColor,
        leading: IconButton(
          onPressed: () {
            print("button pressed");
          },
          icon: Image.asset(AppAsset.leadingIcon),
        ),
        title: Text(
          "Welcome, ${userProvider.userName}",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: AppColor.appMainColor),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for fruit salad combos',
                      hintStyle: TextStyle(color: AppColor.hintTextColor,fontSize:15),
                      filled: true,
                      fillColor: AppColor.appGreyColor,
                      prefixIcon: const Icon(Icons.search,color:AppColor.hintTextColor ,),
                      
                      
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appGreyColor),
                        borderRadius: BorderRadius.circular(12.r)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.appGreyColor),
                        borderRadius: BorderRadius.circular(12.r)
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                filterContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget filterContainer() {
    return Container(
      width: 50.w,
      height: 56.w,
      decoration: BoxDecoration(color: AppColor.searchFilterColor,
      borderRadius: BorderRadius.circular(12.r)
      ),
      
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(AppAsset.filterIcon),
      ),
    );
  }
}
