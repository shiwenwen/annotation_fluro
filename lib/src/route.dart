/// routes
/// Created by smindu-sww on 2020/7/14
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'base_route.dart';

class FRoute extends BaseFRoute {
  final String routePath;
  final HandlerType handlerType;
  final HandlerFunc handlerFunc;
  final TransitionType transitionType;

  const FRoute(
      {this.routePath,
      this.handlerType = HandlerType.route,
      this.handlerFunc,
      this.transitionType});
}
