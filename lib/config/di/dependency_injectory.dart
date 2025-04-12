import 'package:caidy_api/src/shared/database/database.dart';
import 'package:caidy_api/vaden_application.dart';
import 'package:vaden/vaden.dart';

class DependencyInjection {
  static late final _injector;

  static Injector get injector => _injector;

  static void init(VadenApplication app) {
    _injector = app.injector;

    // Add your dependencies here
    injector.add(Database.new);
  }
}
