import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/providers/product_provider.dart';
import 'package:fruit_hub/providers/user_provider.dart';
import 'package:fruit_hub/utils/app_asset.dart';
import 'package:fruit_hub/utils/app_color.dart';
import 'package:fruit_hub/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
 Widget getProducts(ProductProvider productProvider) {
  return FutureBuilder(
    future: productProvider.fetchProducts(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColor.appMainColor,
          ),
        );
      } else if (snapshot.hasError) {
        return Center(child: Text("Error: ${snapshot.error}"));
      } else {
     
        final products = productProvider.products;

        if (products.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              imageUrl: product.image,
              title: product.title,
              price: product.price,
              onFavoriteTap: () {
                print("favourite tap here");
              },
              onAddTap: () {
                print("add tap here");
              },
            );
          },
        
        );
      }
    },
  );
}
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
      child:Container(
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
                      hintStyle: TextStyle(
                        color: AppColor.hintTextColor,
                        fontSize: 15,
                      ),
                      filled: true,
                      fillColor: AppColor.appGreyColor,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColor.hintTextColor,
                      ),

                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appGreyColor),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.appGreyColor),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                filterContainer(),
              ],
            ),
            const SizedBox(height:10),
            Consumer<ProductProvider>(builder:(context,productProvider,child){
             return categories(productProvider);
            }),
            const SizedBox(height: 20),
            Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
                return recommendedCombo(context, productProvider);
              },
            ),
             SizedBox(height:7.h),
              Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
              return  tabContainer(productProvider);
            }),
            SizedBox(height:10.h)
          ],
        ),
      ),
      )
    );
  }

  Widget filterContainer() {
    return Container(
      width: 50.w,
      height: 56.w,
      decoration: BoxDecoration(
        color: AppColor.searchFilterColor,
        borderRadius: BorderRadius.circular(12.r),
      ),

      child: IconButton(
        onPressed: () {},
        icon: Image.asset(AppAsset.filterIcon),
      ),
    );
  }

  Widget recommendedCombo(BuildContext context, productProvider) {
    return Container(
      height: 270.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
      
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
            "Recommended Combo",
            style: TextStyle(fontSize: 16.sp,),
          ),
            Container(
            width: 50.w,
            child: Divider(
              color: AppColor.appMainColor,
              thickness: 1,
              height: 3,
            ),
          ),
          ],)
          
        ),
          
          SizedBox(
           height: 235.h,
         
          child:getProducts(productProvider),
        ),
      
        
     
       
       
              
            
          
          
        ],
      ),
                   
        
       
    );
  }


  Widget categories(productProvider){
    return SizedBox(
      height: 60.h,
      child: FutureBuilder(
              future: productProvider.fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.appMainColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else {
                  print("this is products: ${snapshot.data}");
                  final categories = productProvider.backendCategories;
                  if (categories.isEmpty) {
                    return const Center(child: Text("No categories found."));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:categories.length ,
                    itemBuilder:(context,index){
                     var item=categories[index];
                     return Container(
                      margin: EdgeInsets.all(8.w),
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(color: AppColor.appWhiteColor,
                      borderRadius: BorderRadius.circular(8.r),
                       boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2, 
                          blurRadius: 7, 
                          offset: Offset(0, 3),
                        ),
                      ],
                      ),
                      child:Text(item)
                     );
                  });
                }})
    );
  }

  Widget tabContainer(productProvider) {
  return SizedBox(
    height: 266.h,
   child:DefaultTabController(
      
      length: 3,
      child: Column(
        children: [
          const TabBar(
            dividerColor: AppColor.appWhiteColor,
            unselectedLabelColor: Color(0xff253F66),
            indicatorColor: AppColor.appMainColor,
            tabs: [
              Tab(text: 'Hottest'),
              Tab(text: 'Popular'),
              Tab(text: 'New Combo'),
            ],
          ),
           Expanded(
            child: TabBarView(
              children: [
             getProducts(productProvider),
              getProducts(productProvider),
                   getProducts(productProvider),
        
              ],
            ),
          ),
        ],
      ),
    
    )
  );
}

}
