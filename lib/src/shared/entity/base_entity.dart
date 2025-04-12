import 'package:auto_mapper/auto_mapper.dart';
import 'package:caidy_api/src/shared/dto/base_dto.dart';

@AutoMap(target: BaseDto)
class BaseEntity {
  final String id;
  final DateTime dataHoraCriado;
  final DateTime? dataHoraUltimaAlteracao;
  final DateTime? dataHoraDeletado;
  final String idDispositivo;
  final String idUsuario;

  BaseEntity({
    required this.id,
    required this.dataHoraCriado,
    required this.dataHoraUltimaAlteracao,
    required this.dataHoraDeletado,
    required this.idDispositivo,
    required this.idUsuario,
  });
}