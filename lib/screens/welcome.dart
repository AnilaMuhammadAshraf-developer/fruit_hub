import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/routes/app_route_name.dart';
import 'package:fruit_hub/utils/app_asset.dart';
import 'package:fruit_hub/utils/app_color.dart';
import 'package:fruit_hub/utils/app_navigation.dart';
import 'package:fruit_hub/utils/app_string.dart';
import 'package:fruit_hub/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  void moveToNextScreen(BuildContext context) {
    print("this is print");
    AppNavigation.pushTo(context, AppRouteName.AUTHENTICATION_SCREEN_ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: [
            topContainer(context),
            SizedBox(height: 17.h),
            mainContainer(context),
          ],
        ),
      ),
    );
  }

  Widget topContainer(BuildContext context) {
    return Container(
      height: 450.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColor.appMainColor,

        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(20.r),
        //   topRight: Radius.circular(20.r)
        // )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(top: 20.w, left: 190.w),
            child: Image.asset(AppAsset.fruitImg),
          ),

          Image.asset(AppAsset.basketImg, width: 250.w),
          SizedBox(height: 10.h),
          Image.asset(AppAsset.trayImg),
        ],
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    return Container(
      height: 250.h,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.all(10.w),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            AppString.welcomeMainHeading,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            AppString.welcomeParagraph,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: CustomButton(
              btnTitle: AppString.welcomeScreenBtnText,
              onClick: (context) => moveToNextScreen(context),
            ),
          ),
        ],
      ),
    );
  }
}
