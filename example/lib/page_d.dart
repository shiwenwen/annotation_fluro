/// page_d
/// Created by smindu-sww on 2020/7/14
import 'package:flutter/material.dart';
import 'package:annotation_fluro/route.dart';

Widget pageDHandler(BuildContext _, Map<String, List<String>> params) => PageD(
      from: params['from']?.first,
    );

@FRoute('/d', handlerFunc: pageDHandler)
class PageD extends StatelessWidget {
  final String from;

  PageD({this.from});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageD'),
      ),
      body: Center(
        child: Text('From: $from'),
      ),
    );
  }
}
