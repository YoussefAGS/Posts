import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postapp/features/home/data/models/post_model.dart';
import 'package:postapp/features/home/data/repo/home_repo/home_repo.dart';

part 'get_all_posts_state.dart';
part 'get_all_posts_cubit.freezed.dart';

class GetAllPostsCubit extends Cubit<GetAllPostsState> {
  HomeRepo _homeRepo;
  GetAllPostsCubit(this._homeRepo) : super(const GetAllPostsState.initial());
  int _currentPage = 1;
  int pageSize = 15;
  String id1 = '';// Current page for pagination
  // final int _pageSize = 15; // Items per page
  bool nomore = false; // Flag to check if no more data is available
  List<PostModel> allPosts = []; // To store all payments

  Future<void> getPosts({bool isLoadMore = false}) async {

    if (nomore) return; // Stop fetching if no more data is available

    if (!isLoadMore) {
      emit(const GetAllPostsState.loading());
    } else {
      emit(GetAllPostsState.loaded(
        projects: allPosts,
        isLoadingMore: true,
      ));
    }

    try {
      final result = await _homeRepo.getPosts(
          page: _currentPage,
          limit: pageSize,
      );

      String errorMessage = '';
      List<PostModel> newPosts = [];

      result.when(
        success: (data) {
          newPosts = data as List<PostModel>;
          if (isLoadMore) {
            allPosts.addAll(newPosts);
          } else {
            allPosts = newPosts;
          }
        },
        failure: (error) {
          errorMessage = error.apiErrorModel.message ?? 'Failed to load data';
        },
      );

      if (newPosts.isEmpty) nomore = true; // Mark no more data if response is empty

      if (isLoadMore && newPosts.isEmpty && errorMessage.isNotEmpty) {
        emit(GetAllPostsState.loaded(
          projects: allPosts,
          isLoadingMore: false,
          errorMessage: errorMessage,
        ));
      } else if (newPosts.isEmpty && errorMessage.isNotEmpty) {
        emit(GetAllPostsState.error(message: errorMessage));
      } else {
        _currentPage++; // Increment page for the next fetch
        emit(GetAllPostsState.loaded(
          projects: allPosts,
          isLoadingMore: false,
        ));
      }
    } catch (e) {
      emit(GetAllPostsState.error(
          message: 'Something went wrong: $e'));
    }
  }

  void loadMore() {
    if (state is GetAllPostsLoaded) {
      getPosts(isLoadMore: true); // Trigger load more
    }
  }


}
