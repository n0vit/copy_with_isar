import 'package:copy_with_isar/src/copy_with_generator.dart';
import 'package:test/test.dart';
import 'package:build_test/build_test.dart';
import 'package:source_gen/source_gen.dart';

void main() {
  group('CopyWithGenerator', () {
    test('generates copyWith method correctly', () async {
      const source = '''
      import 'package:copy_with_generator.dart';
      
      part 'user_model.i_copy.dart';

      @CopyIsar()
      class UserModel {
        Id id = Isar.autoIncrement;

        String? firstName;
        String? lastName;
      }
      ''';

      const expectedOutput = '''
      // GENERATED CODE - DO NOT MODIFY BY HAND

      part of 'user_model.dart';

      extension UserModelCopyWith on UserModel {
        UserModel copyWith({
          Id? id,
          String? firstName,
          String? lastName,
        }) {
          return UserModel(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
          );
        }
      }
      ''';

      final builder = PartBuilder([CopyWithGenerator()], '.i_copy.dart');

      await testBuilder(
        builder,
        {'a|lib/user_model.dart': source},
        outputs: {'a|lib/user_model.copy_with.dart': expectedOutput},
        reader: await PackageAssetReader.currentIsolate(),
      );
    });
  });
}
