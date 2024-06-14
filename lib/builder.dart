import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/copy_with_generator.dart';

Builder copyWithBuilder(BuilderOptions options) =>
    PartBuilder([CopyWithGenerator()], '.icopy.dart');
