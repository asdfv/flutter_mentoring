import 'dart:convert';

import 'package:chopper/chopper.dart' hide Post;

import '../domain/models/post.dart';
import 'models/post_remote.dart';
import 'posts_api_service.dart';

class PostRepository {
  final PostApiService apiService;

  PostRepository({this.apiService});

  Future<List<Post>> getAll() async {
    final Response response = await apiService.getPosts();
    if (!response.isSuccessful) return Future.error("Error getting posts");
    final List<dynamic> list = jsonDecode(response.bodyString);
    final List<PostRemote> remotePosts = list.map((jsonObject) => PostRemote.fromJson(jsonObject)).toList();
    return remotePosts.map((remotePost) => remotePost.toDomainModel()).toList();
  }

  Future<Post> getOne(int id) async {
    final Response response = await apiService.getPost(id);
    if (!response.isSuccessful) return Future.error("Error getting post $id");
    final Map<String, dynamic> jsonObject = jsonDecode(response.bodyString);
    final PostRemote postRemote = PostRemote.fromJson(jsonObject);
    return postRemote.toDomainModel();
  }
}
