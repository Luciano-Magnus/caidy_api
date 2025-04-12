import 'dart:async';
import 'dart:convert';

import 'package:vaden/vaden.dart';

@Component()
class ApiKeyMiddleware extends VadenMiddleware {
  final ApplicationSettings _settings;

  ApiKeyMiddleware(this._settings);

  @override
  FutureOr<Response> handler(Request request, Handler handler) async {
    if (request.headers['X-API-Key'] != _settings['security']['apiKey']) {
      return Response.forbidden(jsonEncode({'message': 'Forbidden'}), headers: {'Content-Type': 'application/json'});
    }

    final response = await handler(request);

    return response;
  }
}
