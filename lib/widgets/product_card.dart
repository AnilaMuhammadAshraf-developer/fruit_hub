import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final VoidCallback onFavoriteTap;
  final VoidCallback onAddTap;
  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.onFavoriteTap,
    required this.onAddTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      margin: EdgeInsets.all(8.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: onFavoriteTap,
              child: Icon(
                Icons.favorite_border,
                color: Colors.orangeAccent,
                size: 22.sp,
              ),
            ),
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(60.r),
            child: Image.network(
              imageUrl,
              width: 90.w,
              height: 90.w,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 10.h),

          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 6.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price.toString(),
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.orangeAccent,
                ),
              ),
              GestureDetector(
                onTap: onAddTap,
                child: Container(
                  width: 26.w,
                  height: 26.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orangeAccent.withOpacity(0.15),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.orangeAccent,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
