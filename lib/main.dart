import 'package:flutter/material.dart';

import 'data/post_repository.dart';
import 'data/posts_api_service.dart';
import 'presentation/first_page.dart';
import 'presentation/second_page.dart';

void main() {
  runApp(MyApp());
}

/// App that uses chopper to fetch data from REST API.
/// First screen displaying some default content and button "GO TO 2nd SCREEN"
/// By pressing this button we're opening 2nd screen and requesting remote data via chopper.
/// After it's been fetched - displaying those data on the second screen.
/// If we pressed to any of these data items - go back to 1st screen and display chosen data.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postRepository = PostRepository(apiService: PostApiService.create());
    return MaterialApp(
      title: 'Module 6 Network',
      initialRoute: FirstPage.route,
      routes: {
        FirstPage.route: (_) => FirstPage(repository: postRepository),
        SecondPage.route: (_) => SecondPage(repository: postRepository),
      },
    );
  }
}
