import 'package:auto_mapper/auto_mapper_annotation.dart';
import 'package:caidy_api/src/modules/categoria/dto/categoria_dto.dart';
import 'package:caidy_api/src/modules/despesas/entities/despesa_entity.dart';
import 'package:caidy_api/src/modules/despesas/submodules/despesa_recorrente/dto/despesa_recorrente_dto.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/dto/fator_conversao_banco_dto.dart';
import 'package:caidy_api/src/shared/dto/base_dto.dart';
import 'package:caidy_api/src/shared/dto/i_base_dto.dart';
import 'package:caidy_api/src/shared/parsers/date_time_parse.dart';
import 'package:vaden/vaden.dart';

@AutoMap(target: DespesaEntity)
@DTO()
class DespesaDto implements IBaseDto {
  @override
  BaseDto base;

  final String descricao;

  final double valor;

  final String? detalhes;

  final CategoriaDto categoria;

  @UseParse(DateTimeParse)
  final DateTime dataPagamento;

  //final EnumMetodoPagamento metodoPagamento;

  final bool pagamentoRecorrente;

  final List<DespesaRecorrenteDto> despesasRecorrentes;

  final FatorConversaoBancoDto fatorConversaoBanco;

  DespesaDto({
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
