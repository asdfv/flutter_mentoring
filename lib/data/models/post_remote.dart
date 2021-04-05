import 'package:vasili_mentoring_tasks/domain/models/post.dart';

class PostRemote {
  final int id;
  final String title;
  final String body;

  PostRemote(this.id, this.title, this.body);

  PostRemote.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
      };

  Post toDomainModel() => Post(id: id, title: title, body: body);
}
