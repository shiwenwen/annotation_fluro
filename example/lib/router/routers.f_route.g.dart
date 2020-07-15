// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteWriterGenerator
// **************************************************************************

import 'package:fluro/fluro.dart';
import 'package:example/page_b.dart' show PageB;
import 'package:example/main.dart' show MyHomePage;
import 'package:example/page_c.dart' show pageCHandler;
import 'package:example/page_a.dart' show PageA;

Router registerFluroRouter({Router aRouter}) {
  final router = aRouter ?? Router();
  router.define('/b',
      handler: Handler(
          type: HandlerType.route,
          handlerFunc: (_, params) => PageB(
              int.tryParse(params['number']?.first),
              content: params['content']?.first)),
      transitionType: null);
  router.define('/home',
      handler: Handler(
          type: HandlerType.route, handlerFunc: (_, __) => MyHomePage()),
      transitionType: null);
  router.define('/c',
      handler: Handler(type: HandlerType.route, handlerFunc: pageCHandler),
      transitionType: null);
  router.define('/a',
      handler:
          Handler(type: HandlerType.route, handlerFunc: (_, __) => PageA()),
      transitionType: null);
  return router;
}
