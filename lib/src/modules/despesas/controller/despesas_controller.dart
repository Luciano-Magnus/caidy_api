import 'package:caidy_api/src/modules/despesas/dto/despesa_dto.dart';
import 'package:caidy_api/src/modules/despesas/entities/despesa_entity.dart';
import 'package:caidy_api/src/modules/despesas/services/i_despesa_service.dart';
import 'package:caidy_api/src/shared/controllers/base_controller.dart';
import 'package:vaden/vaden.dart';

@Api(tag: 'Despesa', description: 'Controller para salvar e buscar despesas.')
@Controller('/despesa')
class DespesasController extends BaseController<DespesaDto, DespesaEntity, IDespesaService> {
  DespesasController(super.service);
}