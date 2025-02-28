import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/text_styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final bool? isTextStart;
  final bool ?isSelected;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed, this.backgroundColor, this.isTextStart, this.isSelected, this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
             backgroundColor ?? Color(0xFF006633), // Start color
              backgroundColor ?? Color(0xFF96B032),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: isSelected == true ? Colors.white:Colors.transparent ,
          )
        ),
        padding:  EdgeInsets.symmetric(horizontal: 24.0.r, vertical: 15.0.r),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: isTextStart == true ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle ?? TextStyles.font17white600,
            ),
          ],
        ),
      ),
    );
  }
}
