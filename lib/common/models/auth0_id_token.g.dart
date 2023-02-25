// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_id_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth0IdToken _$Auth0IdTokenFromJson(Map<String, dynamic> json) => Auth0IdToken(
      email: json['email'] as String,
      emailVerified: json['email_verified'] as bool,
      name: json['name'] as String,
      nickName: json['nickname'] as String,
      nonce: json['nonce'] as String?,
      picture: json['picture'] as String,
      sid: json['sid'] as String?,
      updatedAt: json['updated_at'] as String,
      aud: json['aud'] as String,
      exp: json['exp'] as int,
      iat: json['iat'] as int,
      iss: json['iss'] as String,
      sub: json['sub'] as String,
      authTime: json['auth_time'] as int?,
      streamUserToken:
          json['http://getstream.chatapp.app/user_token'] as String?,
    );

Map<String, dynamic> _$Auth0IdTokenToJson(Auth0IdToken instance) =>
    <String, dynamic>{
      'nickname': instance.nickName,
      'name': instance.name,
      'picture': instance.picture,
      'updated_at': instance.updatedAt,
      'email': instance.email,
      'email_verified': instance.emailVerified,
      'iss': instance.iss,
      'aud': instance.aud,
      'iat': instance.iat,
      'exp': instance.exp,
      'sub': instance.sub,
      'sid': instance.sid,
      'nonce': instance.nonce,
      'auth_time': instance.authTime,
      'http://getstream.chatapp.app/user_token': instance.streamUserToken,
    };
