import 'package:auto_mapper/auto_mapper_annotation.dart';
import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/modules/receita/dto/receita_dto.dart';
import 'package:caidy_api/src/modules/receita/enums/enum_metodo_pagamento.dart';
import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/entity/i_base_entity.dart';

@AutoMap(target: ReceitaDto)
class ReceitaEntity implements IBaseEntity {
  @override
  BaseEntity base;

  String descricao;

  double valor;

  String? detalhes;

  CategoriaEntity categoria;

  DateTime dataPagamento;

  EnumMetodoPagamento metodoPagamento;

  ReceitaEntity({
    required this.base,
    required this.descricao,
    required this.valor,
    required this.detalhes,
    required this.categoria,
    required this.dataPagamento,
    required this.metodoPagamento,
  });
}
