// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth0Profile _$Auth0ProfileFromJson(Map<String, dynamic> json) => Auth0Profile(
      sub: json['sub'] as String,
      nickName: json['nickname'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String,
      updatedAt: json['updated_at'] as String,
      email: json['email'] as String,
      emailVerified: json['email_verified'] as bool,
      streamUserToken:
          json['http://getstream.chatapp.app/user_token'] as String?,
      roles: (json['https://users.chatapp.app/roles'] as List<dynamic>)
          .map((e) => Auth0Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions:
          (json['https://users.chatapp.app/permissions'] as List<dynamic>)
              .map((e) => Auth0Permission.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$Auth0ProfileToJson(Auth0Profile instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'nickname': instance.nickName,
      'name': instance.name,
      'picture': instance.picture,
      'updated_at': instance.updatedAt,
      'email': instance.email,
      'email_verified': instance.emailVerified,
      'http://getstream.chatapp.app/user_token': instance.streamUserToken,
      'https://users.chatapp.app/roles': instance.roles,
      'https://users.chatapp.app/permissions': instance.permissions,
    };
