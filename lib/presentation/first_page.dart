import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vasili_mentoring_tasks/data/post_repository.dart';
import 'package:vasili_mentoring_tasks/domain/models/post.dart';
import 'package:vasili_mentoring_tasks/presentation/second_page.dart';

class FirstPage extends StatelessWidget {
  static final route = "/first";

  final PostRepository repository;

  FirstPage({this.repository});

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Some default content")),
      body: id == null ? _defaultPage(context) : _postPage(id),
    );
  }

  Widget _defaultPage(BuildContext context) {
    return Center(
      child: _elevatedButton(context),
    );
  }

  ElevatedButton _elevatedButton(BuildContext context) {
    return ElevatedButton(
        child: Text("GO TO 2nd SCREEN"),
        onPressed: () {
          Navigator.pushNamed(context, SecondPage.route);
        });
  }

  FutureBuilder<Post> _postPage(int id) {
    return FutureBuilder<Post>(
      future: repository.getOne(id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _errorWidget(context, snapshot.error);
        } else if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_postWidget(snapshot.data), _elevatedButton(context)],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _errorWidget(BuildContext context, Object error) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)),
            _elevatedButton(context)
          ],
        ),
      );

  Widget _postWidget(Post post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            post.title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(post.body),
        ],
      ),
    );
  }
}
