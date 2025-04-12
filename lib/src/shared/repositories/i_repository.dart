import 'package:caidy_api/src/shared/entity/i_base_entity.dart';

abstract class IRepository<E extends IBaseEntity> {
  Future<E> saveOrUpdate(E entity);

  Future<List<E>> getAll({bool deleted = false, String? where, Map<String, dynamic>? parameters, int? limit, int? offset, String? orderBy});

  Future<E?> getById(String id, {bool deleted = false});

  Future<E?> getFirst();

  Future<void> delete(E entity);
}