/// page_b
/// Created by smindu-sww on 2020/7/14
import 'package:flutter/material.dart';
import 'package:annotation_fluro/route.dart';

import 'router/routers.dart';

@FRoute('/b')
class PageB extends StatelessWidget {
  final String content;
  final int number;

  PageB(int number, {this.content}) : this.number = number;
  PageB.cc({this.content}) : this.number = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Content: $content'),
            Text('Number: $number'),
            RaisedButton(
              child: Text('To PageC'),
              onPressed: () {
                Routers.router.navigateTo(context, '/c?from=PageB');
              },
            ),
          ],
        ),
      ),
    );
  }
}
