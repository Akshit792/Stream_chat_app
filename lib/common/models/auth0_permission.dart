// ignore: constant_identifier_names

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:booksella/common/models/auth0_permission_source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth0_permission.g.dart';

enum Role { Admins, Customer, Employees }

@JsonSerializable()
class Auth0Permission {
  @JsonKey(name: 'permission_name')
  final permissionName;

  final description;

  @JsonKey(name: 'resource_server_name')
  final resourceServerName;

  @JsonKey(name: 'resource_server_identifier')
  final resourceServerIdentifier;

  final List<Auth0PermissionSource> sources;

  Auth0Permission({
    required this.permissionName,
    required this.description,
    required this.resourceServerName,
    required this.resourceServerIdentifier,
    required this.sources,
  });

  factory Auth0Permission.fromJson(Map<String, dynamic> json) =>
      _$Auth0PermissionFromJson(json);

  Map<String, dynamic> toJson() => _$Auth0PermissionToJson(this);
}

class Permission {
  static const String delete = 'delete.user.message';
  static const String edit = 'edit.user.message';
  static const String upload = 'upload.attachments';
}
