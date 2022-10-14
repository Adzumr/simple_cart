import 'package:cart/controller/main_controller.dart';
import 'package:cart/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../utils/widgets/address_widget.dart';
import '../utils/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();
    final searchController = TextEditingController();

    return Scaffold(body: Obx(
      () {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
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
                ),
                SizedBox(height: 4.h),
                SearchWidget(
                  searchController: searchController,
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AddressWidget(
                      address: "${mainController.userModel.value!.homeAddress}",
                      addressType: "Home",
                    ),
                    SizedBox(width: 3.w),
                    AddressWidget(
                      address:
                          "${mainController.userModel.value!.officeAddress}",
                      addressType: "Office",
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                const CategorySection(),
                SizedBox(height: 3.h),
                Text(
                  "Deals of the day",
                  style: appStyles.title,
                ),
                SizedBox(height: 1.h),
                SizedBox(
                  height: 14.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        mainController.appDataModel.value!.offers!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final offer =
                          mainController.appDataModel.value!.offers![index];
                      return Stack(
                        children: [
                          SizedBox(
                            width: 70.w,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: appColors.steckColor,
                                  ),
                                  child: Icon(
                                    Ionicons.fast_food_sharp,
                                    color: appColors.whiteColor,
                                    size: 50.sp,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "${offer.product}",
                                        style: appStyles.smallBodyFont.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: appColors.blackColor,
                                        ),
                                      ),
                                      Text(
                                        "Piece 5",
                                        style: appStyles.smallBodyFont.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9.sp,
                                          color: appColors.blackColor,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "\$ ${offer.price}",
                                            style: appStyles.bodyFont.copyWith(
                                              fontWeight: FontWeight.bold,
                                              // fontSize: 9.sp,
                                              color: appColors.redColor,
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            "\$ ${offer.price! + (offer.price! * 0.4)}",
                                            style: appStyles.bodyFont.copyWith(
                                              fontWeight: FontWeight.w900,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: appColors.whiteColor,
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.favorite,
                                color: appColors.redColor,
                                size: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
  }) : super(key: key);

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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CategoryWidget(
                category: "Steck",
                color: appColors.steckColor,
              ),
              CategoryWidget(
                category: "Vegetables",
                color: appColors.vegetableColor,
              ),
              CategoryWidget(
                category: "Beverages",
                color: appColors.beverageColor,
              ),
              CategoryWidget(
                category: "Fish",
                color: appColors.fishColor,
              ),
              CategoryWidget(
                category: "Juice",
                color: appColors.juiceColor,
              ),
            ],
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
