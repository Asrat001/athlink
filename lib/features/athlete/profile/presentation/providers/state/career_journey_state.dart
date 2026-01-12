import 'package:athlink/core/models/paginated_response.dart';
import 'package:athlink/features/athlete/profile/domain/models/career_record.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'career_journey_state.freezed.dart';

@freezed
class CareerJourneyState with _$CareerJourneyState {
  const factory CareerJourneyState.loading() = _Loading;
  const factory CareerJourneyState.loaded({
    required PaginatedResponse<CareerJourneyModel> data,
  }) = _Loaded;
  const factory CareerJourneyState.error({required String message}) = _Error;
}
