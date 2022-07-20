import 'package:freezed_annotation/freezed_annotation.dart';

import 'owner.dart';

part 'repo.freezed.dart';
part 'repo.g.dart';

@freezed
class Repo with _$Repo {
  // MEMO(tsuruoka): 必要最小限のみをデコード対象としています。
  const factory Repo({
    required int id,
    required String nodeId,
    required String name,
    required String fullName,
    required bool private,
    required Owner owner,
    required String htmlUrl,
    required String description,
    required String language,
    required int stargazersCount,
    required int watchersCount,
    required int forksCount,
    required int openIssuesCount,
  }) = _Repo;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
}
