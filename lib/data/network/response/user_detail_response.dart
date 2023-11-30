import 'package:json_annotation/json_annotation.dart';

import '../../models/user_detail.dart';

part 'user_detail_response.g.dart';

@JsonSerializable()
class UserDetailResponse {
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'user_gender')
  final String? userGender;
  @JsonKey(name: 'year_of_bird')
  final int? yearOfBird;

  const UserDetailResponse({
    this.userName,
    this.userGender,
    this.yearOfBird,
  });

  UserDetail get userDetail => UserDetail(
      userName: userGender, userGender: userGender, userAge: DateTime.now().year - (yearOfBird ?? DateTime.now().year));

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) => _$UserDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailResponseToJson(this);
}
