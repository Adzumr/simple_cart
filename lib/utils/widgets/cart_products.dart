import 'package:cart/controller/main_controller.dart';
import 'package:cart/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class CartProducts extends StatelessWidget {
  CartProducts({super.key});
  final MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() {
        return Flexible(
          child: ListView.builder(
            itemCount: mainController.itemsList.length,
            itemBuilder: (BuildContext context, int index) {
              return CartItem(
                index: index,
                mainController: mainController,
                cartModel: mainController.itemsList.keys.toList()[index],
                quantity: mainController.itemsList.values.toList()[index],
              );
            },
          ),
        );
      }),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.index,
    required this.mainController,
    required this.cartModel,
    required this.quantity,
  }) : super(key: key);

  final int? index;
  final MainController? mainController;
  final CartModel? cartModel;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(15.sp),
          margin: EdgeInsets.symmetric(vertical: 5.sp),
          decoration: BoxDecoration(
            color: appColors.juiceColor.withOpacity(.5),
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
              "${cartModel!.product}",
              style: appStyles.bodyFont.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 0.5.h),
            Text(
              "$quantity Units",
              style: appStyles.smallBodyFont,
            ),
            SizedBox(height: 0.5.h),
            Text(
              "\$ ${cartModel!.price! * quantity!}",
              style: appStyles.title.copyWith(
                color: appColors.redColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: 30.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  mainController!.removeItem(cartModel);
                  mainController!.update();
                },
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
                  "$quantity",
                  style: appStyles.title.copyWith(
                    color: appColors.blackColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  mainController!.addItem(cartModel);
                  mainController!.update();
                },
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
  }
}
