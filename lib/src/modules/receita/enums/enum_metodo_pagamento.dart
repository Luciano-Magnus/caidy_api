enum EnumMetodoPagamento {
  dinheiro(descricao: 'Dinheiro', value: 0),
  cartao(descricao: 'Cartão', value: 1),
  pix(descricao: 'Pix', value: 2),
  cheque(descricao: 'Cheque', value: 3),
  online(descricao: 'Online', value: 4);

   const EnumMetodoPagamento({
    required this.descricao,
    required this.value,
  });

  final String descricao;
  final int value;

 static EnumMetodoPagamento getByValue(int valor) {
    switch (valor) {
      case 0:
        return EnumMetodoPagamento.dinheiro;
      case 1:
        return EnumMetodoPagamento.cartao;
      case 2:
        return EnumMetodoPagamento.pix;
      case 3:
        return EnumMetodoPagamento.cheque;
      case 4:
        return EnumMetodoPagamento.online;
      default:
        throw Exception('Método de pagamento não encontrado.');
    }
  }
}
