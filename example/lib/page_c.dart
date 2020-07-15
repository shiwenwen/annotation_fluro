/// page_c
/// Created by smindu-sww on 2020/7/14
import 'package:flutter/material.dart';
import 'package:annotation_fluro/route.dart';

import 'router/routers.dart';

@FRoute(routePath: '/c')
class PageC extends StatelessWidget {
  final String from;
  PageC.from({this.from});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('From: $from'),
            RaisedButton(
              child: Text('To PageC'),
              onPressed: () {
                Routers.router.navigateTo(context, '/d?from=PageC');
              },
            ),
          ],
        ),
      ),
    );
  }
}
