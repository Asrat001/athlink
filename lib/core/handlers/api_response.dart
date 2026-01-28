import 'package:freezed_annotation/freezed_annotation.dart';
import 'network_exceptions.dart';
part 'api_response.freezed.dart';

@freezed
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success({required T data}) = Success<T>;
  const factory ApiResponse.failure({required NetworkExceptions error}) =
      Failure<T>;

  const ApiResponse._();

  R when<R>({
    required R Function(T data) success,
    required R Function(NetworkExceptions error) failure,
  }) {
    return map(
      success: (s) => success(s.data),
      failure: (f) => failure(f.error),
    );
  }
}
