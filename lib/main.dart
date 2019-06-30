import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/bloc/change_notifier/ChangeNotifierProviderBloc.dart';
import 'package:flutter_provider_demo/bloc/listenable/ListenableProviderBloc.dart';
import 'package:flutter_provider_demo/bloc/provider/ProviderDemoBloc.dart';
import 'package:flutter_provider_demo/bloc/value_listenable/Counter.dart';
import 'package:flutter_provider_demo/features/listenable_provider/listenable_provider.dart';
import 'package:flutter_provider_demo/features/provider/provider.dart';
import 'package:flutter_provider_demo/features/value_listenable/value_listenable_provider.dart';
import 'package:provider/provider.dart';
import 'helpers/utils.dart';
import 'bloc/stream_provider/StreamCounter.dart';

import 'features/changenotifier_provider/change_notifier_provider.dart';
import 'features/stream_provider/value_stream_provider.dart';

void main() {
  runApp(MyApp());
}

const RoundedRectangleBorder mRadiusBorder = RoundedRectangleBorder(
    borderRadius: BorderRadiusDirectional.all(Radius.circular(8)));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    utils.counterController.add(StreamCounter(currentValue: 0));
    return MultiProvider(
        providers: [
          Provider<ProviderDemoBloc>.value(
              value: ProviderDemoBloc(),
              updateShouldNotify: (a, b) {
                print("updateShouldNotify");
                return a.counter != b.counter;
              }),
          ListenableProvider<ListenableProviderDemoBloc>.value(value: ListenableProviderDemoBloc()),
          ChangeNotifierProvider<ChangeNotifierProviderDemoBloc>.value(value: ChangeNotifierProviderDemoBloc()),
          ValueListenableProvider<Counter>.value(value:  ValueNotifier(Counter(currentValue:10))),
          StreamProvider.value(value: utils.counterController.stream)
        ],
        child: MaterialApp(
          title: 'Flutter Provider Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Provider'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProviderDemoWidget();
                }));
              },
              child: Text("Provider Demo"),
              shape: mRadiusBorder,
            ),
            OutlineButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ListenableDemoWidget();
                  }));
                },
                child: Text("ListenableProvider Demo"),
                shape: mRadiusBorder),
            OutlineButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangeNotifierDemoWidget();
                  }));
                },
                child: Text("ChangeNotifierProvider Demo"),
                shape: mRadiusBorder),
            OutlineButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ValueListenableDemoWidget2();
                  }));
                },
                child: Text("ValueListenableProvider Demo"),
                shape: mRadiusBorder),
            OutlineButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return StreamProviderDemoWidget();
                  }));
                },
                child: Text("StreamProvider Demo"),
                shape: mRadiusBorder),
            OutlineButton(
                onPressed: () {},
                child: Text("FutureProvider Demo"),
                shape: mRadiusBorder),
          ],
        ),
      ),
    );
  }
}
