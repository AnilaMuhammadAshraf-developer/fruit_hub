import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/providers/user_provider.dart';
import 'package:fruit_hub/routes/app_route_name.dart';
import 'package:fruit_hub/utils/app_asset.dart';
import 'package:fruit_hub/utils/app_color.dart';
import 'package:fruit_hub/utils/app_navigation.dart';
import 'package:fruit_hub/utils/app_string.dart';
import 'package:fruit_hub/utils/app_validation.dart';
import 'package:fruit_hub/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget{
   const AuthenticationScreen({super.key});
   @override
   _AuthenticationScreenState createState() => _AuthenticationScreenState();
}
class _AuthenticationScreenState extends State<AuthenticationScreen>{
  final formKey=GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();

  void authSubmit(BuildContext context){
   final userProvider = Provider.of<UserProvider>(context, listen: false);
    if(formKey.currentState!.validate()){
      print("name:${firstNameController.text}");
      userProvider.setUserName(firstNameController.text);
      AppNavigation.pushTo(context,AppRouteName.HOME_SCREEN_ROUTE);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
    body: Container(
 
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            )
          ),
          child: Column(
            children: [
              topContainer(context),
              SizedBox(height:17.h),
              mainContainer(context),
                
            ],
          ),
        ),
    
    );
  }
  Widget topContainer(BuildContext context){
    return Container(
      height:450.h,
      width:MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColor.appMainColor,
       
  
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height:20.h),
          Padding(
            padding: EdgeInsets.only(top:20.w,left:190.w),
         child:Image.asset(AppAsset.fruitImg),
          ),

         Image.asset(AppAsset.basket2Img,width:250.w),
         SizedBox(height:10.h),
         Image.asset(AppAsset.trayImg),
      
        ],
      ),
    );

  }

   Widget mainContainer(BuildContext context){
    return Container(
      height:250.h,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.all(10.w),
      width:MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
       
    
  
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height:20.h),
          Text(AppString.authScreenQuestionText,style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height:10.h),
          Form(
            key: formKey,
            child:TextFormField(
              controller: firstNameController,
              validator:(value)=> AppValidation().isEmptyField(value,"First Name"),
              decoration:InputDecoration(
                hintText: "First Name",
                contentPadding: EdgeInsets.all(10.w),
                fillColor: AppColor.appGreyColor,
                filled: true,
                border: InputBorder.none,
                
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.appGreyColor
                  ),
                  borderRadius: BorderRadius.circular(12.r)
                ),
                 focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                    color: AppColor.appGreyColor
                  ),
                  borderRadius: BorderRadius.circular(12.r)
                )
                
                
              
               
                  

              )
            )
            ),
          Spacer(),
          Padding(padding: EdgeInsets.only(bottom: 10.h),
          child:CustomButton(btnTitle:AppString.authScreenBtnText, onClick:(context)=>authSubmit(context))
          ),
         

          
        ],
      ),
    );

  }
}