import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/colors/colors.dart';

class SvgAsset extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final Color? color;
  const SvgAsset({super.key, required this.imagePath, required this.width, required this.height,  this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      width: width.w,
      height: height.h,
      color: color??null,
    );
  }
}
