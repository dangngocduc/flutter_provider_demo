import 'dart:async';
import 'package:flutter_provider_demo/bloc/stream_provider/StreamCounter.dart';

Utils utils = Utils();

class Utils{
  StreamController<StreamCounter> counterController = StreamController<StreamCounter>();
}