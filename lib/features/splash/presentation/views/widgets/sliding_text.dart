import 'package:bookly/core/cubit/app_cubit.dart';
import 'package:bookly/core/utils/extensions_methods.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';


class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              "readFreeBooks".translate(context: context),
              textAlign: TextAlign.center,
              style: Styles.textStyle14
                  .copyWith(color: AppCubit.get(context).primaryColor),
            ),
          );
        });
  }
}
