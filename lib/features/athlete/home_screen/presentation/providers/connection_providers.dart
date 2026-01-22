import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/home_screen/domain/models/connection.dart';
import 'package:athlink/features/athlete/home_screen/domain/repository/feed_repository.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/connection_requests_notifier.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/connections_list_notifier.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/state/connection_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for received connection requests
final connectionRequestsProvider =
    StateNotifierProvider<
      ConnectionRequestsNotifier,
      ConnectionListState<FriendRequest>
    >((ref) => ConnectionRequestsNotifier(sl<AthleteFeedRepository>()));

/// Provider for sent connection requests
final sentConnectionRequestsProvider =
    StateNotifierProvider<
      SentConnectionRequestsNotifier,
      ConnectionListState<SendFriendRequest>
    >((ref) => SentConnectionRequestsNotifier(sl<AthleteFeedRepository>()));

/// Provider for connections list (friends)
final connectionsListProvider =
    StateNotifierProvider<
      ConnectionsListNotifier,
      ConnectionListState<ConnectedUser>
    >((ref) => ConnectionsListNotifier(sl<AthleteFeedRepository>()));

/// Family provider for checking connection status with specific athletes
final connectionStatusProvider =
    FutureProvider.family<ConnectionStatus?, String>((ref, athleteId) async {
      final repository = sl<AthleteFeedRepository>();
      final response = await repository.getConnectionStatus(athleteId);

      return response.when(success: (status) => status, failure: (_) => null);
    });

/// Search query state provider for connections
final connectionSearchQueryProvider = StateProvider<String>((ref) => '');

/// Provider for filtered connections with search support
final filteredConnectionsProvider = Provider.family<
    List<ConnectedUser>,
    String>((ref, searchQuery) {
  final state = ref.watch(connectionsListProvider);
  final query = searchQuery.toLowerCase().trim();

  return state.maybeWhen(
    loaded: (connections) {
      // If no search query, return all connections
      if (query.isEmpty) {
        return connections;
      }

      // Filter by athlete name
      return connections.where((connection) {
        final nameMatch = connection.user.athleteProfile.name
            ?.toLowerCase()
            .contains(query) ?? false;
        return nameMatch;
      }).toList();
    },
    orElse: () => [],
  );
});
