import 'package:vaden/vaden.dart';

@DTO()
class TokenUsuarioDto {
  final String token;
  final String refreshToken;

  TokenUsuarioDto({
    required this.token,
    required this.refreshToken,
  });
}