import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key});

  @override
  State createState() {
    return _PayPageState();
  }
}

class _PayPageState extends State<PayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PayPage"),
      ),
      body: Container(),
    );
  }
}
