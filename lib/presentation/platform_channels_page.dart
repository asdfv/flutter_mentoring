import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformChannelsPage extends StatefulWidget {
  @override
  _PlatformChannelsPageState createState() => _PlatformChannelsPageState();

  static const platform = const MethodChannel('by.grodno.vasili.flutter_mentoring/platformName');
}

class _PlatformChannelsPageState extends State<PlatformChannelsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Greet!'),
              onPressed: _getPlatformName,
            ),
            Text(_platformGreeting),
          ],
        ),
      ),
    );
  }

  String _platformGreeting = 'Platform does not answered';

  Future<void> _getPlatformName() async {
    String platformName;

    try {
      final String result = await PlatformChannelsPage.platform.invokeMethod('getPlatformName');
      platformName = 'Hello from $result!';
    } on PlatformException catch (e) {
      platformName = "Failed to get platform name: '${e.message}'.";
    }

    setState(() {
      _platformGreeting = platformName;
    });
  }
}
