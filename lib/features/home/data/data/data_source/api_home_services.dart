

import 'package:dio/dio.dart';

import 'package:postapp/core/networking/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../models/add_new_post_request_model.dart';
import '../../models/post_model.dart';
import 'home_data_source.dart';
part 'api_home_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiHomeServices extends HomeDataSource{
  factory ApiHomeServices(Dio dio, {String baseUrl}) = _ApiHomeServices;

  @override
  @GET("/posts")
  Future<List<PostModel>> getPosts(
      {@Path("page") required int page, @Path("limit") required int limit});

  @override
  @POST("/posts")
  Future<PostModel> addPost(
      {@Body() required AddNewPostRequestModel addNewPostRequestModel});



}