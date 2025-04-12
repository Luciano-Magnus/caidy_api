import 'package:caidy_api/src/shared/entity/i_base_entity.dart';
import 'package:caidy_api/src/shared/repositories/i_repository.dart';
import 'package:caidy_api/src/shared/services/i_base_service.dart';

abstract class BaseService<E extends IBaseEntity, Y extends IRepository<E>> implements IBaseService<E> {
  final Y repository;

  BaseService(this.repository);

  @override
  Future<E> saveOrUpdate(E entity) async {
    return await repository.saveOrUpdate(entity);
  }

  @override
  Future<List<E>> getAll() async {
    return await repository.getAll();
  }

  @override
  Future<E?> getById(String id, {bool deleted = false}) async {
    return await repository.getById(id, deleted: deleted);
  }

  @override
  Future<E?> getFirst() async {
    return await repository.getFirst();
  }

  @override
  Future<void> updatePatch(List<E> operations) {
    // TODO: implement updatePatch
    throw UnimplementedError();
  }

  @override
  Future<void> delete(E entity) async {
    await repository.delete(entity);
  }
}