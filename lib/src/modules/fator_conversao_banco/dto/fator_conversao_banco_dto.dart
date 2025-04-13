import 'package:auto_mapper/auto_mapper_annotation.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/entities/fator_conversao_banco_entity.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/enums/bank_enum.dart';
import 'package:caidy_api/src/shared/dto/base_dto.dart';
import 'package:caidy_api/src/shared/dto/i_base_dto.dart';
import 'package:caidy_api/src/shared/parsers/enum_parse.dart';
import 'package:vaden/vaden.dart';

@AutoMap(target: FatorConversaoBancoEntity)
@DTO()
class FatorConversaoBancoDto implements IBaseDto {
  @override
  BaseDto base;

  @UseParse(EnumBankParse)
  BankEnum banco;

  String? descricaoDespesaNova;
  String? descricaoDespesaAntiga;

  String? descricaoCategoriaNova;
  String? descricaoCategoriaAntiga;

  FatorConversaoBancoDto({
    required this.base,
    required this.banco,
    required this.descricaoDespesaNova,
    required this.descricaoDespesaAntiga,
    required this.descricaoCategoriaNova,
    required this.descricaoCategoriaAntiga,
  });
}
