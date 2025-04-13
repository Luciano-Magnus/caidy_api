import 'package:auto_mapper/auto_mapper_annotation.dart';
import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/parsers/date_time_parse.dart';
import 'package:vaden/vaden.dart';

@AutoMap(target: BaseEntity)
@DTO()
class BaseDto {
  final String id;

  @UseParse(DateTimeParse)
  final DateTime dataHoraCriado;

  @UseParse(DateTimeParse)
  final DateTime? dataHoraUltimaAlteracao;

  @UseParse(DateTimeParse)
  final DateTime? dataHoraDeletado;

  final String idDispositivo;

  final String idUsuario;

  BaseDto({
    required this.id,
    required this.dataHoraCriado,
    required this.dataHoraUltimaAlteracao,
    required this.dataHoraDeletado,
    required this.idDispositivo,
    required this.idUsuario,
  });
}