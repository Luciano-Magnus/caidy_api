import 'package:auto_mapper/auto_mapper_annotation.dart';
import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/shared/dto/base_dto.dart';
import 'package:caidy_api/src/shared/dto/i_base_dto.dart';
import 'package:vaden/vaden.dart';

@AutoMap(target: CategoriaEntity)
@DTO()
class CategoriaDto implements IBaseDto{
  @override
  BaseDto base;
  final String descricao;
  final int icon;
  final int tipo;

  CategoriaDto({
    required this.base,
    required this.descricao,
    required this.icon,
    required this.tipo,
  });

}