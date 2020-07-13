/// route
/// Created by smindu-sww on 2020/7/13
import 'package:fluro/fluro.dart';

import 'src/annotation.dart';

class FRoute extends Annotation {
  final String routePath;
  final HandlerType handlerType;
  final HandlerFunc handlerFunc;
  final TransitionType transitionType;

  const FRoute(
      {this.routePath,
      this.handlerType = HandlerType.function,
      this.handlerFunc,
      this.transitionType});
}
