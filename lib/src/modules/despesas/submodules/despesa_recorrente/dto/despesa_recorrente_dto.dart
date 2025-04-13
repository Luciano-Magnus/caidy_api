import 'package:auto_mapper/auto_mapper_annotation.dart';
import 'package:caidy_api/src/modules/despesas/dto/despesa_dto.dart';
import 'package:caidy_api/src/modules/despesas/submodules/despesa_recorrente/entities/despesa_recorrente_entity.dart';
import 'package:vaden/vaden.dart';

@AutoMap(target: DespesaRecorrenteEntity)
@DTO()
class DespesaRecorrenteDto {
  final DespesaDto despesa;
  final String idDespesaPrincipal;

  DespesaRecorrenteDto({
    required this.despesa,
    required this.idDespesaPrincipal,
  });
}
