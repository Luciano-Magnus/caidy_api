import 'package:auto_mapper/auto_mapper_annotation.dart';
import 'package:caidy_api/src/modules/despesas/entities/despesa_entity.dart';
import 'package:caidy_api/src/modules/despesas/submodules/despesa_recorrente/dto/despesa_recorrente_dto.dart';

@AutoMap(target: DespesaRecorrenteDto)
class DespesaRecorrenteEntity {
  final DespesaEntity despesa;
  final String idDespesaPrincipal;

  DespesaRecorrenteEntity({
    required this.despesa,
    required this.idDespesaPrincipal,
  });
}
