import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/bloc/provider/ProviderDemoBloc.dart';
import 'package:provider/provider.dart';

class ProviderDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProviderDemoBloc providerDemoBloc = Provider.of<ProviderDemoBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("ProviderDemoWidget"),
        ),
        body: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: () {
                providerDemoBloc.increment();
              }),
              Text(
                providerDemoBloc.counter.toString(),
                style: Theme.of(context).textTheme.display3,
              ),
              IconButton(icon: Icon(Icons.remove), onPressed: () {
                providerDemoBloc.decrement();
              })
            ],
          ),
        )));
  }
}
