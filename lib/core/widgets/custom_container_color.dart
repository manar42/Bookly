
import 'package:bookly/core/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerColor extends StatelessWidget {
  const ContainerColor({
  super.key,
  required this.index,
  required this.color,
  });

  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
      child: InkWell(
        onTap: () {
          AppCubit.get(context).changePrimaryColorIndex(index, color);
        },
        child: Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: index == AppCubit.get(context).primaryColorIndex
              ? const Icon(Icons.done, color: Colors.white, size: 15)
              : null,
        ),
      ),
    );
  }
}
