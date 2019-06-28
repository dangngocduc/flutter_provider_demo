import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/bloc/listenable/ListenableProviderBloc.dart';
import 'package:flutter_provider_demo/bloc/provider/ProviderDemoBloc.dart';
import 'package:flutter_provider_demo/bloc/value_listenable/Counter.dart';
import 'package:provider/provider.dart';

class ValueListenableDemoWidget extends StatefulWidget {
  @override
  _ValueListenableDemoWidgetState createState() =>
      _ValueListenableDemoWidgetState();
}

class _ValueListenableDemoWidgetState extends State<ValueListenableDemoWidget> {
  ValueNotifier _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ValueListenableDemoWidget"),
        ),
        body: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _valueNotifier.value(_valueNotifier.value++);
                  }),
              ValueListenableBuilder(
                  valueListenable: _valueNotifier,
                  builder: (context, value, _) {
                    return Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.display3,
                    );
                  }),
              IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    _valueNotifier.value(_valueNotifier.value--);
                  })
            ],
          ),
        )));
  }
}

class ValueListenableDemoWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter _counter = Provider.of<Counter>(context);
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
                    //_valueNotifier.value(_valueNotifier.value++);
                  }),
              Text(
                _counter.currentValue.toString(),
                style: Theme.of(context).textTheme.display3,
              ),
              IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    //_valueNotifier.value(_valueNotifier.value--);
                  })
            ],
          ),
        )));
  }
}
