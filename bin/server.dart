import 'package:caidy_api/auto_mapper.dart';
import 'package:caidy_api/config/di/dependency_injectory.dart';
import 'package:caidy_api/src/shared/database/database.dart';
import 'package:caidy_api/vaden_application.dart';

void main() async {
  GeneratedMappings.register();

  final vaden = VadenApplication();
  DependencyInjection.init(vaden);

  print('''
  DATETIME: ${DateTime.now()}
  GUID: e3c613e8-6949-4277-9572-bac0f5e65cc6
  ''');

  await vaden.setup();

  await vaden.injector.get<Database>().createDatabase();

  final server = await vaden.run();

  print('Server listening on port http://localhost:${server.port}');

  print('Swagger UI: http://localhost:${server.port}/docs');
}

