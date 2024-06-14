import 'package:build/build.dart';

import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';

import '../annotations.dart';

class CopyWithGenerator extends GeneratorForAnnotation<IsarCopy> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
          'Generator cannot target `${element.displayName}`.');
    }

    final className = element.displayName;
    final buffer = StringBuffer();

    buffer.writeln('extension ${className}CopyWith on $className {');
    buffer.writeln('$className copyWith({');

    for (final field in element.fields.where((field) => !field.isStatic)) {
      buffer.writeln('${field.type} ${field.name},');
    }

    buffer.writeln('}) {');
    buffer.writeln('return $className()');

    for (final field in element.fields.where((field) => !field.isStatic)) {
      buffer.writeln('..${field.name} = ${field.name} ?? this.${field.name}');
    }

    buffer.writeln(';');
    buffer.writeln('}');
    buffer.writeln('}');

    return buffer.toString();
  }
}
