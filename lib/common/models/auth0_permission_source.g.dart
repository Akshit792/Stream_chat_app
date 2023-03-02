// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_permission_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth0PermissionSource _$Auth0PermissionSourceFromJson(
        Map<String, dynamic> json) =>
    Auth0PermissionSource(
      sourceId: json['source_id'] as String,
      sourceName: json['source_name'] as String,
      sourceType: json['source_type'] as String,
    );

Map<String, dynamic> _$Auth0PermissionSourceToJson(
        Auth0PermissionSource instance) =>
    <String, dynamic>{
      'source_id': instance.sourceId,
      'source_name': instance.sourceName,
      'source_type': instance.sourceType,
    };
