import 'dart:developer';

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
  getTotal() {
    var sum = 0;
    var givenList = mainController.itemsList;

    for (var e in givenList.keys) {
      sum += e as int;
    }

    log("total: $sum");
  }

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
              Text("Cart", style: appStyles.title),
              SizedBox(height: 5.h),
              CartProducts(),
              TextButton(
                  onPressed: () {
                    getTotal();
                  },
                  child: const Text("Get total"))
            ],
          ),
        ),
      ),
    );
  }
}
