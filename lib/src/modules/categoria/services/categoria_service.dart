import 'package:caidy_api/src/modules/categoria/dto/categoria_dto.dart';
import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/modules/categoria/repositories/i_categoria_repository.dart';
import 'package:caidy_api/src/modules/categoria/services/i_categoria_service.dart';
import 'package:caidy_api/src/shared/services/base_service.dart';
import 'package:vaden/vaden.dart';

@Service()
class CategoriaService extends BaseService<CategoriaEntity, ICategoriaRepository> implements ICategoriaService {
  CategoriaService(super.repository);

}