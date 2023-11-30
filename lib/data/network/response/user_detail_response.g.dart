// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailResponse _$UserDetailResponseFromJson(Map<String, dynamic> json) =>
    UserDetailResponse(
      userName: json['user_name'] as String?,
      userGender: json['user_gender'] as String?,
      yearOfBird: json['year_of_bird'] as int?,
    );

Map<String, dynamic> _$UserDetailResponseToJson(UserDetailResponse instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'user_gender': instance.userGender,
      'year_of_bird': instance.yearOfBird,
    };
