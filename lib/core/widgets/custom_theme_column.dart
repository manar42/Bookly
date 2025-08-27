
import 'package:bookly/core/cubit/app_cubit.dart';
import 'package:bookly/core/utils/extensions_methods.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_container_color.dart';

class CustomThemeOptionColumn extends StatelessWidget {
  const CustomThemeOptionColumn({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
          Text(
          "accentColor".translate(context: context),
          style: Styles.textStyle14,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15.0.h),
        SizedBox(
          height: 25.h,
          child: ListView.builder(
              itemCount:AppCubit.get(context).defaultColors.length ,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return ContainerColor(
                    index: index,
                    color:AppCubit.get(context).defaultColors[index]
                );
              }),
        ),
      ],
    );
  }
}
