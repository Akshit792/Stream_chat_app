// ignore_for_file: depend_on_referenced_packages

import 'package:booksella/common/models/auth0_permission.dart';
import 'package:booksella/common/models/auth0_role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth0_id_token.g.dart';

@JsonSerializable()
class Auth0IdToken {
  @JsonKey(name: 'nickname')
  final String nickName;
  final String name;
  final String picture;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final String email;
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  final String iss;
  final String aud;
  final int iat;
  final int exp;
  final String sub;
  final String? sid;
  final String? nonce;
  @JsonKey(name: 'auth_time')
  int? authTime;
  @JsonKey(name: "http://getstream.chatapp.app/user_token")
  final String? streamUserToken;
  @JsonKey(name: 'https://users.chatapp.app/roles')
  final List<Auth0Role> roles;
  @JsonKey(name: 'https://users.chatapp.app/permissions')
  final List<Auth0Permission> permissions;

  Auth0IdToken(
      {required this.email,
      required this.emailVerified,
      required this.name,
      required this.nickName,
      this.nonce,
      required this.picture,
      this.sid,
      required this.updatedAt,
      required this.aud,
      required this.exp,
      required this.iat,
      required this.iss,
      required this.sub,
      this.authTime,
      required this.streamUserToken,
      required this.roles,
      required this.permissions});

  String get userId => sub;

  factory Auth0IdToken.fromJson(Map<String, dynamic> json) =>
      _$Auth0IdTokenFromJson(json);

  Map<String, dynamic> toJson() => _$Auth0IdTokenToJson(this);
}
