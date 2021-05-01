import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data/post_repository.dart';
import '../domain/models/post.dart';
import 'first_page.dart';

class SecondPage extends StatelessWidget {
  static final route = "/second";
  final PostRepository repository;

  SecondPage({this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: FutureBuilder<List<Post>>(
          future: repository.getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return _errorWidget(context, snapshot.error);
            } else if (snapshot.hasData) {
              return _postsWidget(context, snapshot.data);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Widget _errorWidget(BuildContext context, Object error) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)),
            SizedBox(width: 10),
            ElevatedButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      );

  Widget _postsWidget(BuildContext context, List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              post.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(post.body),
            onTap: () {
              _navigateToFirstAndCleanStack(context, post.id);
            },
          ),
        );
      },
    );
  }

  Future _navigateToFirstAndCleanStack(BuildContext context, int id) async {
    return Navigator.pushNamedAndRemoveUntil(context, FirstPage.route, (_) => false, arguments: id);
  }
}
