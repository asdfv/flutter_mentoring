import 'package:flutter/material.dart';
import 'package:flutter_mentoring/presentation/video_view_page.dart';

import 'presentation/map_view_page.dart';
import 'presentation/web_view_page.dart';

void main() {
  runApp(TabBarApp());
}

class TabBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.language)),
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.movie)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              WebViewPage(),
              MapViewPage(),
              VideoViewPage(
                videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
