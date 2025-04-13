import 'package:auto_mapper/auto_mapper.dart';
import 'package:caidy_api/src/shared/controllers/i_base_controller.dart';
import 'package:caidy_api/src/shared/controllers/main_controller.dart';
import 'package:caidy_api/src/shared/dto/i_base_dto.dart';
import 'package:caidy_api/src/shared/entity/i_base_entity.dart';
import 'package:caidy_api/src/shared/services/i_base_service.dart';
import 'package:vaden/vaden.dart';

import '../middlewares/api_key_middleware.dart';


abstract class BaseController<D extends IBaseDto, E extends IBaseEntity, S extends IBaseService<E>> extends MainController<D, E> implements IBaseController<D> {
  final S service;

  BaseController(this.service);

  @ApiOperation(summary: 'Salva o objeto no banco de dados', description: 'Salva o objeto no banco de dados')
  @ApiResponse(200, description: 'Success', content: ApiContent(type: 'application/json'))
  @ApiResponse(500, description: 'Internal Server Error', content: ApiContent(type: 'application/json'))
  @ApiResponse(400, description: 'Bad Request', content: ApiContent(type: 'application/json'))
  @ApiResponse(401, description: 'Unauthorized', content: ApiContent(type: 'application/json'))
  @ApiResponse(403, description: 'Forbidden', content: ApiContent(type: 'application/json'))
  @ApiResponse(404, description: 'Not Found', content: ApiContent(type: 'application/json'))
  @ApiResponse(405, description: 'Method Not Allowed', content: ApiContent(type: 'application/json'))
  @ApiSecurity(['bearerAuth', 'apiKey'])
  @UseMiddleware([ApiKeyMiddleware])
  @Post('/')
  @override
  Future<D> save(@Body() D dto) async {
    final response = await service.saveOrUpdate(entityFromDto(dto));

    return dtoFromEntity(response);
  }

  @ApiOperation(summary: 'Atualiza o objeto no banco de dados', description: 'Atualiza o objeto no banco de dados')
  @ApiResponse(200, description: 'Success', content: ApiContent(type: 'application/json'))
  @ApiResponse(500, description: 'Internal Server Error', content: ApiContent(type: 'application/json'))
  @ApiResponse(400, description: 'Bad Request', content: ApiContent(type: 'application/json'))
  @ApiResponse(401, description: 'Unauthorized', content: ApiContent(type: 'application/json'))
  @ApiResponse(403, description: 'Forbidden', content: ApiContent(type: 'application/json'))
  @ApiResponse(404, description: 'Not Found', content: ApiContent(type: 'application/json'))
  @ApiResponse(405, description: 'Method Not Allowed', content: ApiContent(type: 'application/json'))
  @Put('/')
  @override
  Future<D> update(@Body() D dto) async {
    final response = await service.saveOrUpdate(entityFromDto(dto));

    return dtoFromEntity(response);
  }

  @ApiOperation(summary: 'Busca todos os objetos no banco de dados', description: 'Busca todos os objetos no banco de dados')
  @ApiResponse(200, description: 'Success', content: ApiContent(type: 'application/json'))
  @ApiResponse(500, description: 'Internal Server Error', content: ApiContent(type: 'application/json'))
  @ApiResponse(400, description: 'Bad Request', content: ApiContent(type: 'application/json'))
  @ApiResponse(401, description: 'Unauthorized', content: ApiContent(type: 'application/json'))
  @ApiResponse(403, description: 'Forbidden', content: ApiContent(type: 'application/json'))
  @ApiResponse(404, description: 'Not Found', content: ApiContent(type: 'application/json'))
  @ApiResponse(405, description: 'Method Not Allowed', content: ApiContent(type: 'application/json'))
  @Get('/')
  @override
  Future<List<D>> getAll(@Query() @ApiQuery(description: 'Filter by limit', required: false) int? limit, @Query() @ApiQuery(description: 'Filter by offset', required: false) int? offset) async {
    final response = await service.getAll();

    return dtoListFromEntityList(response);
  }

  @ApiOperation(summary: 'Busca um objeto no banco de dados pelo id', description: 'Busca um objeto no banco de dados pelo id')
  @ApiResponse(200, description: 'Success', content: ApiContent(type: 'application/json'))
  @ApiResponse(500, description: 'Internal Server Error', content: ApiContent(type: 'application/json'))
  @ApiResponse(400, description: 'Bad Request', content: ApiContent(type: 'application/json'))
  @ApiResponse(401, description: 'Unauthorized', content: ApiContent(type: 'application/json'))
  @ApiResponse(403, description: 'Forbidden', content: ApiContent(type: 'application/json'))
  @ApiResponse(404, description: 'Not Found', content: ApiContent(type: 'application/json'))
  @ApiResponse(405, description: 'Method Not Allowed', content: ApiContent(type: 'application/json'))
  @Get('/<id>')
  @override
  Future<D> getById(@Param() String id) async {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @ApiOperation(summary: 'Busca o primeiro objeto no banco de dados', description: 'Busca o primeiro objeto no banco de dados')
  @ApiResponse(200, description: 'Success', content: ApiContent(type: 'application/json'))
  @ApiResponse(500, description: 'Internal Server Error', content: ApiContent(type: 'application/json'))
  @ApiResponse(400, description: 'Bad Request', content: ApiContent(type: 'application/json'))
  @ApiResponse(401, description: 'Unauthorized', content: ApiContent(type: 'application/json'))
  @ApiResponse(403, description: 'Forbidden', content: ApiContent(type: 'application/json'))
  @ApiResponse(404, description: 'Not Found', content: ApiContent(type: 'application/json'))
  @ApiResponse(405, description: 'Method Not Allowed', content: ApiContent(type: 'application/json'))
  @Get('/first')
  @override
  Future<D> getFirst() {
    // TODO: implement getFirst
    throw UnimplementedError();
  }

  @ApiOperation(summary: 'Deleta o objeto no banco de dados', description: 'Deleta o objeto no banco de dados')
  @ApiResponse(200, description: 'Success', content: ApiContent(type: 'application/json'))
  @ApiResponse(500, description: 'Internal Server Error', content: ApiContent(type: 'application/json'))
  @ApiResponse(400, description: 'Bad Request', content: ApiContent(type: 'application/json'))
  @ApiResponse(401, description: 'Unauthorized', content: ApiContent(type: 'application/json'))
  @ApiResponse(403, description: 'Forbidden', content: ApiContent(type: 'application/json'))
  @ApiResponse(404, description: 'Not Found', content: ApiContent(type: 'application/json'))
  @ApiResponse(405, description: 'Method Not Allowed', content: ApiContent(type: 'application/json'))
  @Delete('/')
  @override
  Future<void> delete(@Body()D dto) {
    // TODO: implement delete
    throw UnimplementedError();
  }

}