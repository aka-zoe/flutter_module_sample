import 'package:flutter/cupertino.dart';
import 'package:module_route/container/mixin_router_container.dart';
import 'package:module_route/route/route_path.dart';
import 'package:module_sample/pages/home/home_page.dart';

import '../pages/splash_page.dart';

///注册用户鉴权模块相关路由
mixin AppRouteContainer on MixinRouterContainer {
  @override
  Map<String, WidgetBuilder> installRouters() {
    //获取其他模块路由
    Map<String, WidgetBuilder> originRoutes = super.installRouters();
    //注册当前模块路由
    Map<String, WidgetBuilder> appRoutes = {};
    //启动页
    appRoutes[RoutePath.splash] = (context) => SplashPage();
    //首页
    appRoutes[RoutePath.home] = (context) => HomePage();

    //合并其他模块路由
    appRoutes.addAll(originRoutes);
    //返回合并后的
    return appRoutes;
  }
}
