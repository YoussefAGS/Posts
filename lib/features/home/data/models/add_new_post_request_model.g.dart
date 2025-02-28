// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewPostRequestModel _$AddNewPostRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddNewPostRequestModel(
      title: json['title'] as String?,
      body: json['body'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddNewPostRequestModelToJson(
        AddNewPostRequestModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userId,
    };
