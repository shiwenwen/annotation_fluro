/// collector
/// Created by smindu-sww on 2020/7/14
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import 'util.dart';
import 'common.dart';

class Collector {
  bool hasWrite = false;
  List<String> imports = [];
  List<RouteEntity> routers = [];
  collect(Element element, ConstantReader annotation, BuildStep buildStep) {
    final String routePath = annotation.peek('routePath').stringValue;
    final int handlerType = annotation.peek('handlerType')?.enumRawValue;
    final int transitionType = annotation.peek('transitionType')?.enumRawValue;
    final ExecutableElement handlerFunc =
        annotation.peek('handlerFunc')?.objectValue?.toFunctionValue();

    String importStr =
        "import '${element.source.uri}' show ${element.displayName};";
    if (null != handlerFunc) {
      importStr =
          "import '${handlerFunc.source.uri}' show ${handlerFunc.name};";
    }
    if (!imports.contains(importStr)) {
      imports.add(importStr);
    }
    routers.add(RouteEntity(
        routePath,
        HandlerType.values[handlerType].toString(),
        transitionType == null
            ? 'null'
            : TransitionType.values[transitionType].toString(),
        handlerFunc,
        element.displayName));
  }
}

class RouteEntity {
  final String routePath;
  final String handlerType;
  final String transitionType;
  final String className;
  final ExecutableElement handlerFunc;
  RouteEntity(this.routePath, this.handlerType, this.transitionType,
      this.handlerFunc, this.className);
  String get generateCode {
    String handler;
    if (null == handlerFunc) {
      handler =
          "Handler(type: $handlerType, handlerFunc: (_, __) => $className())";
    } else {
      handler = "Handler(type: $handlerType, handlerFunc: ${handlerFunc.name})";
    }
    return "router.define('$routePath', handler: $handler, transitionType: $transitionType);";
  }
}
