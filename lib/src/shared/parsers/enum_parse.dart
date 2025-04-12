import 'package:caidy_api/src/modules/fator_conversao_banco/enums/bank_enum.dart';
import 'package:caidy_api/src/modules/receita/enums/enum_metodo_pagamento.dart';
import 'package:vaden/vaden.dart';

@Component()
class EnumBankParse extends ParamParse<BankEnum?, int> {
  const EnumBankParse();

  @override
  int toJson(BankEnum? param) {
    return param?.value ?? BankEnum.bancoDoBrasil.value;
  }

  @override
  BankEnum? fromJson(int? json) {
    return BankEnum.getByValue(json ?? BankEnum.bancoDoBrasil.value);
  }
}

class EnumMetodoPagamentoParse extends ParamParse<EnumMetodoPagamento?, int> {
  const EnumMetodoPagamentoParse();

  @override
  int toJson(EnumMetodoPagamento? param) {
    return param?.value ?? EnumMetodoPagamento.dinheiro.value;
  }

  @override
  EnumMetodoPagamento? fromJson(int? json) {
    return EnumMetodoPagamento.getByValue(json ?? EnumMetodoPagamento.dinheiro.value);
  }
}
