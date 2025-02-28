part of 'add_new_post_cubit.dart';

@freezed
class AddNewPostState with _$AddNewPostState {
  const factory AddNewPostState.initial() = _Initial;
  const factory AddNewPostState.loading() = AddNewPostLoading;
  const factory AddNewPostState.success() = AddNewPostSuccess;
  const factory AddNewPostState.error({required String message}) = AddNewPostError;
}
