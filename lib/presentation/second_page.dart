import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String secondPageRoute = "/second";

class SecondPage extends StatelessWidget {
  final String receivedTitle;

  const SecondPage({Key key, this.receivedTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(receivedTitle),
          ElevatedButton(child: Text("Return 42"), onPressed: () => Navigator.pop(context, "42")),
          ElevatedButton(child: Text("Return AbErVaLlG"), onPressed: () => Navigator.pop(context, "AbErVaLlG")),
        ],
      ),
    ));
  }
}
