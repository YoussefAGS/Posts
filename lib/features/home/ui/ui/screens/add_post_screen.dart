import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:postapp/core/extensions/context_extension.dart';
import 'package:postapp/core/utils/widgets/show_loading.dart';
import 'package:postapp/features/home/logic/add_new_post_cubit/add_new_post_cubit.dart';

import '../../../../../core/common/spacing.dart';
import '../../../../../core/style/text_styles/text_styles.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/utils/widgets/app_text_form_field.dart';
import '../../../../../core/utils/widgets/custom_button.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTrue =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isTrue ? 70.sp : 70.sp,
        flexibleSpace: FlexibleSpaceBar(
          background: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!isTrue) SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                        context.pop();
                      },
                    ),
                  ),
                  Text(
                    "Write post in the community",
                    style: TextStyles.font16Black500,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  horizontalSpace(10),
                ],
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Form(
          key: context.read<AddNewPostCubit>().formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppTextFormField(
                        borderColor: Colors.black,

                        hintText: "Write the title of your post",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Write the title of your post";
                          }
                        },
                        backgroundColor: Color(0xFFF7F7F7),
                        inputTextStyle: TextStyles.font14Black400,
                        hintStyle: TextStyles.font14Black400
                            .copyWith(color: Colors.grey),
                        controller: context.read<AddNewPostCubit>().titleController,
                      ),
                      verticalSpace(10),
                      AppTextFormField(
                        borderColor: Colors.black,
                        keyboardType: TextInputType.multiline,
                        hintText: "Write your body you want to write about",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please write body";
                          }
                        },
                        backgroundColor: Color(0xFFF7F7F7),
                        inputTextStyle: TextStyles.font14Black400,
                        hintStyle: TextStyles.font14Black400
                            .copyWith(color: Colors.grey),
                        controller: context.read<AddNewPostCubit>().bodyController,
                        minLines: 8,
                        maxLines: 8,
                      ),
                    ],
                  ),
                ),
              ),

              /// Button at Bottom
              Padding(
                padding: EdgeInsets.only(bottom: 5.sp), // Adjust bottom padding
                child: BlocListener<AddNewPostCubit, AddNewPostState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: () {
                        ShowToast.showToastSuccessTop(message: "Post created successfully");
                        dismissLoading(context);
                        context.pop();
                      },
                      error: (error) {
                        dismissLoading(context);

                        ShowToast.showToastErrorTop(message: error);
                      },
                      loading: () {
                        showLoading(context);
                      },
                    );


                  },
                  child: CustomButton(
                    text: "Post",
                    onPressed: () {
                      context.read<AddNewPostCubit>().addPost();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
