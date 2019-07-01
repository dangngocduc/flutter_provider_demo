import 'dart:async';
import 'package:flutter_provider_demo/bloc/stream_provider/StreamCounter.dart';

Utils utils = Utils();

class Utils{
  StreamController<StreamCounter> counterController = StreamController<StreamCounter>();
  Stream<StreamCounter> demoStream() async*{
    var counte1 = await doSomething();
    yield counte1;
    var counte2 = await doSomething2();
    yield counte2;
    var counte3 = await doSomething3();
    yield counte3;
  }

  Future<StreamCounter> doSomething() async  {
    await Future.delayed(Duration(seconds: 5));
    return StreamCounter(currentValue: 5);
  }

  Future<StreamCounter> doSomething2() async {
    await Future.delayed(Duration(seconds: 5));
    return StreamCounter(currentValue: 10);
  }

  Future<StreamCounter> doSomething3() async {
    await Future.delayed(Duration(seconds: 5));
    return StreamCounter(currentValue: 15);
  }
}