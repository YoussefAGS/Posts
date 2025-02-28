

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postapp/core/extensions/context_extension.dart';
import 'package:postapp/features/home/data/models/post_model.dart';
import 'package:postapp/features/home/logic/get_all_posts_cubit/get_all_posts_cubit.dart';
import 'package:postapp/features/home/ui/ui/widgets/post_card.dart';

class PostList extends StatefulWidget {
  final List<PostModel> allPosts;
  const PostList({Key? key, required this.allPosts}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<GetAllPostsCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
      controller: _scrollController,
      itemCount: widget.allPosts.length,
      itemBuilder: (context, index) {
        return PostCard(postModel: widget.allPosts[index],);
      },
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}