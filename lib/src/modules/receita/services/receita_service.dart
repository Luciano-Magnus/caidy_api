import 'package:caidy_api/src/modules/receita/entities/receita_entity.dart';
import 'package:caidy_api/src/modules/receita/repositories/i_receita_repository.dart';
import 'package:caidy_api/src/modules/receita/services/i_receita_service.dart';
import 'package:caidy_api/src/shared/services/base_service.dart';
import 'package:vaden/vaden.dart';

@Service()
class ReceitaService extends BaseService<ReceitaEntity, IReceitaRepository> implements IReceitaService {
  ReceitaService(super.repository);
}
