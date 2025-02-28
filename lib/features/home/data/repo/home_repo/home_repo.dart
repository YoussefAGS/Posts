

import '../../../../../core/networking/api_helper.dart';
import '../../../../../core/networking/api_result.dart';
import '../../data/data_source/home_data_source.dart';
import '../../models/add_new_post_request_model.dart';
import '../../models/post_model.dart';


class HomeRepo {
  final  HomeDataSource _apiService;

  HomeRepo(this._apiService);


  Future<ApiResult<List<PostModel>>> getPosts({required int page,required int limit})
  async {
    return ApiHelper.handleApiCall(() => _apiService.getPosts(page: page, limit: limit));
  }


  Future<ApiResult<PostModel>> addPost({required AddNewPostRequestModel addNewPostRequestModel})
  async {
    return ApiHelper.handleApiCall(() => _apiService.addPost(addNewPostRequestModel: addNewPostRequestModel));
  }


}