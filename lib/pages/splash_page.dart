import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_route/route/route_utils.dart';
import 'package:module_route/route/route_path.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            //点击进入首页
            RouteUtils.pushForNamed(context, RoutePath.home);
          },
          child: Text("SplashPage"),
        ),
      ),
      body: Container(),
    );
  }
}
