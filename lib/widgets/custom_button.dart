import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/utils/app_color.dart';

class CustomButton extends StatelessWidget{
  final String btnTitle;
  final Function() onClick;
  const CustomButton({super.key, required this.btnTitle,required this.onClick});
  
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onClick,
        child: Container(
          padding: EdgeInsets.all(10.w),
      
          decoration: BoxDecoration(
            color: AppColor.appMainColor,
            borderRadius: BorderRadius.circular(12.r)
           
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text(btnTitle,style: TextStyle(color: AppColor.appWhiteColor),)
          ],),
        ),
    );
  }

}