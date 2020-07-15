/// util
/// Created by smindu-sww on 2020/7/14
import 'package:analyzer/src/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

extension ConstantReaderParse on ConstantReader {
  int get enumRawValue {
    final objectValue = this.objectValue;
    if (objectValue is DartObjectImpl) {
      return objectValue.fields.values.first?.toIntValue();
    }
    return null;
  }
}

extension ConstructorElementParse on ConstructorElement {
  String get fullName {
    String className = enclosingElement.displayName;
    if (name.isEmpty) {
      return className;
    }
    return '$className.$name';
  }
}