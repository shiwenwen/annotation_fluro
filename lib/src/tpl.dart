/// template
/// Created by smindu-sww on 2020/7/14
const String route_tpl = '''
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
{{{imports}}}

Router registerFluroRouter() {
  var router = Router();
  {{{routes}}}
  return router;
}
''';
