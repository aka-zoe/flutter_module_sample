import 'dart:async';

import 'event_bus_utils.dart';

class EventBusTest {
  void testSend() {
    //当前界面切换时，发送粘性事件
    EventBusUtils.postStickyEvent(
        EventBean(type: EventBusType.eventType1, event: "you can send anything"));
    //当前界面切换时，发送事件
    EventBusUtils.postEvent(
        EventBean(type: EventBusType.eventType2, event: "you can send anything"));
  }
  void subscribeTest() {
    //订阅粘性事件
    StreamSubscription? subscriptionSticky =
        EventBusUtils.subscriptionSticky((EventBean? eventBean) {
      if (eventBean == null) {
        return;
      }
      switch (eventBean.type) {
        case EventBusType.eventType1:
          if (eventBean.event != null) {}
          break;
        default:
      }
    });
    //订阅Event事件
    StreamSubscription? subscription =
    EventBusUtils.subscription((EventBean? eventBean) {
      if (eventBean == null) {
        return;
      }
      switch (eventBean.type) {
        case EventBusType.eventType1:
          if (eventBean.event != null) {}
          break;
        default:
      }
    });
  }
}
