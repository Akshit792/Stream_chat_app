// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'auth0_profile.g.dart';

@JsonSerializable()
class Auth0Profile {
  final String sub;
  @JsonKey(name: "nickname")
  final String nickName;
  final String name;
  final String picture;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  final String email;
  @JsonKey(name: "email_verified")
  final bool emailVerified;

  Auth0Profile({
    required this.sub,
    required this.nickName,
    required this.name,
    required this.picture,
    required this.updatedAt,
    required this.email,
    required this.emailVerified,
  });

  String get userId => sub.split('|').join('');

  factory Auth0Profile.fromJson(Map<String, dynamic> json) =>
      _$Auth0ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$Auth0ProfileToJson(this);
}
