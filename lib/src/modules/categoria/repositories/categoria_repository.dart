import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/modules/categoria/repositories/i_categoria_repository.dart';
import 'package:caidy_api/src/shared/repositories/base_repository.dart';
import 'package:caidy_api/src/shared/repositories/single_repository.dart';
import 'package:postgres/postgres.dart';
import 'package:vaden/vaden.dart';

@Repository()
class CategoriaRepository extends SingleRepository<CategoriaEntity> implements ICategoriaRepository {
  CategoriaRepository(super.database);

  @override
  String get getTableName => 'categoria';

  @override
  String createTable() {
    return '''
      CREATE TABLE $getTableName (
        $getIdColumnName UUID NOT NULL PRIMARY KEY,
        ${BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME} TIMESTAMP NOT NULL,
        ${BaseRepository.DATA_HORA_ULTIMA_ALTERACAO_COLUMN_NAME} TIMESTAMP,
        ${BaseRepository.DATA_HORA_DELETADO_COLUMN_NAME} TIMESTAMP,
        ${BaseRepository.ID_DISPOSITIVO_COLUMN_NAME} UUID NOT NULL,
        ${BaseRepository.ID_USUSARIO_COLUMN_NAME} UUID NOT NULL,
        descricao TEXT NOT NULL,
        tipo INTEGER NOT NULL,
        icon INTEGER NOT NULL,
        $usuarioForeignKeyWithRestrict
      );
    ''';
  }

  @override
  List<String> get indexs => [
        createIndex(getTableName, BaseRepository.ID_USUSARIO_COLUMN_NAME),
        createIndex(getTableName, BaseRepository.ID_DISPOSITIVO_COLUMN_NAME),
        createIndex(getTableName, BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME),
        createIndex(getTableName, 'descricao'),
        createIndex(getTableName, 'tipo'),
      ];

  @override
  CategoriaEntity fromMap(Map<String, dynamic> map) {
    return CategoriaEntity(
      base: baseFromMap(map),
      descricao: map['descricao'],
      tipo: map['tipo'],
      icon: map['icon'],
    );
  }

  @override
  Map<String, dynamic> toMap(CategoriaEntity entity) {
    return {
      ...baseToMap(entity),
      'descricao': entity.descricao,
      'tipo': entity.tipo,
      'icon': entity.icon,
    };
  }
}
