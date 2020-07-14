/// builder
/// Created by smindu-sww on 2020/7/13

import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import 'src/route_generator.dart';

Builder routeBuilder(BuilderOptions options) => LibraryBuilder(RouteGenerator(),
    generatedExtension: '.internal_invalid.dart');

Builder routeWriteBuilder(BuilderOptions options) =>
    LibraryBuilder(RouteWriterGenerator(),
        generatedExtension: '.f_route.g.dart');
