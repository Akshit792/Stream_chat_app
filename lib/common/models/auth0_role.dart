// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'auth0_role.g.dart';

enum Role { Admins, Customer, Employees }

@JsonSerializable()
class Auth0Role {
  final String id;
  @JsonKey(name: 'name')
  final Role role;
  final String description;

  Auth0Role({
    required this.id,
    required this.role,
    required this.description,
  });

  factory Auth0Role.fromJson(Map<String, dynamic> json) =>
      _$Auth0RoleFromJson(json);

  Map<String, dynamic> toJson() => _$Auth0RoleToJson(this);
}
