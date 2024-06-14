# Copy With Isar

A package for auto-generating `copyWith` methods in Dart classes.

## Features

- Automatically generate `copyWith` methods for your Dart classes.
- Simple and easy to use.
- Reccommends for use with [Isar](https://pub.dev/packages/isar) models

## Usage

```dart
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
  print('Original: ${model.firstName} ${model.lastName}'); //Original: Json Smith

  final updatedModel = model.copyWith(firstName: 'Jane');
  print('Updated: ${updatedModel.firstName} ${updatedModel.lastName}'); //Updated: Jane Smith
}
```

To use this package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  copy_with_isar: ^0.0.3
```
