import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    Key? key,
    required this.addressType,
    required this.address,
  }) : super(key: key);

  final String? addressType;
  final String? address;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 8.h,
        padding: EdgeInsets.symmetric(vertical: 1.sp, horizontal: 5.sp),
        decoration: BoxDecoration(
          color: appColors.redColor.withOpacity(.04),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: appColors.shadowColor.withOpacity(.3),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: appColors.shadowColor.withOpacity(.3),
              ),
              child: Icon(
                Ionicons.location_outline,
                size: 15.sp,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$addressType Addre:",
                      style: appStyles.smallBodyFont.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 9.sp,
                        color: appColors.blackColor,
                      ),
                    ),
                    Text(
                      "$address" * 3,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: appStyles.smallBodyFont.copyWith(fontSize: 9.sp),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
