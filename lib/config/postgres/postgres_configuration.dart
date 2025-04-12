import 'package:postgres/postgres.dart';
import 'package:vaden/vaden.dart';

@Configuration()
class PostgresConfiguration {
  @Bean()
  Future<Connection> connection(ApplicationSettings settings) {
    final postgres = settings['postgres'];

    return Connection.open(
      Endpoint(
        host: postgres['host'],
        database: postgres['database'],
        port: postgres['port'],
        username: postgres['username'],
        password: postgres['password'],
      ),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );
  }
}