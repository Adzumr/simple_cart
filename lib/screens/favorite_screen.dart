import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: const Center(
            child: Text("Favorite Screen"),
          ),
        ),
      ),
    );
  }
}
