import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/entity/i_base_entity.dart';

abstract class BaseRepository<E extends IBaseEntity> {
  static const DATA_HORA_CRIADO_COLUMN_NAME = 'data_hora_criado';

  // ignore: constant_identifier_names
  static const DATA_HORA_DELETADO_COLUMN_NAME = 'data_hora_deletado';

  // ignore: constant_identifier_names
  static const DATA_HORA_ULTIMA_ALTERACAO_COLUMN_NAME = 'data_hora_ultima_alteracao';

  // ignore: constant_identifier_names
  static const ID_USUSARIO_COLUMN_NAME = 'id_usuario';

  // ignore: constant_identifier_names
  static const ID_DISPOSITIVO_COLUMN_NAME = 'id_dispositivo';

  // ignore: constant_identifier_names
  static const DEFAULT_SEPARATOR = '~!@#%^&*()?';

  String get getTableName;

  String get getIdColumnName => "id_$getTableName";

  String get usuarioForeignKeyWithRestrict => createForeignKeyWithRestrict('usuario', ID_USUSARIO_COLUMN_NAME);

  String createTable();

  List<String> get indexs => [];

  BaseEntity baseFromMap(Map<String, dynamic> map) {
    return BaseEntity(
      id: map[getIdColumnName],
      dataHoraCriado: map[DATA_HORA_CRIADO_COLUMN_NAME],
      dataHoraUltimaAlteracao: map[DATA_HORA_ULTIMA_ALTERACAO_COLUMN_NAME],
      dataHoraDeletado: map[DATA_HORA_DELETADO_COLUMN_NAME],
      idDispositivo: map[ID_DISPOSITIVO_COLUMN_NAME],
      idUsuario: map[ID_USUSARIO_COLUMN_NAME],
    );
  }

  Map<String, dynamic> baseToMap(E entity) {
    return {
      getIdColumnName: entity.base.id,
      DATA_HORA_CRIADO_COLUMN_NAME: entity.base.dataHoraCriado,
      DATA_HORA_ULTIMA_ALTERACAO_COLUMN_NAME: entity.base.dataHoraUltimaAlteracao,
      DATA_HORA_DELETADO_COLUMN_NAME: entity.base.dataHoraDeletado,
      ID_DISPOSITIVO_COLUMN_NAME: entity.base.idDispositivo,
      ID_USUSARIO_COLUMN_NAME: entity.base.idUsuario,
    };
  }

  String createForeignKeyWithRestrict(String tableName, String columnName) {
    return '''
      CONSTRAINT FK_$columnName FOREIGN KEY ($columnName) REFERENCES $tableName($columnName)
      ON DELETE RESTRICT
    ''';
  }

  String createForeignKeyWithCascade(String tableName, String columnName) {
    return '''
      FOREIGN KEY ($columnName) REFERENCES $tableName($columnName)
      ON DELETE CASCADE
    ''';
  }

  String createIndex(String tableName, String columnName) {
    return '''
      CREATE INDEX idx_${tableName}_$columnName ON $tableName ($columnName);
    ''';
  }
}