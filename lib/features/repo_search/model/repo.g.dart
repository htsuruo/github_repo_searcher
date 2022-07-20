// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Repo _$$_RepoFromJson(Map json) => _$_Repo(
      id: json['id'] as int,
      nodeId: json['nodeId'] as String,
      name: json['name'] as String,
      fullName: json['fullName'] as String,
      private: json['private'] as bool,
      owner: Owner.fromJson(Map<String, dynamic>.from(json['owner'] as Map)),
      htmlUrl: json['htmlUrl'] as String,
      description: json['description'] as String,
      language: json['language'] as String,
      stargazersCount: json['stargazersCount'] as int,
      watchersCount: json['watchersCount'] as int,
      forksCount: json['forksCount'] as int,
      openIssuesCount: json['openIssuesCount'] as int,
    );

Map<String, dynamic> _$$_RepoToJson(_$_Repo instance) => <String, dynamic>{
      'id': instance.id,
      'nodeId': instance.nodeId,
      'name': instance.name,
      'fullName': instance.fullName,
      'private': instance.private,
      'owner': instance.owner.toJson(),
      'htmlUrl': instance.htmlUrl,
      'description': instance.description,
      'language': instance.language,
      'stargazersCount': instance.stargazersCount,
      'watchersCount': instance.watchersCount,
      'forksCount': instance.forksCount,
      'openIssuesCount': instance.openIssuesCount,
    };
