import 'package:caidy_api/config/di/dependency_injectory.dart';
import 'package:caidy_api/src/modules/usuario/dto/token_usuario_dto.dart';
import 'package:caidy_api/src/modules/usuario/dto/usuario_dto.dart';
import 'package:caidy_api/src/modules/usuario/entities/usuario_entity.dart';
import 'package:caidy_api/src/modules/usuario/services/i_usuario_service.dart';
import 'package:caidy_api/src/shared/controllers/base_controller.dart';
import 'package:caidy_api/src/shared/controllers/main_controller.dart';
import 'package:caidy_api/src/shared/dto/base_dto.dart';
import 'package:postgres/postgres.dart';
import 'package:vaden/vaden.dart';
import 'package:vaden/vaden_openapi.dart';
import 'package:vaden_security/vaden_security.dart';

@Api(tag: 'Usuario', description: 'Controller para salvar e buscar usuarios.')
@Controller('/usuario')
class UsuarioController extends MainController<UsuarioDto, UsuarioEntity> {
  final IUsuarioService service;

  UsuarioController(this.service);

  @Post('/create')
  Future<TokenUsuarioDto> create(@Body() UsuarioDto dto) async {
    final usuario = await service.saveOrUpdate(super.entityFromDto(dto));

    return await service.createJwt(usuario);
  }
}
