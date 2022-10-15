import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_failure.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure {
  const ApiFailure._();
  const factory ApiFailure.server([String? message]) = _Server;
}
