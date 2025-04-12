import 'package:caidy_api/config/di/dependency_injectory.dart';
import 'package:caidy_api/src/modules/usuario/dto/usuario_dto.dart';
import 'package:caidy_api/src/modules/usuario/entities/usuario_entity.dart';
import 'package:caidy_api/src/modules/usuario/services/i_usuario_service.dart';
import 'package:caidy_api/src/shared/controllers/base_controller.dart';
import 'package:caidy_api/src/shared/dto/base_dto.dart';
import 'package:postgres/postgres.dart';
import 'package:vaden/vaden.dart';

@Api(tag: 'Usuario', description: 'Controller para salvar e buscar usuarios.')
@Controller('/usuario')
class UsuarioController extends BaseController<UsuarioDto, UsuarioEntity, IUsuarioService> {
  Connection get _connection => DependencyInjection.injector.get<Connection>();

  UsuarioController(super.service);

  @Get('/postgres')
  Future<List<UsuarioDto>> getCate() async {
    final result = await _connection.runTx((session) {
      return session.execute(Sql.named('select * from categoria'));
    });

    await _connection.close();

    print(result);

    return [
      UsuarioDto(
          base: BaseDto(
              id: 'id',
              dataHoraCriado: DateTime.now(),
              dataHoraUltimaAlteracao: null,
              dataHoraDeletado: null,
              idDispositivo: 'idDispositivo',
              idUsuario: 'idUsuario',
          ),
          nome: '',
          cpfCnpj: '',
      ),
    ];
  }
}
