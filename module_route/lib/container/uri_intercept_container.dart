import 'package:flutter/widgets.dart';

import 'mixin_router_container.dart';
import 'mixin_router_intercept_container.dart';

class UriRouterInterceptContainer extends MixinRouterInterceptContainer {
  ///scheme://setting?arg=1&arg2=2， means:
  ///open '/setting' page with args:
  ///- arg: 1
  ///- arg2: 2
  ///- _url: scheme://setting?arg=1&arg2=2
  Future<T?>? urlToPage<T>(BuildContext context, String urlStr,
      {RoutePushType pushType = RoutePushType.pushNamed,
      RoutePredicate? predicate}) {
    Uri? url = Uri.tryParse(urlStr);
    if (url == null) return Future.error('parse url fail');
    Map<String, String> args = {};
    args.addAll(url.queryParameters);
    args['_url'] = urlStr;
    String pageName = url.host;
    super.openPage(
      context,
      '/' + pageName,
      pushType: pushType,
      arguments: args,
      predicate: predicate,
    );
  }
}
