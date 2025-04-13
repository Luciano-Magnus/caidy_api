import 'package:auto_mapper/auto_mapper_annotation.dart';
import 'package:caidy_api/src/modules/categoria/dto/categoria_dto.dart';
import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/modules/despesas/dto/despesa_dto.dart';
import 'package:caidy_api/src/modules/despesas/submodules/despesa_recorrente/entities/despesa_recorrente_entity.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/entities/fator_conversao_banco_entity.dart';
import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/entity/i_base_entity.dart';
import 'package:caidy_api/src/shared/parsers/date_time_parse.dart';
import 'package:vaden/vaden.dart';

@AutoMap(target: DespesaDto)
class DespesaEntity implements IBaseEntity {
  @override
  BaseEntity base;

  final String descricao;

  final double valor;

  final String? detalhes;

  final CategoriaEntity categoria;

  @UseParse(DateTimeParse)
  final DateTime dataPagamento;

  //final EnumMetodoPagamento metodoPagamento;

  final bool pagamentoRecorrente;

  final List<DespesaRecorrenteEntity> despesasRecorrentes;

  final FatorConversaoBancoEntity fatorConversaoBanco;

  DespesaEntity({
    required this.base,
    required this.descricao,
    required this.valor,
    required this.detalhes,
    required this.categoria,
    required this.dataPagamento,
    required this.despesasRecorrentes,
    //required this.metodoPagamento,
    required this.pagamentoRecorrente,
    required this.fatorConversaoBanco
  });
}
