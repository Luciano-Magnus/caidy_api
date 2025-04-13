import 'package:vaden/vaden.dart';
import 'package:vaden_security/vaden_security.dart';

@Configuration()
class AppConfiguration {
  @Bean()
  bool get isDebugMode {
    var inDebugMode = false;
    assert(inDebugMode = true); // se entrar aqui, está em debug
    return inDebugMode;
  }

  @Bean()
  ApplicationSettings settings() {
    final aplicationFile = isDebugMode ? 'application.yaml' : '../application.yaml';

    return ApplicationSettings.load(aplicationFile);
  }

  @Bean()
  Pipeline globalMiddleware(ApplicationSettings settings) {
    return Pipeline() //
        .addMiddleware(cors(allowedOrigins: ['*']))
        .addVadenMiddleware(EnforceJsonContentType())
        .addMiddleware(logRequests());
  }

  @Bean()
  ModuleRegister externalModules() {
    return ModuleRegister([
      // Add your external modules here
      VadenSecurity(),
    ]);
  }
}
