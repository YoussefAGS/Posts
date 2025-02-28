import 'package:json_annotation/json_annotation.dart';

part 'add_new_post_request_model.g.dart';

@JsonSerializable()
class AddNewPostRequestModel {
  final String? title;
  final String? body;
  final int? userId;

  AddNewPostRequestModel({required this.title,required this.body,required this.userId});

  factory AddNewPostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddNewPostRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNewPostRequestModelToJson(this);
}
