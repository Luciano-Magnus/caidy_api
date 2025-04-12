import 'package:auto_mapper/auto_mapper.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/dto/fator_conversao_banco_dto.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/enums/bank_enum.dart';
import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/entity/i_base_entity.dart';

@AutoMap(target: FatorConversaoBancoDto)
class FatorConversaoBancoEntity implements IBaseEntity {
  @override
  BaseEntity base;

  BankEnum banco;

  String? descricaoDespesaNova;
  String? descricaoDespesaAntiga;

  String? descricaoCategoriaNova;
  String? descricaoCategoriaAntiga;

  FatorConversaoBancoEntity({
    required this.base,
    required this.banco,
    required this.descricaoDespesaNova,
    required this.descricaoDespesaAntiga,
    required this.descricaoCategoriaNova,
    required this.descricaoCategoriaAntiga,
  });
}
