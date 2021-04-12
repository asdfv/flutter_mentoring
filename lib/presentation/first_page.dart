import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'second_page.dart';

const String firstPageRoute = "/first";

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _showExitDialog(context),
      child: Scaffold(
          body: Center(
        child: ElevatedButton(
            child: Text("Go next"),
            onPressed: () async {
              final data = await _navigateToSecond(context, "Some title");
              _showDialog(context, data);
            }),
      )),
    );
  }

  Future _navigateToSecond(BuildContext context, String title) async {
    return Navigator.pushNamed(context, secondPageRoute, arguments: title);
  }

  _showDialog(BuildContext context, String data) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Received result"),
              content: Text(data),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ));
  }

  _showExitDialog(BuildContext context) => showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Really?"),
            content: Text("Exit?"),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () => Navigator.of(context).pop(false),
              )
            ],
          ));
}
