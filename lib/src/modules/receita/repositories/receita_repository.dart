import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/modules/receita/entities/receita_entity.dart';
import 'package:caidy_api/src/modules/receita/repositories/i_receita_repository.dart';
import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/repositories/base_repository.dart';
import 'package:caidy_api/src/shared/repositories/single_repository.dart';
import 'package:vaden/vaden.dart';

@Repository()
class ReceitaRepository extends SingleRepository<ReceitaEntity> implements IReceitaRepository {
  ReceitaRepository(super.database);

  @override
  String get getTableName => 'receita';

  @override
  String createTable() => '''
      CREATE TABLE $getTableName (
        $getIdColumnName UUID NOT NULL PRIMARY KEY,
        ${BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME} TIMESTAMP NOT NULL,
        ${BaseRepository.DATA_HORA_ULTIMA_ALTERACAO_COLUMN_NAME} TIMESTAMP,
        ${BaseRepository.DATA_HORA_DELETADO_COLUMN_NAME} TIMESTAMP,
        ${BaseRepository.ID_DISPOSITIVO_COLUMN_NAME} UUID NOT NULL,
        ${BaseRepository.ID_USUSARIO_COLUMN_NAME} UUID NOT NULL,
        descricao TEXT NOT NULL,
        valor REAL NOT NULL DEFAULT 0,
        detalhe TEXT,
        data_pagamento TIMESTAMP NOT NULL,
        metodo_pagamento INTEGER NOT NULL DEFAULT 0,
        id_categoria UUID NOT NULL,        
        ${createForeignKeyWithRestrict('categoria', 'id_categoria')},
        $usuarioForeignKeyWithRestrict     
      );
  ''';

  @override
  List<String> get indexs =>
      [
        createIndex(getTableName, BaseRepository.ID_USUSARIO_COLUMN_NAME),
        createIndex(getTableName, BaseRepository.ID_DISPOSITIVO_COLUMN_NAME),
        createIndex(getTableName, BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME),
        createIndex(getTableName, 'descricao'),
        createIndex(getTableName, 'valor'),
        createIndex(getTableName, 'data_pagamento'),
        createIndex(getTableName, 'metodo_pagamento'),
      ];

  @override
  ReceitaEntity fromMap(Map<String, dynamic> map) {
    return ReceitaEntity(
      base: baseFromMap(map),
      descricao: map['descricao'],
      valor: map['valor'],
      detalhes: map['detalhe'],
      dataPagamento: map['data_pagamento'],
      metodoPagamento: map['metodo_pagamento'],
      categoria: CategoriaEntity(
        base: BaseEntity(
          id: map['categoria_id_categoria'],
          dataHoraCriado: map['categoria${BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME}'],
          dataHoraUltimaAlteracao: map['categoria${BaseRepository.DATA_HORA_ULTIMA_ALTERACAO_COLUMN_NAME}'],
          dataHoraDeletado: map['categoria${BaseRepository.DATA_HORA_DELETADO_COLUMN_NAME}'],
          idDispositivo: map['categoria${BaseRepository.ID_DISPOSITIVO_COLUMN_NAME}'],
          idUsuario: map['categoria${BaseRepository.ID_USUSARIO_COLUMN_NAME}'],
        ),
        descricao: map['categoria_descricao'],
        icon: map['categoria_icon'],
        tipo: map['categoria_tipo'],
      ),
    );
  }

  @override
  Map<String, dynamic> toMap(ReceitaEntity entity) {
    return {
      ...baseToMap(entity),
      'descricao': entity.descricao,
      'valor': entity.valor,
      'detalhe': entity.detalhes,
      'data_pagamento': entity.dataPagamento,
      'metodo_pagamento': entity.metodoPagamento,
      'id_categoria': entity.categoria.base.id,
    };
  }
}