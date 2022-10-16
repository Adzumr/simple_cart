import 'package:cart/controller_binding.dart';
import 'package:cart/screens/bottom_navigation.dart';
import 'package:cart/utils/colors.dart';
import 'package:cart/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(const CartApp());
}

final appColors = AppColors();
final appStyles = AppStyles();

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return GetMaterialApp(
          initialBinding: ControllerBindings(),
          debugShowCheckedModeBanner: false,
          title: 'Simple Cart',
          theme: ThemeData(
            primaryColor: appColors.redColor,
            textTheme: TextTheme(
              bodyText2: appStyles.bodyFont,
            ),
          ),
          home: const BottomNavigationScreen(),
        );
      }),
    );
  }
}
