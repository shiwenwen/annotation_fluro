/// writer
/// Created by smindu-sww on 2020/7/14
import 'package:mustache4dart/mustache4dart.dart';

import 'collector.dart';
import 'tpl.dart';

class Writer {
  Collector collector;
  Writer(this.collector);
  String write() {
    collector.hasWrite = true;
    return render(route_tpl, {
      'imports': collector.imports.join('\n'),
      'routes': collector.routers.map((e) => e.generateCode).join('\n')
    });
  }
}
