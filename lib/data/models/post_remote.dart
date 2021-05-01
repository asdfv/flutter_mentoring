import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/post.dart';

part 'post_remote.g.dart';

@JsonSerializable()
class PostRemote {
  final int id;
  final String title;
  final String body;

  PostRemote(this.id, this.title, this.body);

  factory PostRemote.fromJson(Map<String, dynamic> json) => _$PostRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$PostRemoteToJson(this);

  Post toDomainModel() => Post(id: id, title: title, body: body);
}
