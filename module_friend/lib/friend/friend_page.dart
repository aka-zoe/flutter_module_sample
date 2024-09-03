import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State createState() {
    return _FriendPageState();
  }
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RegisterPage"),
      ),
      body: Container(),
    );
  }
}
