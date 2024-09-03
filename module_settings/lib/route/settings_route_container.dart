import 'package:flutter/cupertino.dart';
import 'package:module_route/container/mixin_router_container.dart';
import 'package:module_route/route/route_path.dart';
import 'package:module_settings/mine/mine_page.dart';
import 'package:module_settings/settings/settings_page.dart';

mixin SettingsRouteContainer on MixinRouterContainer {
  @override
  Map<String, WidgetBuilder> installRouters() {
    //获取其他模块路由
    Map<String, WidgetBuilder> originRoutes = super.installRouters();
    //注册当前模块路由
    Map<String, WidgetBuilder> appRoutes = {};
    appRoutes[RoutePath.mine] = (context) => MinePage();
    appRoutes[RoutePath.settings] = (context) => SettingsPage();

    //合并其他模块路由
    appRoutes.addAll(originRoutes);
    //返回合并后的
    return appRoutes;
  }
}
