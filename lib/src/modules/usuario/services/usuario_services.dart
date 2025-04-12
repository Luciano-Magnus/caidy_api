import 'package:caidy_api/src/modules/usuario/entities/usuario_entity.dart';
import 'package:caidy_api/src/modules/usuario/repositories/i_usuario_repository.dart';
import 'package:caidy_api/src/modules/usuario/services/i_usuario_service.dart';
import 'package:caidy_api/src/shared/services/base_service.dart';
import 'package:vaden/vaden.dart';

@Service()
class UsuarioServices extends BaseService<UsuarioEntity, IUsuarioRepository> implements IUsuarioService {
  UsuarioServices(IUsuarioRepository repository) : super(repository);
}
