import 'package:flutter/widgets.dart';

Map<dynamic, dynamic>? getMixinArg(BuildContext context) {
  RouteSettings? setting = ModalRoute.of(context)?.settings;
  if (setting == null) return null;
  Object? args = setting.arguments;
  if (args == null) return null;
  if (args is Map<String, dynamic>) return args['args'];
  return null;
}
