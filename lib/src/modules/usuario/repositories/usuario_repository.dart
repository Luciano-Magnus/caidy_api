import 'package:caidy_api/src/modules/usuario/entities/usuario_entity.dart';
import 'package:caidy_api/src/modules/usuario/repositories/i_usuario_repository.dart';
import 'package:caidy_api/src/shared/repositories/base_repository.dart';
import 'package:caidy_api/src/shared/repositories/single_repository.dart';
import 'package:postgres/postgres.dart';
import 'package:vaden/vaden.dart';

@Repository()
class UsuarioRepository extends SingleRepository<UsuarioEntity> implements IUsuarioRepository {
  UsuarioRepository(super.database);

  @override
  String get getTableName => 'usuario';

  @override
  String createTable() => '''
      CREATE TABLE $getTableName (
        $getIdColumnName UUID NOT NULL PRIMARY KEY,
        ${BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME} TIMESTAMP NOT NULL,
        ${BaseRepository.DATA_HORA_ULTIMA_ALTERACAO_COLUMN_NAME} TIMESTAMP,
        ${BaseRepository.DATA_HORA_DELETADO_COLUMN_NAME} TIMESTAMP,
        ${BaseRepository.ID_DISPOSITIVO_COLUMN_NAME} UUID NOT NULL,
        nome TEXT NOT NULL,
        cpf_cnpj TEXT NOT NULL
      );
  ''';

  @override
  List<String> get indexs => [
    createIndex(getTableName, BaseRepository.ID_USUSARIO_COLUMN_NAME),
    createIndex(getTableName, BaseRepository.ID_DISPOSITIVO_COLUMN_NAME),
    createIndex(getTableName, BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME),
    createIndex(getTableName, 'nome'),
  ];

  @override
  UsuarioEntity fromMap(Map<String, dynamic> map) {
    return UsuarioEntity(
      base: baseFromMap(map),
      nome: map['nome'],
      cpfCnpj: map['cpf_cnpj'],
    );
  }

  @override
  Map<String, dynamic> toMap(UsuarioEntity entity) {
    return {
      ...baseToMap(entity),
      'nome': entity.nome,
      'cpf_cnpj': entity.cpfCnpj,
    };
  }

}