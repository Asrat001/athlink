import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_state.freezed.dart';

@freezed
abstract class ConnectionState with _$ConnectionState {
  const factory ConnectionState.initial() = _Initial;
  const factory ConnectionState.loading() = _Loading;
  const factory ConnectionState.success({required String message}) = _Success;
  const factory ConnectionState.error({required String errorMessage}) = _Error;
}
