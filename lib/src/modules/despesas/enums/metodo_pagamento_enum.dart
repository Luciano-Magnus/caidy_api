enum MetodoPagamentoEnum {
  dinheiro(descricao: 'Dinheiro', value: 0),
  cartao(descricao: 'Cartão', value: 1),
  pix(descricao: 'Pix', value: 2),
  cheque(descricao: 'Cheque', value: 3),
  online(descricao: 'Online', value: 4);

  const MetodoPagamentoEnum({required this.descricao, required this.value});

  final String descricao;
  final int value;

  static MetodoPagamentoEnum getByValue(int valor) {
    switch (valor) {
      case 0:
        return MetodoPagamentoEnum.dinheiro;
      case 1:
        return MetodoPagamentoEnum.cartao;
      case 2:
        return MetodoPagamentoEnum.pix;
      case 3:
        return MetodoPagamentoEnum.cheque;
      case 4:
        return MetodoPagamentoEnum.online;
      default:
        throw Exception('Método de pagamento não encontrado.');
    }
  }
}
