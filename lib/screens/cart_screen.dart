import 'package:cart/main.dart';
import 'package:cart/utils/widgets/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/main_controller.dart';
import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LocationSection(mainController: mainController),
              SizedBox(height: 3.h),
              Obx((() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cart", style: appStyles.title),
                    mainController.itemsList.isEmpty
                        ? Text(
                            "\$ 0",
                            style: appStyles.title,
                          )
                        : Text(
                            "\$ ${mainController.total}",
                            style: appStyles.title,
                          ),
                  ],
                );
              })),
              SizedBox(height: 5.h),
              Obx(
                (() {
                  return mainController.itemsList.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              "No Items Added",
                              style: appStyles.title,
                            ),
                          ),
                        )
                      : CartProducts();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
