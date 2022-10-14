import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.category,
    required this.color,
    this.page,
    Key? key,
  }) : super(key: key);
  final String? category;
  final Color? color;
  final Object? page;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.to(page!);
            },
            child: Container(
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                color: color!,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Icon(
                Ionicons.fast_food_outline,
                color: appColors.whiteColor,
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            width: 15.w,
            child: Text(
              "$category",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: appStyles.smallBodyFont.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
