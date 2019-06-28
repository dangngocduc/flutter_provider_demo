


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListenableProviderDemoBloc extends Listenable {
  ObserverList<VoidCallback> _listeners = ObserverList<VoidCallback>();

  int counter = 0;

  increment() {
    counter++;
    print("ProviderDemoBloc " + counter.toString());
    notifyListeners();
  }

  decrement() {
    counter--;
    print("ProviderDemoBloc " + counter.toString());
    notifyListeners();
  }

  demo({String name = "default", String name2 = "", String name3 = "default" }) {
    print(name + "-" + name2 + "-" + name3);
  }

  demo2([String name = "default", String name2 = "default", String name3 = "default" ]) {
    print(name + "-" + name2 + "-" + name3);
  }

  @override
  void addListener(listener) {
    print("ListenableProviderDemoBloc addListener");
    _listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    _listeners.remove(listener);
    print("ListenableProviderDemoBloc removeListener");
  }

  void notifyListeners() {
    _listeners.forEach((listener) {
      listener();
    });
  }
}