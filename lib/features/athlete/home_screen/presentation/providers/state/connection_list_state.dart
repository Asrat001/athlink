import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_list_state.freezed.dart';

/// State for connection lists (requests, connections)
@freezed
class ConnectionListState<T> with _$ConnectionListState<T> {
  const factory ConnectionListState.loading() = _Loading<T>;
  const factory ConnectionListState.loaded(List<T> items) = _Loaded<T>;
  const factory ConnectionListState.error(String message) = _Error<T>;
  const factory ConnectionListState.empty() = _Empty<T>;
}
