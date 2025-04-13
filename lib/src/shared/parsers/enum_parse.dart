import 'package:caidy_api/src/modules/despesas/enums/metodo_pagamento_enum.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/enums/bank_enum.dart';
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

class EnumMetodoPagamentoParse extends ParamParse<MetodoPagamentoEnum?, int> {
  const EnumMetodoPagamentoParse();

  @override
  int toJson(MetodoPagamentoEnum? param) {
    return param?.value ?? MetodoPagamentoEnum.dinheiro.value;
  }

  @override
  MetodoPagamentoEnum? fromJson(int? json) {
    return MetodoPagamentoEnum.getByValue(json ?? MetodoPagamentoEnum.dinheiro.value);
  }
}
