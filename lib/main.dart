import 'package:flutter/material.dart';
import 'package:flutter_mentoring/presentation/video_view_page.dart';

import 'presentation/map_view_page.dart';
import 'presentation/platform_channels_page.dart';
import 'presentation/web_view_page.dart';

/// Module 11. WebView, MapView, VideoPlayer.
/// App with three tabs with WebView, MapView, VideoPlayer.
/// MapView contains marker on Elbrus mountain.
/// PlatformChannelsPage is using a channel for platform code invocation.
void main() {
  runApp(TabBarApp());
}

class TabBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.language)),
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.movie)),
                Tab(icon: Icon(Icons.add_road_rounded)),
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
              PlatformChannelsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
