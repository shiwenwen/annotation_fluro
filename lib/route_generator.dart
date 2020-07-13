/// route_generator
/// Created by smindu-sww on 2020/7/13
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/src/dart/constant/value.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import 'route.dart';

class RouteGenerator extends GeneratorForAnnotation<FRoute> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (annotation.objectValue is DartObjectImpl) {
      DartObjectImpl objImpl = annotation.objectValue;
      objImpl.fields.forEach((key, value) {
        print('====== $key:  $value =======');
      });
    }
//    String className = element.displayName;
//    String path = buildStep.inputId.path;
//    String routePath = annotation.peek('routePath').stringValue;
//    Element handlerElement =
//        annotation.peek('handler')?.objectValue?.type?.element;
//
//    return null;
  }
}
