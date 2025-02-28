

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postapp/core/extensions/context_extension.dart';
import 'package:postapp/features/home/data/models/post_model.dart';
import 'package:postapp/features/home/logic/get_all_posts_cubit/get_all_posts_cubit.dart';

import '../../../../../core/common/spacing.dart';
import '../../../../../core/routes/app_route.dart';
import '../../../../../core/style/colors/colors.dart';
import '../../../../../core/style/text_styles/text_styles.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/utils/widgets/error_handler_uI.dart';
import '../../../../../core/utils/widgets/logo_row_widget.dart';

class PostCard extends StatelessWidget {
  final PostModel postModel;
  const PostCard({
    super.key, required this.postModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: LogoRowWidget(
                  textStyle: TextStyles.font15black500,
                  text: 'Youssef ahmed ',
                  imagePath: "assets/core/person.png",
                  imageHeight: 50,
                ),
              ),
              Text(
                '9:00 pm',
                style: TextStyles.font13BlueRegular
                    .copyWith(color: Colors.grey),
              )
            ],
          ),
          verticalSpace(10),
          Text(
            postModel.title!,
            style: TextStyles.font18Black700,
          ),
          verticalSpace(10),
          Text(
            postModel.body!,
            style: TextStyles.font12blackRegular,
          ),
        ],
      ),
    );
  }
}