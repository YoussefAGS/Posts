

import 'package:postapp/features/home/data/models/add_new_post_request_model.dart';
import 'package:postapp/features/home/data/models/post_model.dart';

abstract class HomeDataSource {

  Future<List<PostModel>>getPosts({required int page,required int limit});
  Future<PostModel>addPost({required AddNewPostRequestModel addNewPostRequestModel});


}