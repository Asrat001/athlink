import 'package:athlink/features/sports/domain/models/sport_model.dart';
import 'package:athlink/features/sports/domain/models/sport_selection_model.dart';
import 'package:athlink/shared/handlers/api_response.dart';

abstract class ISportsRepository {
  Future<ApiResponse<List<Sport>>> getSports();
  Future<ApiResponse<SportSelectionResponse>> selectSports({
    required List<String> sportIds,
  });
}
