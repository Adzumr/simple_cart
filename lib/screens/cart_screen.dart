import 'dart:math';

import 'package:cart/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../controller/main_controller.dart';
import 'home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LocationSection(mainController: mainController),
              SizedBox(height: 3.h),
              Text("Cart", style: appStyles.title),
              SizedBox(height: 5.h),
              Expanded(
                child: ListView.builder(
                  itemCount: mainController.cartList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final color = Colors
                        .primaries[Random().nextInt(Colors.primaries.length)];
                    final cart = mainController.cartList[index];
                    return Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          margin: EdgeInsets.symmetric(vertical: 5.sp),
                          decoration: BoxDecoration(
                            color: color.withOpacity(.5),
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: Icon(
                            Ionicons.fast_food_outline,
                            color: appColors.whiteColor,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${cart.product}",
                              style: appStyles.bodyFont.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              "3 Units",
                              style: appStyles.smallBodyFont,
                            ),
                            SizedBox(height: 0.5.h),
                            Text("\$ ${cart.price}",
                                style: appStyles.title.copyWith(
                                  color: appColors.redColor,
                                )),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 30.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(4.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: appColors.fishColor,
                                  ),
                                  child: const Icon(
                                    Ionicons.remove,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Text(
                                  "${cart.quantity}",
                                  style: appStyles.title.copyWith(
                                    color: appColors.blackColor,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(4.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: appColors.fishColor,
                                  ),
                                  child: const Icon(
                                    Ionicons.add,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
