import 'package:flutter/cupertino.dart';
import 'package:module_route/container/mixin_router_container.dart';
import 'package:module_route/route/route_path.dart';
import 'package:module_video/videos/video_page.dart';

mixin VideoRouteContainer on MixinRouterContainer {
  @override
  Map<String, WidgetBuilder> installRouters() {
    //获取其他模块路由
    Map<String, WidgetBuilder> originRoutes = super.installRouters();
    //注册当前模块路由
    Map<String, WidgetBuilder> appRoutes = {};
    appRoutes[RoutePath.video] = (context) => VideoPage();

    //合并其他模块路由
    appRoutes.addAll(originRoutes);
    //返回合并后的
    return appRoutes;
  }
}
