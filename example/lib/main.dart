import 'package:annotation_fluro/route.dart';
import 'package:flutter/material.dart';
import 'router/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Routers.router.generator,
      home: MyHomePage(),
    );
  }
}

@FRoute(routePath: '/home')
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('To PageA'),
          onPressed: () {
            Routers.router.navigateTo(context, '/a');
          },
        ),
      ),
    );
  }
}
