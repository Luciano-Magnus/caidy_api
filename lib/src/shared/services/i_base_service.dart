import 'package:caidy_api/src/shared/entity/i_base_entity.dart';

abstract class IBaseService<E extends IBaseEntity> {
  Future<List<E>> getAll();

  Future<E?> getFirst();

  Future<E> saveOrUpdate(E entity);

  Future<void> delete(E entity);

  Future<E?> getById(String id);

  Future<void> updatePatch(List<E> operations);
}
