/// template
/// Created by smindu-sww on 2020/7/14
const String route_tpl = '''
import 'package:fluro/fluro.dart';
{{{imports}}}

Router registerFluroRouter({Router aRouter}) {
  final router = aRouter ?? Router();
  {{{routes}}}
  return router;
}
''';
