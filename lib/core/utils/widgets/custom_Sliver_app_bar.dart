import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postapp/core/extensions/context_extension.dart';

import '../../style/colors/colors.dart';
import '../../style/text_styles/text_styles.dart';
class CustomSliverAppBar extends StatelessWidget {
  final String? title;
  final VoidCallback? onBackPress;
  final bool? justSpace;

  CustomSliverAppBar({
    Key? key,
     this.title,
    this.onBackPress,  this.justSpace=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTrue =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
    return SliverAppBar(
      toolbarHeight: isTrue ? 50.sp : 70.sp,
      expandedHeight: isTrue ? 50.sp : 70.sp,
      pinned: true,
      floating: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  justSpace!?SizedBox():Container(
                    margin: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20.sp,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        if(onBackPress!=null) onBackPress!();
                        else {
                          context.pop();
                        }
                      },
                    ),
                  ),
                  Text(
                    title??"",
                    style: TextStyles.font18DarkBlueBold.copyWith(fontSize: 20.sp),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      surfaceTintColor: ColorsManager.secondaryColor ,

    );
  }
}