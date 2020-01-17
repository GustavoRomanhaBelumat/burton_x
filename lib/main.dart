import 'package:burton_x/BLoC/EventListBLoC.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EventListBLoC>.value(
          value: EventListBLoC(),
        )
      ],
      child: Initializator(),
    );
  }
}

class Initializator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Event List"),
        ),
      ),
    );
  }
}
