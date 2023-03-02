// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth0Permission _$Auth0PermissionFromJson(Map<String, dynamic> json) =>
    Auth0Permission(
      permissionName: json['permission_name'],
      description: json['description'],
      resourceServerName: json['resource_server_name'],
      resourceServerIdentifier: json['resource_server_identifier'],
      sources: (json['sources'] as List<dynamic>)
          .map((e) => Auth0PermissionSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Auth0PermissionToJson(Auth0Permission instance) =>
    <String, dynamic>{
      'permission_name': instance.permissionName,
      'description': instance.description,
      'resource_server_name': instance.resourceServerName,
      'resource_server_identifier': instance.resourceServerIdentifier,
      'sources': instance.sources,
    };
