import 'package:flutter/material.dart';
import 'package:module_sample/route/app_route_container_instance.dart';
import 'package:module_route/route/route_path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //将各模块内路由注册表组合起来
    var installRouters = AppRouteContainerInstance.share.installRouters();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //声明首次进入页面和路由注册表
      initialRoute: RoutePath.splash,
      routes: installRouters,
    );
  }
}
