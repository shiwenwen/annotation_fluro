/// route_generator
/// Created by smindu-sww on 2020/7/13
import 'package:analyzer/dart/element/element.dart';
import 'package:annotation_fluro/src/writer.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import 'base_route.dart';
import 'collector.dart';

class RouteGenerator extends GeneratorForAnnotation<BaseFRoute> {
  static Collector collector = Collector();

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    collector.collect(element, annotation, buildStep);
    return null;
  }
}

class RouteWriterGenerator extends GeneratorForAnnotation<FRootRoute> {
  Collector collector() {
    return RouteGenerator.collector;
  }

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (collector().hasWrite) return null;
    return Writer(collector()).write();
  }
}
