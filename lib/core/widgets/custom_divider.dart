
import 'package:bookly/core/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Container(
        width: 200.w,
        height: 3.0.h,
        decoration: BoxDecoration(
            color: AppCubit.get(context).primaryColor,
            borderRadius: BorderRadius.circular(15)
        ),
      ),
    );  }
}
