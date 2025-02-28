import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:postapp/features/home/logic/get_all_posts_cubit/get_all_posts_cubit.dart';

import '../../../../../core/style/text_styles/text_styles.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/utils/widgets/error_handler_uI.dart';
import '../widgets/post_list.dart';

class PostScreenBody extends StatelessWidget {
  const PostScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPostsCubit,
        GetAllPostsState>(
      builder: (context, state) {
        return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: ( Posts, isLoading, error) {
              if(error!=null&&error.isNotEmpty){
                ShowToast.showToastErrorTop(message: error);
              }
              if(Posts.isEmpty){
                return Center(
                    child:  Text("No Post found",style: TextStyles.font16Black500,)
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: PostList(
                        allPosts: Posts,
                      )
                  ),
                  if(isLoading) Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            },
            error: (error) {
              return RefreshErrorWidget(
                  onPressed: () {
                    context
                        .read<GetAllPostsCubit>()
                        .getPosts(isLoadMore: false);
                  },
                  error: error);
            });
      },
    );
  }
}