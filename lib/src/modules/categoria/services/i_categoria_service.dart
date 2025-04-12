import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/shared/services/i_base_service.dart';

abstract class ICategoriaService implements IBaseService<CategoriaEntity> {
  Future<List<CategoriaEntity>> getAll();
}