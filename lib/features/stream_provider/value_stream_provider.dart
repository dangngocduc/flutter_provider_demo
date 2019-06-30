import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_demo/bloc/stream_provider/StreamCounter.dart';
import 'package:flutter_provider_demo/helpers/utils.dart';


class StreamProviderDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StreamCounter _counter = Provider.of<StreamCounter>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("ValueListenableDemoWidget2"),
        ),
        body: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    utils.counterController.add(StreamCounter(currentValue: _counter.currentValue+1));
                    //_valueNotifier.value(_valueNotifier.value++);
                  }),
              Text(
                _counter.currentValue.toString(),
                style: Theme.of(context).textTheme.display3,
              ),
              IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    utils.counterController.add(StreamCounter(currentValue: _counter.currentValue-1));
                    //_valueNotifier.value(_valueNotifier.value--);
                  })
            ],
          ),
        )));
  }
}
