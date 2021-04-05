import 'dart:convert';

import 'package:chopper/chopper.dart' hide Post;
import 'package:vasili_mentoring_tasks/data/models/post_remote.dart';
import 'package:vasili_mentoring_tasks/data/posts_api_service.dart';
import 'package:vasili_mentoring_tasks/domain/models/post.dart';

class PostRepository {
  final PostApiService apiService;

  PostRepository({this.apiService});

  Future<List<Post>> getAll() async {
    Response response = await apiService.getPosts();
    if (!response.isSuccessful) return Future.error("Error getting posts");
    List<dynamic> list = jsonDecode(response.bodyString);
    List<PostRemote> remotePosts = list.map((jsonObject) => PostRemote.fromJson(jsonObject)).toList();
    return remotePosts.map((remotePost) => remotePost.toDomainModel()).toList();
  }

  Future<Post> getOne(int id) async {
    Response response = await apiService.getPost(id);
    if (!response.isSuccessful) return Future.error("Error getting post $id");
    Map<String, dynamic> jsonObject = jsonDecode(response.bodyString);
    PostRemote postRemote = PostRemote.fromJson(jsonObject);
    return postRemote.toDomainModel();
  }
}
