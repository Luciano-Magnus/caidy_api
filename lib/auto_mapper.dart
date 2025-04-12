// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:auto_mapper/auto_mapper.dart';

import 'package:caidy_api/src/modules/categoria/entities/categoria_entity.dart';
import 'package:caidy_api/src/modules/categoria/dto/categoria_dto.dart';
import 'package:caidy_api/src/modules/despesas/entities/despesa_entity.dart';
import 'package:caidy_api/src/modules/despesas/dto/despesa_dto.dart';
import 'package:caidy_api/src/modules/despesas/submodules/despesa_recorrente/entities/despesa_recorrente_entity.dart';
import 'package:caidy_api/src/modules/despesas/submodules/despesa_recorrente/dto/despesa_recorrente_dto.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/entities/fator_conversao_banco_entity.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/dto/fator_conversao_banco_dto.dart';
import 'package:caidy_api/src/modules/receita/entities/receita_entity.dart';
import 'package:caidy_api/src/modules/receita/dto/receita_dto.dart';
import 'package:caidy_api/src/modules/usuario/entities/usuario_entity.dart';
import 'package:caidy_api/src/modules/usuario/dto/usuario_dto.dart';
import 'package:caidy_api/src/shared/entity/base_entity.dart';
import 'package:caidy_api/src/shared/dto/base_dto.dart';

class GeneratedMappings {
  static void register() {
    AutoMapper.add<CategoriaDto, CategoriaEntity>(
      (CategoriaDto source) => CategoriaEntity(
        base: AutoMapper.convert<BaseDto, BaseEntity>(source.base),
        descricao: source.descricao,
        icon: source.icon,
        tipo: source.tipo,
      ),
    );

    AutoMapper.add<CategoriaEntity, CategoriaDto>(
      (CategoriaEntity source) => CategoriaDto(
        base: AutoMapper.convert<BaseEntity, BaseDto>(source.base),
        descricao: source.descricao,
        icon: source.icon,
        tipo: source.tipo,
      ),
    );

    AutoMapper.add<DespesaDto, DespesaEntity>(
      (DespesaDto source) => DespesaEntity(
        base: AutoMapper.convert<BaseDto, BaseEntity>(source.base),
        descricao: source.descricao,
        valor: source.valor,
        detalhes: source.detalhes,
        categoria: AutoMapper.convert<CategoriaDto, CategoriaEntity>(
          source.categoria,
        ),
        dataPagamento: source.dataPagamento,
        pagamentoRecorrente: source.pagamentoRecorrente,
        despesasRecorrentes:
            source.despesasRecorrentes
                .map(
                  (item) => AutoMapper.convert<
                    DespesaRecorrenteDto,
                    DespesaRecorrenteEntity
                  >(item),
                )
                .toList(),
        fatorConversaoBanco: AutoMapper.convert<
          FatorConversaoBancoDto,
          FatorConversaoBancoEntity
        >(source.fatorConversaoBanco),
      ),
    );

    AutoMapper.add<DespesaEntity, DespesaDto>(
      (DespesaEntity source) => DespesaDto(
        base: AutoMapper.convert<BaseEntity, BaseDto>(source.base),
        descricao: source.descricao,
        valor: source.valor,
        detalhes: source.detalhes,
        categoria: AutoMapper.convert<CategoriaEntity, CategoriaDto>(
          source.categoria,
        ),
        dataPagamento: source.dataPagamento,
        pagamentoRecorrente: source.pagamentoRecorrente,
        despesasRecorrentes:
            source.despesasRecorrentes
                .map(
                  (item) => AutoMapper.convert<
                    DespesaRecorrenteEntity,
                    DespesaRecorrenteDto
                  >(item),
                )
                .toList(),
        fatorConversaoBanco: AutoMapper.convert<
          FatorConversaoBancoEntity,
          FatorConversaoBancoDto
        >(source.fatorConversaoBanco),
      ),
    );

    AutoMapper.add<DespesaRecorrenteDto, DespesaRecorrenteEntity>(
      (DespesaRecorrenteDto source) => DespesaRecorrenteEntity(
        despesa: AutoMapper.convert<DespesaDto, DespesaEntity>(source.despesa),
        idDespesaPrincipal: source.idDespesaPrincipal,
      ),
    );

    AutoMapper.add<DespesaRecorrenteEntity, DespesaRecorrenteDto>(
      (DespesaRecorrenteEntity source) => DespesaRecorrenteDto(
        despesa: AutoMapper.convert<DespesaEntity, DespesaDto>(source.despesa),
        idDespesaPrincipal: source.idDespesaPrincipal,
      ),
    );

    AutoMapper.add<FatorConversaoBancoDto, FatorConversaoBancoEntity>(
      (FatorConversaoBancoDto source) => FatorConversaoBancoEntity(
        base: AutoMapper.convert<BaseDto, BaseEntity>(source.base),
        banco: source.banco,
        descricaoDespesaNova: source.descricaoDespesaNova,
        descricaoDespesaAntiga: source.descricaoDespesaAntiga,
        descricaoCategoriaNova: source.descricaoCategoriaNova,
        descricaoCategoriaAntiga: source.descricaoCategoriaAntiga,
      ),
    );

    AutoMapper.add<FatorConversaoBancoEntity, FatorConversaoBancoDto>(
      (FatorConversaoBancoEntity source) => FatorConversaoBancoDto(
        base: AutoMapper.convert<BaseEntity, BaseDto>(source.base),
        banco: source.banco,
        descricaoDespesaNova: source.descricaoDespesaNova,
        descricaoDespesaAntiga: source.descricaoDespesaAntiga,
        descricaoCategoriaNova: source.descricaoCategoriaNova,
        descricaoCategoriaAntiga: source.descricaoCategoriaAntiga,
      ),
    );

    AutoMapper.add<ReceitaDto, ReceitaEntity>(
      (ReceitaDto source) => ReceitaEntity(
        base: AutoMapper.convert<BaseDto, BaseEntity>(source.base),
        descricao: source.descricao,
        valor: source.valor,
        detalhes: source.detalhes,
        categoria: AutoMapper.convert<CategoriaDto, CategoriaEntity>(
          source.categoria,
        ),
        dataPagamento: source.dataPagamento,
        metodoPagamento: source.metodoPagamento,
      ),
    );

    AutoMapper.add<ReceitaEntity, ReceitaDto>(
      (ReceitaEntity source) => ReceitaDto(
        base: AutoMapper.convert<BaseEntity, BaseDto>(source.base),
        descricao: source.descricao,
        valor: source.valor,
        detalhes: source.detalhes,
        categoria: AutoMapper.convert<CategoriaEntity, CategoriaDto>(
          source.categoria,
        ),
        dataPagamento: source.dataPagamento,
        metodoPagamento: source.metodoPagamento,
      ),
    );

    AutoMapper.add<UsuarioDto, UsuarioEntity>(
      (UsuarioDto source) => UsuarioEntity(
        base: AutoMapper.convert<BaseDto, BaseEntity>(source.base),
        nome: source.nome,
        cpfCnpj: source.cpfCnpj,
      ),
    );

    AutoMapper.add<UsuarioEntity, UsuarioDto>(
      (UsuarioEntity source) => UsuarioDto(
        base: AutoMapper.convert<BaseEntity, BaseDto>(source.base),
        nome: source.nome,
        cpfCnpj: source.cpfCnpj,
      ),
    );

    AutoMapper.add<BaseDto, BaseEntity>(
      (BaseDto source) => BaseEntity(
        id: source.id,
        dataHoraCriado: source.dataHoraCriado,
        dataHoraUltimaAlteracao: source.dataHoraUltimaAlteracao,
        dataHoraDeletado: source.dataHoraDeletado,
        idDispositivo: source.idDispositivo,
        idUsuario: source.idUsuario,
      ),
    );

    AutoMapper.add<BaseEntity, BaseDto>(
      (BaseEntity source) => BaseDto(
        id: source.id,
        dataHoraCriado: source.dataHoraCriado,
        dataHoraUltimaAlteracao: source.dataHoraUltimaAlteracao,
        dataHoraDeletado: source.dataHoraDeletado,
        idDispositivo: source.idDispositivo,
        idUsuario: source.idUsuario,
      ),
    );
  }
}
