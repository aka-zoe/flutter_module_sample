import 'package:flutter/cupertino.dart';
import 'package:module_route/route/route_path.dart';

///路由相关操作辅助类
///跳转、动态跳转、清栈跳转、关闭页面、全局context
class RouteUtils {
  static final navigatorKey = GlobalKey<NavigatorState>();

  // App 根节点Context
  static BuildContext get context => navigatorKey.currentContext!;

  static NavigatorState get navigator => navigatorKey.currentState!;

  //当前页面是否为登录页
  static bool currentIsLoginPage = false;

  ///普通动态跳转-->page
  static Future push(
    BuildContext context,
    Widget page, {
    bool? fullscreenDialog,
    RouteSettings? settings,
    bool maintainState = true,
  }) {
    return Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => page,
          fullscreenDialog: fullscreenDialog ?? false,
          settings: settings,
          maintainState: maintainState,
        ));
  }

  ///根据路由路径跳转
  static Future pushForNamed(
    BuildContext context,
    String name, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(context, name, arguments: arguments);
  }

  void testRoutePush() {
    RouteUtils.pushForNamed(context, RoutePath.login);
  }

  ///自定义route动态跳转
  static Future pushForPageRoute(BuildContext context, Route route) {
    return Navigator.push(context, route);
  }

  ///清空栈，只留目标页面
  static Future pushNamedAndRemoveUntil(
    BuildContext context,
    String name, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(context, name, (route) => false, arguments: arguments);
  }

  ///清空栈，只留目标页面
  static Future pushAndRemoveUntil(
    BuildContext context,
    Widget page, {
    bool? fullscreenDialog,
    RouteSettings? settings,
    bool maintainState = true,
  }) {
    return Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (_) => page,
          fullscreenDialog: fullscreenDialog ?? false,
          settings: settings,
          maintainState: maintainState,
        ),
        (route) => false);
  }

  ///用新的路由替换当路由
  static Future pushReplacement(BuildContext context, Route route, {Object? result}) {
    return Navigator.pushReplacement(context, route, result: result);
  }

  ///用新的路由替换当路由
  static Future pushReplacementNamed(
    BuildContext context,
    String name, {
    Object? result,
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed(context, name, arguments: arguments, result: result);
  }

  ///关闭当前页面
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  ///关闭当前页面:包含返回值
  static void popOfData<T extends Object?>(BuildContext context, {T? data}) {
    Navigator.of(context).pop(data);
  }
}
