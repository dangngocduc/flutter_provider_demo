


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChangeNotifierProviderDemoBloc extends ChangeNotifier {
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

}