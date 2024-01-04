import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第二个页面'),
      ),
      body: const Center(
        child: Text('这是第二个页面'),
      ),
    );
  }
}
