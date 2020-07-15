// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteWriterGenerator
// **************************************************************************

import 'package:fluro/fluro.dart';
import 'package:example/page_a.dart' show PageA;
import 'package:example/page_d.dart' show pageDHandler;
import 'package:example/page_c.dart' show PageC;
import 'package:example/main.dart' show MyHomePage;
import 'package:example/page_b.dart' show PageB;

Router registerFluroRouter({Router aRouter}) {
  final router = aRouter ?? Router();
  router.define('/a',
      handler:
          Handler(type: HandlerType.route, handlerFunc: (_, __) => PageA()),
      transitionType: null);
  router.define('/d',
      handler: Handler(type: HandlerType.route, handlerFunc: pageDHandler),
      transitionType: null);
  router.define('/c',
      handler: Handler(
          type: HandlerType.route,
          handlerFunc: (_, params) => PageC.from(from: params['from']?.first)),
      transitionType: null);
  router.define('/home',
      handler: Handler(
          type: HandlerType.route, handlerFunc: (_, __) => MyHomePage()),
      transitionType: null);
  router.define('/b',
      handler: Handler(
          type: HandlerType.route,
          handlerFunc: (_, params) => PageB(
              int.tryParse(params['number']?.first),
              content: params['content']?.first)),
      transitionType: null);
  return router;
}
