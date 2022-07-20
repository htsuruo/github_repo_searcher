import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner.freezed.dart';
part 'owner.g.dart';

@freezed
class Owner with _$Owner {
  const factory Owner({
    required String login,
    required int id,
    required int nodeId,
    required String avatarUrl,
    required String gravatarId,
    required String url,
    required String htmlUrl,
    required String followersUrl,
    required String followingUrl,
    required String gistsUrl,
    required String starredUrl,
    required String subscriptionsUrl,
    required String organizationsUrl,
    required String reposUrl,
    required String eventsUrl,
    required String receivedEventsUrl,
    required String type,
    required bool siteAdmin,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
