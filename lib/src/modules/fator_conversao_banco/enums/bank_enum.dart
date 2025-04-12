enum BankEnum {
  bancoDoBrasil(0),
  bradesco(1),
  caixa(2),
  itau(3),
  santander(4);

  final int value;

  const BankEnum(this.value);

  static BankEnum getByValue(int valor) {
    switch (valor) {
      case 0:
        return BankEnum.bancoDoBrasil;
      case 1:
        return BankEnum.bradesco;
      case 2:
        return BankEnum.caixa;
      case 3:
        return BankEnum.itau;
      case 4:
        return BankEnum.santander;
      default:
        throw Exception('Banco não encontrado.');
    }
  }
}