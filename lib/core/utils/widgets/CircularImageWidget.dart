import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularImageWidget extends StatelessWidget {
  final double height;
  final String imagePath;
  final bool isNetworkImage;
  final Color? borderColor;

  const CircularImageWidget({
    Key? key,
    required this.height,
    required this.imagePath,
    this.isNetworkImage = false,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.sp,
      width: height.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderColor != null ? 0.5.sp : 0.sp,
        ),
      ),
      child: ClipOval(
        child: isNetworkImage
            ? CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.cover, // Ensures the image covers the entire area
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            color: Colors.red,
            size: height / 2,
          ),
        )
            : Image.asset(
          imagePath,
          fit: BoxFit.cover, // Ensures the image covers the entire area
        ),
      ),
    );
  }
}
