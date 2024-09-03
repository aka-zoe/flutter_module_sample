import 'package:flutter/widgets.dart';

import 'mixin_router_container.dart';

///定义路由拦截器
typedef MixinRouteInterceptor = bool Function(
    BuildContext context, String pageName, RoutePushType pushType,
    {Map<dynamic, dynamic>? arguments, RoutePredicate? predicate});

///base [RouterContainer]，用来拦截路由操作
class MixinRouterInterceptContainer extends MixinRouterContainer {
  final Map<String, MixinRouteInterceptor> _routeInterceptorTable = {};

  void registerRouteInterceptor(
      String pageName, MixinRouteInterceptor interceptor) {
    if (_routeInterceptorTable.containsKey(pageName)) return;
    _routeInterceptorTable[pageName] = interceptor;
  }

  void unRegisterRouteInterceptor(String pageName) {
    if (!_routeInterceptorTable.containsKey(pageName)) return;
    _routeInterceptorTable.remove(pageName);
  }

  @override
  Future<T?>? openPage<T>(BuildContext context, String pageName,
      {RoutePushType pushType = RoutePushType.pushNamed,
      Map<dynamic, dynamic>? arguments,
      RoutePredicate? predicate}) {
    if (!_routeInterceptorTable.containsKey(pageName)) {
      return super.openPage(
        context,
        pageName,
        pushType: pushType,
        arguments: arguments,
        predicate: predicate,
      );
    }
    MixinRouteInterceptor interceptor = _routeInterceptorTable[pageName]!;
    bool needIntercept = interceptor.call(
      context,
      pageName,
      pushType,
      arguments: arguments,
      predicate: predicate,
    );
    if (needIntercept) {
      return Future.value(null);
    } else {
      return super.openPage(
        context,
        pageName,
        pushType: pushType,
        arguments: arguments,
        predicate: predicate,
      );
    }
  }
}
