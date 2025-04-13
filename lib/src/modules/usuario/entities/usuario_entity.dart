import 'package:auto_mapper/auto_mapper_annotation.dart';
import 'package:caidy_api/src/modules/usuario/dto/usuario_dto.dart';
import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/entity/i_base_entity.dart';

@AutoMap(target: UsuarioDto)
class UsuarioEntity implements IBaseEntity {
  @override
  BaseEntity base;

  final String nome;

  final String cpfCnpj;

  UsuarioEntity({
    required this.base,
    required this.nome,
    required this.cpfCnpj,
  });

}