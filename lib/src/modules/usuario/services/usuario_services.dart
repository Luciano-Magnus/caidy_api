import 'dart:math';

import 'package:caidy_api/src/modules/usuario/dto/token_usuario_dto.dart';
import 'package:caidy_api/src/modules/usuario/entities/usuario_entity.dart';
import 'package:caidy_api/src/modules/usuario/repositories/i_usuario_repository.dart';
import 'package:caidy_api/src/modules/usuario/services/i_usuario_service.dart';
import 'package:caidy_api/src/shared/services/base_service.dart';
import 'package:vaden/vaden.dart';
import 'package:vaden_security/vaden_security.dart';

@Service()
class UsuarioServices extends BaseService<UsuarioEntity, IUsuarioRepository> implements IUsuarioService {
  final JwtService _jwtService;

  UsuarioServices(IUsuarioRepository repository, this._jwtService) : super(repository);

  @override
  Future<TokenUsuarioDto> createJwt(UsuarioEntity usuario) async {
    final UserDetails userDetails = UserDetails(
      username: usuario.nome,
      password: usuario.cpfCnpj,
      roles: ['CLIENT'],
    );

    final String token = _jwtService.generateToken(
      userDetails,
      claims: {
        'id': usuario.base.id,
        'nome': usuario.nome,
        'cpfCnpj': usuario.cpfCnpj,
      },
    );

    return TokenUsuarioDto(
      token: token,
      refreshToken: _generateRefreshToken(),
    );
  }

  String _generateRefreshToken() {
    //Gera uma string aleatória de 32 caracteres

    const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    const int length = 32;

    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < length; i++) {
      final int index = Random().nextInt(chars.length);
      buffer.write(chars[index]);
    }

    return buffer.toString();
  }
}
