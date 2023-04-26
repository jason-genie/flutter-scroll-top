import 'package:example/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hide system status bar - start
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // Hide system status bar - end

    return const MaterialApp(title: 'Scroll to top', home: HomePage());
  }
}
