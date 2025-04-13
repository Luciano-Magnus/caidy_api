import 'package:caidy_api/src/modules/usuario/dto/token_usuario_dto.dart';
import 'package:caidy_api/src/modules/usuario/entities/usuario_entity.dart';
import 'package:caidy_api/src/shared/services/i_base_service.dart';

abstract class IUsuarioService implements IBaseService<UsuarioEntity> {
  Future<TokenUsuarioDto> createJwt(UsuarioEntity usuario);
}
