part of 'get_all_posts_cubit.dart';

@freezed
class GetAllPostsState with _$GetAllPostsState {
  const factory GetAllPostsState.initial() = _Initial;
  const factory GetAllPostsState.loading() = GetAllPostsLoading;
  const factory GetAllPostsState.loaded({required List<PostModel> projects,required bool isLoadingMore,String?errorMessage}) = GetAllPostsLoaded;
  const factory GetAllPostsState.error({required String message}) = GetAllPostsError;

}
