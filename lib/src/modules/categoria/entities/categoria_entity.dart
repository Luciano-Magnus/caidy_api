import 'package:auto_mapper/auto_mapper.dart';
import 'package:caidy_api/src/modules/categoria/dto/categoria_dto.dart';
import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/entity/i_base_entity.dart';

@AutoMap(target: CategoriaDto)
class CategoriaEntity implements IBaseEntity{
  @override
  BaseEntity base;
  final String descricao;
  final int icon;
  final int tipo;

  CategoriaEntity({
    required this.base,
    required this.descricao,
    required this.icon,
    required this.tipo,
  });
}