import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State createState() {
    return _LivePageState();
  }
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LivePage"),
      ),
      body: Container(),
    );
  }
}
