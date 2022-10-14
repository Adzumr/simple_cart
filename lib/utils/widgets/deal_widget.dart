import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class DealWidget extends StatelessWidget {
  const DealWidget({
    Key? key,
    required this.color,
    required this.quantity,
    required this.price,
    required this.name,
    required this.isFavorite,
  }) : super(key: key);

  final MaterialColor color;
  final String? name;
  final int? quantity;
  final int? price;
  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 75.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color.withOpacity(.5),
                ),
                child: Icon(
                  Ionicons.fast_food_outline,
                  color: appColors.whiteColor,
                  size: 50.sp,
                ),
              ),
              SizedBox(width: 2.w),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "$name",
                      style: appStyles.smallBodyFont.copyWith(
                        fontWeight: FontWeight.bold,
                        color: appColors.blackColor,
                      ),
                    ),
                    Text(
                      "Piece $quantity",
                      style: appStyles.smallBodyFont.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 9.sp,
                        color: appColors.blackColor,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$ $price",
                          style: appStyles.bodyFont.copyWith(
                            fontWeight: FontWeight.bold,
                            // fontSize: 9.sp,
                            color: appColors.redColor,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "\$ ${price! + (price! * 0.45)}",
                          style: appStyles.bodyFont.copyWith(
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.lineThrough,
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
          child: Icon(
            isFavorite == true ? Icons.favorite : Icons.favorite_outline,
            color: appColors.redColor,
            size: 12.sp,
          ),
        ),
      ],
    );
  }
}
