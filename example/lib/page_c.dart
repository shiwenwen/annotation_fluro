/// page_b
/// Created by smindu-sww on 2020/7/14
import 'package:flutter/material.dart';
import 'package:annotation_fluro/route.dart';

Widget pageCHandler(BuildContext _, Map<String, List<String>> params) => PageC(
      from: params['from']?.first,
    );

@FRoute(routePath: '/c', handlerFunc: pageCHandler)
class PageC extends StatelessWidget {
  final String from;

  PageC({this.from});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageC'),
      ),
      body: Center(
        child: Text('From: $from'),
      ),
    );
  }
}
