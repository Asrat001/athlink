import 'package:athlink/core/models/paginated_response.dart';
import 'package:athlink/features/athlete/profile/domain/models/competition_result_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition_results_state.freezed.dart';

@freezed
class CompetitionResultsState with _$CompetitionResultsState {
  const factory CompetitionResultsState.loading() = _Loading;
  const factory CompetitionResultsState.loaded({
    required PaginatedResponse<CompetitionResultModel> data,
  }) = _Loaded;
  const factory CompetitionResultsState.error({required String message}) =
      _Error;
}
