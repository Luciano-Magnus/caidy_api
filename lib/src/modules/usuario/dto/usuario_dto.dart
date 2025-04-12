import 'package:auto_mapper/auto_mapper.dart';
import 'package:caidy_api/src/modules/usuario/entities/usuario_entity.dart';
import 'package:caidy_api/src/shared/dto/base_dto.dart';
import 'package:caidy_api/src/shared/dto/i_base_dto.dart';
import 'package:vaden/vaden.dart';

@AutoMap(target: UsuarioEntity)
@DTO()
class UsuarioDto implements IBaseDto {
  @override
  BaseDto base;

  final String nome;

  final String cpfCnpj;

  UsuarioDto({
    required this.base,
    required this.nome,
    required this.cpfCnpj,
  });

}