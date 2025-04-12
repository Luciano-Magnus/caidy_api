import 'package:caidy_api/src/modules/categoria/repositories/categoria_repository.dart';
import 'package:caidy_api/src/modules/despesas/repositories/despesa_repository.dart';
import 'package:caidy_api/src/modules/fator_conversao_banco/repositories/fator_conversao_repository.dart';
import 'package:caidy_api/src/modules/receita/repositories/receita_repository.dart';
import 'package:caidy_api/src/modules/usuario/repositories/usuario_repository.dart';
import 'package:caidy_api/src/shared/extensions/nullable_string_extensions.dart';
import 'package:postgres/postgres.dart';

class Database {
  final Connection _connection;

  Database(this._connection);

  ///region create database

  Future<void> createDatabase() async {
    await _connection.runTx((session) async {
      await _executeQuery(
        query: '''
                    CREATE TABLE IF NOT EXISTS migration (
                      id_migration SERIAL PRIMARY KEY,
                      data_hora TIMESTAMP NOT NULL DEFAULT NOW(),
                      nome VARCHAR(100) NOT NULL,
                      versao VARCHAR(20) NOT NULL
                    );
                  ''',
        txn: session,
      );

      //Verifica se já tem a migration inicial
      final result = await _executeQuery(query: "SELECT COUNT(*) AS total FROM migration;", txn: session);

      if (result.firstOrNull?.toColumnMap()['total'] > 0) {
        return;
      }

      final usuarioRepository = UsuarioRepository(this);
      final categoriaRepository = CategoriaRepository(this);
      final fatorConversaoRepository = FatorConversaoRepository(this);
      final despesaRepository = DespesaRepository(this);
      final receitaRepository = ReceitaRepository(this);

      //region create tables
      await _executeQuery(query: usuarioRepository.createTable(), txn: session);
      await _executeQuery(query: categoriaRepository.createTable(), txn: session);
      await _executeQuery(query: fatorConversaoRepository.createTable(), txn: session);
      await _executeQuery(query: despesaRepository.createTable(), txn: session);
      await _executeQuery(query: receitaRepository.createTable(), txn: session);
      //endregion

      //region create indexes
      for (final index in usuarioRepository.indexs) {
        await _executeQuery(query: index, txn: session);
      }

      for (final index in categoriaRepository.indexs) {
        await _executeQuery(query: index, txn: session);
      }

      for (final index in fatorConversaoRepository.indexs) {
        await _executeQuery(query: index, txn: session);
      }

      for (final index in despesaRepository.indexs) {
        await _executeQuery(query: index, txn: session);
      }

      for (final index in receitaRepository.indexs) {
        await _executeQuery(query: index, txn: session);
      }

      //endregion

      await _executeQuery(
        query: '''
                    CREATE TABLE IF NOT EXISTS sincronizacao (
                      id_sincronizacao SERIAL PRIMARY KEY,
                      data_hora TIMESTAMP NOT NULL DEFAULT NOW(),
                      tabela VARCHAR(100) NOT NULL,
                      id_entidade UUID NOT NULL,
                      id_dispositivo UUID NOT NULL,
                      operacao VARCHAR(20) NOT NULL
                    );
                  ''',
        txn: session,
      );

      await _executeQuery(query: "INSERT INTO migration (nome, versao) VALUES ('initial', '1.0');", txn: session);

      return;
    });
  }

  ///endregion

  ///region Save | Update | Delete
  Future<void> save({required String tableName, required Map<String, dynamic> values, TxSession? txn}) async {
    await _executeQuery(query: 'INSERT INTO $tableName (${values.keys.join(', ')}) VALUES (${values.keys.map((e) => '@$e').join(', ')})', parameters: values);
  }

  Future<void> update({required String tableName, required Map<String, dynamic> values, required String where, TxSession? txn}) async {
    await _executeQuery(query: 'UPDATE $tableName SET ${values.keys.map((e) => '$e = @$e').join(', ')} WHERE $where', parameters: values);
  }

  Future<void> upsert({required String tableName, required Map<String, dynamic> values, TxSession? txn}) async {
    await _executeQuery(
      query: '''
      INSERT INTO $tableName (${values.keys.join(', ')}) 
      VALUES (${values.keys.map((e) => '@$e').join(', ')}) 
      ON CONFLICT (id_$tableName) 
      DO UPDATE SET ${values.keys.map((e) => '$e = EXCLUDED.$e').join(', ')}
      ''',
      parameters: values,
    );
  }

  Future<void> delete({required String tableName, required String id, TxSession? txn}) async {
    final values = <String, dynamic>{};

    values['data_hora_deletado'] = DateTime.now();

    await _executeQuery(query: 'UPDATE $tableName SET ${values.keys.map((e) => '$e = @$e').join(', ')} WHERE id_$tableName = @id', parameters: values..addAll({'id': id}), txn: txn);
  }

  ///endregion

  ///region Select
  Future<List<Map<String, dynamic>>> select({required String tableName, String? where, Map<String, dynamic>? parameters, int? limit, int? offset, String? orderBy, TxSession? txn}) async {
    where = where?.replaceAll('WHERE', '').replaceAll('where', '');
    orderBy = orderBy?.replaceAll('ORDER BY', '').replaceAll('order by', '');

    String limitOffset = '';

    if (limit != null) {
      limitOffset += ' LIMIT $limit';
    }

    if (offset != null) {
      limitOffset += ' OFFSET $offset';
    }

    final result = await _executeQuery(
      query: '''
                  SELECT * 
                  FROM $tableName 
                  ${where?.isNullOrWhiteSpace == false ? 'WHERE $where' : ''} 
                  $limitOffset
                  ${orderBy?.isNullOrWhiteSpace == false ? 'ORDER BY $orderBy' : ''}
      ''',
      parameters: parameters,
      txn: txn,
    );

    return result.map((row) => row.toColumnMap()).toList();
  }

  ///endregion

  ///region executeQuery
  Future<Result> _executeQuery({required String query, Map<String, dynamic>? parameters, TxSession? txn}) async {
    final conn = txn ?? _connection;

    try {
      return await conn.execute(Sql.named(query), parameters: parameters);
    } on ServerException catch (e) {
      throw _tratarException(e);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Exception _tratarException(ServerException e) {
    if (e.code == '3D000') {
      return Exception('Banco de dados não encontrado.');
    } else if (e.code == '28P01') {
      return Exception('Usuário ou senha inválidos.');
    } else if (e.code == '08006') {
      return Exception('Conexão recusada.');
    } else {
      return e;
    }
  }

  ///endregion
}
