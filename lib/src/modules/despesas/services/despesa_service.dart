import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/modules/despesas/entities/despesa_entity.dart';
import 'package:caidy_api/src/modules/despesas/repositories/i_despesa_repository.dart';
import 'package:caidy_api/src/modules/despesas/services/i_despesa_service.dart';
import 'package:caidy_api/src/modules/despesas/submodules/despesa_recorrente/entities/despesa_recorrente_entity.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/entities/fator_conversao_banco_entity.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/enums/bank_enum.dart';
import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/services/base_service.dart';
import 'package:vaden/vaden.dart';

@Service()
class DespesaService extends BaseService<DespesaEntity, IDespesaRepository> implements IDespesaService {
  DespesaService(super.repository);
}
