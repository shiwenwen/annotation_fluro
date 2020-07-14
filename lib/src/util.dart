/// util
/// Created by smindu-sww on 2020/7/14
import 'package:analyzer/src/dart/constant/value.dart';
import 'package:source_gen/source_gen.dart';

extension Parse on ConstantReader {
  int get enumRawValue {
    final objectValue = this.objectValue;
    if (objectValue is DartObjectImpl) {
      return objectValue.fields['function']?.toIntValue();
    }
    return null;
  }
}
