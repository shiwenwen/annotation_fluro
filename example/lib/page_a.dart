/// page_a
/// Created by smindu-sww on 2020/7/14
import 'package:flutter/material.dart';
import 'package:annotation_fluro/route.dart';

@FRoute(routePath: '/a')
class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageA'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('To PageB'),
          onPressed: () {},
        ),
      ),
    );
  }
}
