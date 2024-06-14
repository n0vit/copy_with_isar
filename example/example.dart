import 'package:copy_with_isar/annotations.dart';

part 'example.icopy.dart';

@IsarCopy()
class ExampleModel {
  String? firstName;
  String? lastName;
}

void main() {
  final model = ExampleModel()
    ..firstName = 'Json'
    ..lastName = 'Smith';
  print('Original: ${model.firstName} ${model.lastName}');

  final updatedModel = model.copyWith(firstName: 'Jane');
  print('Updated: ${updatedModel.firstName} ${updatedModel.lastName}');
}
