
import 'package:bookly/core/cubit/app_cubit.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOptionRow extends StatelessWidget {
  CustomOptionRow({
  super.key,
  required this.title,
  required this.icon,
  required this.isActive,
  required this.onChange
  });

  final IconData icon;
  final String title;
  bool isActive;
  Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 6.0.h,horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                  icon,
                  color:
                  AppCubit.get(context).themeMode == false
                      ? Colors.grey
                      : Colors.white
              ),
               SizedBox(width: 25.w,),
              Text(
                  title,
                  style: Styles.textStyle14
              ),
            ],
          ),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor:AppCubit.get(context).primaryColor,
                value: isActive,
                onChanged:onChange ,
              ))
        ],
      ),
    );
  }
}
