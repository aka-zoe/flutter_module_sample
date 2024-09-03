import 'app_route_container.dart';
import 'package:module_route/container/mixin_router_container.dart';
import 'package:module_auth/route/auth_route_container.dart';
import 'package:module_chat/route/chat_route_container.dart';
import 'package:module_community/route/community_route_container.dart';
import 'package:module_friend/route/friend_route_container.dart';
import 'package:module_live/route/live_route_container.dart';
import 'package:module_pay/route/pay_route_container.dart';
import 'package:module_settings/route/settings_route_container.dart';
import 'package:module_video/route/video_route_container.dart';

///主工程混入其他模块路由
class AppRouteContainerInstance extends MixinRouterContainer
    with
        AppRouteContainer,
        AuthRouteContainer,
        ChatRouteContainer,
        CommunityRouteContainer,
        FriendRouteContainer,
        LiveRouteContainer,
        PayRouteContainer,
        SettingsRouteContainer,
        VideoRouteContainer {
  AppRouteContainerInstance._();

  static final AppRouteContainerInstance _instance = AppRouteContainerInstance._();

  static AppRouteContainerInstance get share => _instance;
}
