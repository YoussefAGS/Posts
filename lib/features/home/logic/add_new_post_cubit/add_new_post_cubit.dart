import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postapp/features/home/data/repo/home_repo/home_repo.dart';

import '../../data/models/add_new_post_request_model.dart';

part 'add_new_post_state.dart';
part 'add_new_post_cubit.freezed.dart';

class AddNewPostCubit extends Cubit<AddNewPostState> {

  final HomeRepo _homeRepo;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();


  AddNewPostCubit(this._homeRepo) : super(const AddNewPostState.initial());


  final formKey = GlobalKey<FormState>();

  Future<void> addPost() async {
    if(!formKey.currentState!.validate()) {
      return;
    }
    emit(const AddNewPostState.loading());

    final result = await _homeRepo.addPost(
      addNewPostRequestModel: AddNewPostRequestModel(
          title: titleController.text,
          body: bodyController.text,
          userId: 1
      ),
    );

    result.when(
      success: (data) {
        emit(const AddNewPostState.success());
      },
      failure: (error) {
        emit(AddNewPostState.error(message: error.apiErrorModel.message ?? 'Failed to Add Post'));
      },
    );

  }
}
