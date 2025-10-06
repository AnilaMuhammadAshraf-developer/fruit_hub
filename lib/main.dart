import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/providers/product_provider.dart';
import 'package:fruit_hub/providers/user_provider.dart';
import 'package:fruit_hub/routes/app_route_name.dart';
import 'package:fruit_hub/routes/app_router.dart';
import 'package:fruit_hub/utils/app_color.dart';
import 'package:fruit_hub/utils/app_string.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),     
         ChangeNotifierProvider(create: (_) => ProductProvider()),    
      ],
      child: const MyApp(),
    ),
  );
 
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return  ScreenUtilInit(
      designSize: Size(375, 812), 
      minTextAdapt: true,       
      splitScreenMode: true,  
      builder: (context, child) {
       return  MaterialApp(
        navigatorKey: GlobalContext.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: AppString.appTitle,
      theme:ThemeData(
        scaffoldBackgroundColor: AppColor.appWhiteColor
      ),
      initialRoute: AppRouteName.SPLASH_SCREEN_ROUTE,
      onGenerateRoute: AppRouter.onGenerateRoute, 
     
      
     
      
    );

      },
       child: SizedBox(),
      
    );
    
  
  }
}

class GlobalContext {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? get context => navigatorKey.currentContext;
}
