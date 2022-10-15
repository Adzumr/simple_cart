import 'dart:math';

import 'package:cart/controller/main_controller.dart';
import 'package:cart/main.dart';
import 'package:cart/models/cart_model.dart';
import 'package:cart/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../utils/widgets/address_widget.dart';
import '../utils/widgets/category_widget.dart';
import '../utils/widgets/deal_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();
    final searchController = TextEditingController();

    return Scaffold(
      body: Obx(
        () {
          return mainController.appDataModel.value == null
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.sp, horizontal: 15.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LocationSection(mainController: mainController),
                        SizedBox(height: 3.h),
                        SearchWidget(
                          searchController: searchController,
                        ),
                        SizedBox(height: 3.h),
                        AddressSection(mainController: mainController),
                        SizedBox(height: 3.h),
                        CategorySection(mainController: mainController),
                        SizedBox(height: 3.h),
                        DealsSection(mainController: mainController),
                        SizedBox(height: 3.h),
                        Container(
                          height: 15.h,
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            color: appColors.steckColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Ionicons.fast_food_outline,
                                color: appColors.whiteColor,
                                size: 50.sp,
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${mainController.appDataModel.value!.offers!.product}",
                                    style: appStyles.bodyFont.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: appColors.redColor),
                                  ),
                                  Text(
                                    "WHOPPER",
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Row(
                                    children: [
                                      Text(
                                        "\$ ${mainController.appDataModel.value!.offers!.price}",
                                        style: appStyles.title.copyWith(
                                          color: appColors.redColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        "\$ ${mainController.appDataModel.value!.offers!.price! + (mainController.appDataModel.value!.offers!.price! * 0.6)}",
                                        style: appStyles.title.copyWith(
                                          color: appColors.whiteColor,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "* Available until ${mainController.appDataModel.value!.offers!.date}",
                                    style: appStyles.smallBodyFont.copyWith(
                                      color: appColors.whiteColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
    required this.mainController,
  }) : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explore by category",
              style: appStyles.title,
            ),
            Text(
              "See all",
              style: appStyles.smallBodyFont,
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mainController.appDataModel.value!.category!.length,
            itemBuilder: (BuildContext context, int index) {
              final color =
                  Colors.primaries[Random().nextInt(Colors.primaries.length)];
              final category =
                  mainController.appDataModel.value!.category![index];
              return CategoryWidget(
                category: "${category.product}",
                color: color.withOpacity(.5),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return CartDialog(
                        category: category,
                        mainController: mainController,
                      );
                    }),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class CartDialog extends StatelessWidget {
  const CartDialog({
    Key? key,
    required this.category,
    required this.mainController,
  }) : super(key: key);

  final Category category;
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add to Cart?"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              text: "Item: ",
              style: appStyles.title,
              children: [
                TextSpan(
                  text: "${category.product}",
                  style: appStyles.title.copyWith(color: appColors.redColor),
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "Price: ",
              style: appStyles.title,
              children: [
                TextSpan(
                  text: "\$${category.price}",
                  style: appStyles.title.copyWith(color: appColors.redColor),
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "Quantity: ",
              style: appStyles.title,
              children: [
                TextSpan(
                  text: "1",
                  style: appStyles.title.copyWith(color: appColors.redColor),
                )
              ],
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            try {
              mainController.cartList.add(
                CartModel(
                  price: category.price,
                  product: category.product,
                  quantity: 3,
                ),
              );
            } finally {
              Navigator.pop(context);
            }
          },
          child: const Text("Yes"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("No"),
        ),
      ],
    );
  }
}

class LocationSection extends StatelessWidget {
  const LocationSection({
    Key? key,
    required this.mainController,
  }) : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                Ionicons.location_outline,
                size: 15.sp,
                color: Colors.white,
              ),
              SizedBox(width: 2.w),
              SizedBox(
                width: 35.w,
                child: Text(
                  "${mainController.userModel.value!.homeAddress}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(2.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

class DealsSection extends StatelessWidget {
  const DealsSection({
    Key? key,
    required this.mainController,
  }) : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deals of the day",
          style: appStyles.title,
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 14.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mainController.appDataModel.value!.deals!.length,
            itemBuilder: (BuildContext context, int index) {
              final color =
                  Colors.primaries[Random().nextInt(Colors.primaries.length)];
              final deal = mainController.appDataModel.value!.deals![index];
              return DealWidget(
                color: color,
                name: deal.product,
                quantity: deal.quantity,
                price: deal.price!,
                isFavorite: deal.isFavorite,
              );
            },
          ),
        ),
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      onEditingComplete: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onFieldSubmitted: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: "Search in thousands of products",
        hintStyle: appStyles.smallBodyFont.copyWith(
          fontWeight: FontWeight.bold,
        ),
        border: appStyles.enableInputBorder,
        enabledBorder: appStyles.enableInputBorder,
        focusedBorder: appStyles.enableInputBorder,
      ),
    );
  }
}
