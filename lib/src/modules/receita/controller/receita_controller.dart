import 'package:caidy_api/src/modules/receita/dto/receita_dto.dart';
import 'package:caidy_api/src/modules/receita/entities/receita_entity.dart';
import 'package:caidy_api/src/modules/receita/services/i_receita_service.dart';
import 'package:caidy_api/src/shared/controllers/base_controller.dart';
import 'package:vaden/vaden.dart';

@Api(tag: 'Receita', description: 'Controller para salvar e buscar receitas.')
@Controller('/receita')
class ReceitaController extends BaseController<ReceitaDto, ReceitaEntity, IReceitaService> {
  ReceitaController(super.service);
}
