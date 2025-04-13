import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/modules/despesas/entities/despesa_entity.dart';
import 'package:caidy_api/src/modules/despesas/enums/metodo_pagamento_enum.dart';
import 'package:caidy_api/src/modules/despesas/repositories/i_despesa_repository.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/entities/fator_conversao_banco_entity.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/enums/bank_enum.dart';
import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/repositories/base_repository.dart';
import 'package:caidy_api/src/shared/repositories/single_repository.dart';
import 'package:vaden/vaden.dart';

@Repository()
class DespesaRepository extends SingleRepository<DespesaEntity> implements IDespesaRepository {
  DespesaRepository(super.database);

  @override
  String get getTableName => 'despesa';

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
        pagamento_recorrente INTEGER NOT NULL DEFAULT 0,
        ${getIdColumnName}_principal TEXT,
        id_categoria UUID NOT NULL,
        ${createForeignKeyWithRestrict('categoria', 'id_categoria')},
        $usuarioForeignKeyWithRestrict     
      );
  ''';

  @override
  List<String> get indexs => [
    createIndex(getTableName, BaseRepository.ID_USUSARIO_COLUMN_NAME),
    createIndex(getTableName, BaseRepository.ID_DISPOSITIVO_COLUMN_NAME),
    createIndex(getTableName, BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME),
    createIndex(getTableName, 'descricao'),
    createIndex(getTableName, 'valor'),
    createIndex(getTableName, 'data_pagamento'),
    createIndex(getTableName, 'metodo_pagamento'),
    createIndex(getTableName, 'pagamento_recorrente'),
    createIndex(getTableName, '${getIdColumnName}_principal'),
    createIndex(getTableName, 'id_categoria'),
  ];

  @override
  DespesaEntity fromMap(Map<String, dynamic> map) {
    return DespesaEntity(
      base: baseFromMap(map),
      descricao: map['descricao'],
      valor: map['valor'],
      detalhes: map['detalhe'],
      dataPagamento: map['data_pagamento'],
      pagamentoRecorrente: map['pagamento_recorrente'],
      metodoPagamento: MetodoPagamentoEnum.getByValue(map['metodo_pagamento']),
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
      despesasRecorrentes: [],
      fatorConversaoBanco: FatorConversaoBancoEntity(
        base: BaseEntity(
          id: map['fator_conversao_id_fator_conversao'],
          dataHoraCriado: map['fator_conversao${BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME}'],
          dataHoraUltimaAlteracao: map['fator_conversao${BaseRepository.DATA_HORA_ULTIMA_ALTERACAO_COLUMN_NAME}'],
          dataHoraDeletado: map['fator_conversao${BaseRepository.DATA_HORA_DELETADO_COLUMN_NAME}'],
          idDispositivo: map['fator_conversao${BaseRepository.ID_DISPOSITIVO_COLUMN_NAME}'],
          idUsuario: map['fator_conversao${BaseRepository.ID_USUSARIO_COLUMN_NAME}'],
        ),
        banco: BankEnum.values.firstWhere((e) => e.name == map['fator_conversao_banco']),
        descricaoDespesaNova: map['fator_conversao_descricao_despesa_nova'],
        descricaoDespesaAntiga: map['fator_conversao_descricao_despesa_antiga'],
        descricaoCategoriaNova: map['fator_conversao_descricao_categoria_nova'],
        descricaoCategoriaAntiga: map['fator_conversao_descricao_categoria_antiga'],
      ),
    );
  }

  @override
  Map<String, dynamic> toMap(DespesaEntity entity) {
    return {
      ...baseToMap(entity),
      'descricao': entity.descricao,
      'valor': entity.valor,
      'detalhe': entity.detalhes,
      'data_pagamento': entity.dataPagamento,
      'metodo_pagamento': entity.metodoPagamento.value,
      'pagamento_recorrente': entity.pagamentoRecorrente,
      'id_categoria': entity.categoria.base.id,
    };
  }
}