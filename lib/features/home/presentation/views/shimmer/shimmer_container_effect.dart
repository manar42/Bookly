import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainerEffect extends StatelessWidget {
  const ShimmerContainerEffect({Key? key,  this.width,  this.height, this.borderRadius}) : super(key: key);

  final double? width;
  final double? height;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:  Theme.of(context).brightness == Brightness.dark
          ? Colors.white.withOpacity(.7) : Colors.grey.withOpacity(.7),
      highlightColor:Theme.of(context).brightness == Brightness.dark
          ? Colors.white : Colors.grey.shade300,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
      ),
    );
  }
}