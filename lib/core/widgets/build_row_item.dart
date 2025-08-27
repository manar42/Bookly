
import 'package:bookly/core/cubit/app_cubit.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowItem extends StatelessWidget {
  CustomRowItem({
  super.key,
  required this.iconData,
  required this.text,
  required this.arrowStatus,
  });
  final IconData iconData;
  final String text;
  bool arrowStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        children: [
          Icon(
              iconData,
              color: AppCubit.get(context).themeMode == false
                  ? Colors.grey
                  : Colors.white
          ),
          const SizedBox(width: 30.0),
          Text(
            text,
            style: Styles.textStyle18
          ),
          const Spacer(),
          Icon(
              arrowStatus ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppCubit.get(context).themeMode == false
                  ? Colors.grey
                  : Colors.white
          ),
        ],
      ),
    );
  }
}
