import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondPage extends StatelessWidget {
  static final route = "/second";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(child: Text("Return 42"), onPressed: () => Navigator.pop(context, "42")),
          ElevatedButton(child: Text("Return AbErVaLlG"), onPressed: () => Navigator.pop(context, "AbErVaLlG")),
        ],
      ),
    ));
  }
}
