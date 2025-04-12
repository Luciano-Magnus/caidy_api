import 'package:caidy_api/src/modules/fator_conversao_banco/entities/fator_conversao_banco_entity.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/enums/bank_enum.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/repositories/i_fator_conversao_repository.dart';
import 'package:caidy_api/src/shared/repositories/base_repository.dart';
import 'package:caidy_api/src/shared/repositories/single_repository.dart';
import 'package:vaden/vaden.dart';

@Repository()
class FatorConversaoRepository extends SingleRepository<FatorConversaoBancoEntity> implements IFatorConversaoRepository {
  FatorConversaoRepository(super.database);

  @override
  String get getTableName => 'fator_conversao';

  @override
  String createTable() {
    return '''
      CREATE TABLE $getTableName (
      $getIdColumnName UUID NOT NULL PRIMARY KEY,
      ${BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME} TIMESTAMP NOT NULL,
      ${BaseRepository.DATA_HORA_ULTIMA_ALTERACAO_COLUMN_NAME} TIMESTAMP,
      ${BaseRepository.DATA_HORA_DELETADO_COLUMN_NAME} TIMESTAMP,
      ${BaseRepository.ID_USUSARIO_COLUMN_NAME} UUID NOT NULL,
      ${BaseRepository.ID_DISPOSITIVO_COLUMN_NAME} UUID NOT NULL,
      banco INTEGER NOT NULL,
      descricao_despesa_nova TEXT,
      descricao_despesa_antiga TEXT,
      descricao_categoria_nova TEXT,
      descricao_categoria_antiga TEXT,
      $usuarioForeignKeyWithRestrict
    );
    ''';
  }

  @override
  List<String> get indexs => [
    createIndex(getTableName, BaseRepository.ID_USUSARIO_COLUMN_NAME),
    createIndex(getTableName, BaseRepository.ID_DISPOSITIVO_COLUMN_NAME),
    createIndex(getTableName, BaseRepository.DATA_HORA_CRIADO_COLUMN_NAME),
    createIndex(getTableName, 'banco'),
    createIndex(getTableName, 'descricao_despesa_nova'),
    createIndex(getTableName, 'descricao_despesa_antiga'),
    createIndex(getTableName, 'descricao_categoria_nova'),
    createIndex(getTableName, 'descricao_categoria_antiga'),
  ];

  @override
  FatorConversaoBancoEntity fromMap(Map<String, dynamic> map) {
    return FatorConversaoBancoEntity(
      base: baseFromMap(map),
      banco: BankEnum.values.firstWhere((e) => e.name == map['banco']),
      descricaoDespesaNova: map['descricao_despesa_nova'],
      descricaoDespesaAntiga: map['descricao_despesa_antiga'],
      descricaoCategoriaNova: map['descricao_categoria_nova'],
      descricaoCategoriaAntiga: map['descricao_categoria_antiga'],
    );
  }

  @override
  Map<String, dynamic> toMap(FatorConversaoBancoEntity entity) {
    return {
      ...baseToMap(entity),
      'banco': entity.banco.value,
      'descricao_despesa_nova': entity.descricaoDespesaNova,
      'descricao_despesa_antiga': entity.descricaoDespesaAntiga,
      'descricao_categoria_nova': entity.descricaoCategoriaNova,
      'descricao_categoria_antiga': entity.descricaoCategoriaAntiga,
    };
  }
}