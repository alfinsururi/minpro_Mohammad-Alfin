import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart generator.dart module_name');
    exit(1);
  }

  final moduleName = arguments[0];

  final modulePath = 'lib/module/$moduleName';
  final viewPath = '$modulePath/view';
  final viewModelPath = '$modulePath/viewmodel';
  final modelPath = '$modulePath/model';

  final moduleDir = Directory(modulePath);
  final viewDir = Directory(viewPath);
  final viewModelDir = Directory(viewModelPath);
  final modelDir = Directory(modelPath);

  if (!(arguments.length == 2 &&
      (arguments[1] == "force" || arguments[1] == "f"))) {
    if (moduleDir.existsSync()) {
      print('Module already exists!');
      exit(1);
    }
  }

  moduleDir.createSync();
  viewDir.createSync(recursive: true);
  viewModelDir.createSync(recursive: true);
  modelDir.createSync(recursive: true);

  final viewFile = File('$viewPath/${moduleName}_view.dart');
  final viewModelFile = File('$viewModelPath/${moduleName}_viewmodel.dart');
  final modelFile = File('$modelPath/${moduleName}_model.dart');

  viewFile.createSync(recursive: true);
  viewModelFile.createSync(recursive: true);
  modelFile.createSync(recursive: true);

  viewFile.writeAsStringSync('import \'package:flutter/material.dart\';\n\n'
      'import \'package:provider/provider.dart\';\n'
      'import \'../viewmodel/${moduleName}_viewmodel.dart\';\n\n'
      'class ${_toUpperCamelCase(moduleName)}View extends StatelessWidget {\n'
      '  const ${_toUpperCamelCase(moduleName)}View({Key? key}) : super(key: key);\n\n'
      '  @override\n'
      '  Widget build(BuildContext context) {\n'
      '    final viewModel = Provider.of<${_toUpperCamelCase(moduleName)}ViewModel>(context, listen: false);\n\n'
      '    return Scaffold(\n'
      '      appBar: AppBar(\n'
      '        title: const Text(\'${_toUpperCamelCase(moduleName)}\'),\n'
      '      ),\n'
      '      body: Column(\n'
      '        mainAxisAlignment: MainAxisAlignment.center,\n'
      '        children: const [],\n'
      '      ),\n'
      '    );\n'
      '  }\n'
      '}\n');

  viewModelFile.writeAsStringSync('import \'package:flutter/material.dart\';\n'
      'import \'package:provider/provider.dart\';\n\n'
      'class ${_toUpperCamelCase(moduleName)}ViewModel with ChangeNotifier {\n\n'
      '}\n');

  modelFile.writeAsStringSync('class ${moduleName}_Model {\n\n'
      '}\n');

  registerProvider(moduleName);

  print('Module generated successfully!');
}

String _toUpperCamelCase(String str) {
  return str
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join();
}

void registerProvider(String moduleName) {
  final mainFile = File('lib/main.dart');
  var lines = mainFile.readAsLinesSync();
  for (var i = 0; i < lines.length; i++) {
    lines[i] = lines[i].trim();
  }

  final importLine =
      "import 'package:simple_accounting/module/$moduleName/viewmodel/${moduleName}_viewmodel.dart';";
  final providerLine =
      'ChangeNotifierProvider<${_toUpperCamelCase(moduleName)}ViewModel>(create: (_) => ${_toUpperCamelCase(moduleName)}ViewModel(),),';

  final isAlreadyRegistered = lines.any((line) =>
      line.contains('${_toUpperCamelCase(moduleName)}ViewModel') &&
      line.contains('ChangeNotifierProvider'));

  if (isAlreadyRegistered) {
    print('Provider for $moduleName is already registered.');
    return;
  }

  // Add import line to the top of the file
  lines.insert(0, importLine);

  final index = lines.indexOf('//@END OF GENERATED');
  print(index);
  lines.insert(index, providerLine);

  mainFile.writeAsStringSync(lines.join('\n'));

  print('Provider for $moduleName has been registered successfully.');
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
