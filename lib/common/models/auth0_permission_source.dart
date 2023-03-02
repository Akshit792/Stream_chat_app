// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'auth0_permission_source.g.dart';

@JsonSerializable()
class Auth0PermissionSource {
  @JsonKey(name: 'source_id')
  final String sourceId;
  @JsonKey(name: 'source_name')
  final String sourceName;
  @JsonKey(name: 'source_type')
  final String sourceType;

  Auth0PermissionSource({
    required this.sourceId,
    required this.sourceName,
    required this.sourceType,
  });

  factory Auth0PermissionSource.fromJson(Map<String, dynamic> json) =>
      _$Auth0PermissionSourceFromJson(json);

  Map<String, dynamic> toJson() => _$Auth0PermissionSourceToJson(this);
}
