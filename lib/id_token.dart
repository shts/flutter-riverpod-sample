import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'id_token.freezed.dart';
part 'id_token.g.dart';

@freezed
class IdToken with _$IdToken {
  const factory IdToken(
    String idToken,
  ) = _IdToken;

  factory IdToken.fromJson(Map<String, dynamic> json) =>
      _$IdTokenFromJson(json);
}
