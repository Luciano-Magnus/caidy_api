import 'package:auto_mapper/auto_mapper.dart';
import 'package:caidy_api/src/modules/categoria/dto/categoria_dto.dart';
import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/modules/categoria/services/i_categoria_service.dart';
import 'package:caidy_api/src/shared/controllers/base_controller.dart';
import 'package:caidy_api/src/shared/services/base_service.dart';
import 'package:caidy_api/src/shared/utils/TesteUtils.dart';
import 'package:vaden/vaden.dart';

@Api(tag: 'Categoria', description: 'Controller para salvar e buscar categorias.')
@Controller('/categoria')
class CategoriaController extends BaseController<CategoriaDto, CategoriaEntity, ICategoriaService> {
  CategoriaController(super.service);
}
