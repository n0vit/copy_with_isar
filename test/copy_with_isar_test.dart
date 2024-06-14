import 'package:copy_with_isar/src/copy_with_generator.dart';
import 'package:test/test.dart';
import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';

void main() {
  group('CopyWithGenerator', () {
    test('generates copyWith method correctly', () async {
      const source = '''
        import 'package:copy_with_isar/annotations.dart';
        
        part 'user_model.icopy.dart';
        
        @IsarCopy()
        class ExampleModel {
          String? firstName;
          String? lastName;
        }
      ''';

      const expectedOutput = '''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ExampleModelCopyWith on ExampleModel {
  ExampleModel copyWith({
    String? firstName,
    String? lastName,
  }) {
    return ExampleModel()
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName;
  }
}
''';

      final builder = PartBuilder([CopyWithGenerator()], '.icopy.dart');

      await testBuilder(
        builder,
        {'a|lib/user_model.dart': source},
        outputs: {'a|lib/user_model.icopy.dart': expectedOutput},
        reader: await PackageAssetReader.currentIsolate(),
      );
    });
  });
}
