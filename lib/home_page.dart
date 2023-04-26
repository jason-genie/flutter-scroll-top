import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        body: Stack(children: [
      GestureDetector(
          onTapUp: (TapUpDetails details) {
            print("asdfasdf");
            if (details.globalPosition.dy < statusBarHeight) {
              // Tap occurred on the status bar
              print('clicked status bar');
              scrollController.jumpTo(0);
            }
          },
          child: Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(height: 100, color: Colors.red))),
      ListView.builder(
          controller: scrollController,
          itemBuilder: _itemBuilder,
          itemCount: 100),
    ]));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      padding: const EdgeInsets.all(20),
      child: Text('$index', style: const TextStyle(fontSize: 20)),
    );
  }
}
