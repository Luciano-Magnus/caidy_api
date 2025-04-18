import 'package:auto_mapper/auto_mapper_annotation.dart';
import 'package:caidy_api/src/modules/categoria/dto/categoria_dto.dart';
import 'package:caidy_api/src/modules/despesas/enums/metodo_pagamento_enum.dart';
import 'package:caidy_api/src/modules/receita/entities/receita_entity.dart';
import 'package:caidy_api/src/shared/dto/base_dto.dart';
import 'package:caidy_api/src/shared/dto/i_base_dto.dart';
import 'package:caidy_api/src/shared/parsers/enum_parse.dart';
import 'package:vaden/vaden.dart';

@AutoMap(target: ReceitaEntity)
@DTO()
class ReceitaDto implements IBaseDto {
  @override
  BaseDto base;

  String descricao;

  double valor;

  String? detalhes;

  CategoriaDto categoria;

  DateTime dataPagamento;

  @UseParse(EnumMetodoPagamentoParse)
  MetodoPagamentoEnum metodoPagamento;

  ReceitaDto({
    required this.base,
    required this.descricao,
    required this.valor,
    required this.detalhes,
    required this.categoria,
    required this.dataPagamento,
    required this.metodoPagamento,
  });
}
