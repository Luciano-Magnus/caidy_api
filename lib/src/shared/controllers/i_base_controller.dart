import 'package:caidy_api/src/shared/dto/i_base_dto.dart';
import 'package:vaden/vaden.dart';

abstract class IBaseController<D extends IBaseDto> {
  Future<List<D>> getAll(int limit, int offset);

  Future<D?> getFirst();

  Future<D?> save(D dto);

  Future<D> update(D dto);

  Future<void> delete(D dto);

  Future<D?> getById(String id);
}
