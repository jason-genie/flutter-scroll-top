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
    final double statusBarHeight =
        MediaQuery.of(context).padding.top; // currently it is 0 (no status bar right now)

    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
              onTap: () {
                print('container tapped!');
              },
              child: Container(
                  color: Colors.blue,
                  child: ListView.builder(
                      controller: scrollController,
                      itemBuilder: _itemBuilder,
                      itemCount: 100))),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              print('Status bar tapped!');
              scrollController.animateTo(
                0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              height: 25, // statusBarHeight
              color: Colors.red,
            ),
          ),
        ),
      ],
    ));
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
