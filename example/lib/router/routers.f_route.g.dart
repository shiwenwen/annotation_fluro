// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteWriterGenerator
// **************************************************************************

import 'package:fluro/fluro.dart';
import 'package:example/page_c.dart' show PageC;

Router registerFluroRouter({Router aRouter}) {
  final router = aRouter ?? Router();
  router.define('/c',
      handler: Handler(
          type: HandlerType.route,
          handlerFunc: (_, params) => PageC.from(from: params['from']?.first)),
      transitionType: null);
  return router;
}
