import 'dart:async';

import 'package:rx_event_bus/rx_event_bus.dart';

///event事件工具类
class EventBusUtils {
  static EventBus? _eventBus;

  ///添加订阅 返回StreamSubscription，取消订阅需要调用unSubscript
  static StreamSubscription? subscription<T extends EventBean>(onData) {
    _eventBus ??= EventBus(maxSize: 20);

    ///内部流属于广播模式，可以有多个订阅者
    return _eventBus?.on<T>().listen(onData);
  }

  ///添加订阅粘性事件
  static StreamSubscription? subscriptionSticky<T extends EventBean>(onData) {
    _eventBus ??= EventBus();

    ///内部流属于广播模式，可以有多个订阅者
    return _eventBus?.onSticky<T>().listen(onData);
  }

  ///发送事件
  static void post<T extends EventBean>(T e) {
    _eventBus ??= EventBus();
    _eventBus?.fire(e);
  }

  ///发送粘性事件
  static void postSticky<T extends EventBean>(T e) {
    _eventBus ??= EventBus();
    _eventBus?.fire(e, sticky: true);
  }

  ///发送事件
  static void postEvent(EventBean event) {
    _eventBus ??= EventBus();
    _eventBus?.fire(event);
  }

  ///发送粘性事件
  static void postStickyEvent(EventBean event) {
    _eventBus ??= EventBus();
    _eventBus?.fire(event, sticky: true);
  }
}

extension StreamSubscriptionExtension<T> on StreamSubscription<T> {
  ///取消订阅
  void unSubscript() {
    cancel();
  }
}

///自定义event类型与值的事件，记得添加泛型，例如post(CustomEvent<String, int>(eventType:"e",eventValue:0) )
class CustomEvent<T, V> extends EventBean {
  T? eventType;
  V? eventValue;

  CustomEvent({this.eventType, this.eventValue});

  @override
  String toString() {
    return 'CustomEvent{eventType: $eventType, eventValue: $eventValue}';
  }
}

///Event事件基类 Bean
class EventBean<T> {
  EventBusType? type;
  T? event;

  EventBean({this.type, this.event});

  @override
  String toString() {
    return 'EventBean{type: $type, event: $event}';
  }
}

///EventBusType 枚举定义
enum EventBusType { eventType1, eventType2 }
