import 'package:athlink/features/athlete/home_screen/domain/models/connection.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/connection_provider.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/connection_providers.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/state/connection_list_state.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConnectionRequestsScreen extends ConsumerStatefulWidget {
  const ConnectionRequestsScreen({super.key});

  @override
  ConsumerState<ConnectionRequestsScreen> createState() =>
      _ConnectionRequestsScreenState();
}

class _ConnectionRequestsScreenState
    extends ConsumerState<ConnectionRequestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Load requests on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(connectionRequestsProvider.notifier).getReceivedRequests();
      ref.read(sentConnectionRequestsProvider.notifier).getSentRequests();
    });
    
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const CustomText(
          title: 'Connection Requests',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          textColor: Colors.white,
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(text: 'Received'),
            Tab(text: 'Sent'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildReceivedTab(), _buildSentTab()],
      ),
    );
  }

  Widget _buildReceivedTab() {
    final state = ref.watch(connectionRequestsProvider);

    return state.when(
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      loaded: (requests) => RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.darkGreyCard,
        onRefresh: () async {
          ref.read(connectionRequestsProvider.notifier).getReceivedRequests();
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: requests.length,
          itemBuilder: (context, index) {
            return _buildReceivedRequestCard(requests[index]);
          },
        ),
      ),
      empty: () => _buildEmptyState('No connection requests'),
      error: (message) => _buildErrorState(message),
    );
  }

  Widget _buildSentTab() {
    final state = ref.watch(sentConnectionRequestsProvider);

    return state.when(
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      loaded: (requests) => RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.darkGreyCard,
        onRefresh: () async {
          ref.read(sentConnectionRequestsProvider.notifier).getSentRequests();
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: requests.length,
          itemBuilder: (context, index) {
            return _buildSentRequestCard(requests[index]);
          },
        ),
      ),
      empty: () => _buildEmptyState('No pending requests'),
      error: (message) => _buildErrorState(message),
    );
  }

  Widget _buildReceivedRequestCard(FriendRequest request) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkGreyCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.primary,
            backgroundImage: NetworkImage(fileBaseUrl+request.requester.athleteProfile.profileImageUrl),
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: request.requester.athleteProfile.name,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.white,
                ),
                CustomText(
                  title: _formatTime(request.requestedAt),
                  fontSize: 12,
                  textColor: Colors.white60,
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  ref
                      .read(connectionProvider.notifier)
                      .acceptRequest(request.id);
                  // Refresh list after action
                  Future.delayed(const Duration(milliseconds: 500), () {
                    ref
                        .read(connectionRequestsProvider.notifier)
                        .getReceivedRequests();
                  });
                },
                icon: const Icon(Icons.check_circle, color: Colors.green),
              ),
              IconButton(
                onPressed: () {
                  ref
                      .read(connectionProvider.notifier)
                      .rejectRequest(request.id);
                  // Refresh list after action
                  Future.delayed(const Duration(milliseconds: 500), () {
                    ref
                        .read(connectionRequestsProvider.notifier)
                        .getReceivedRequests();
                  });
                },
                icon: const Icon(Icons.cancel, color: AppColors.error),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSentRequestCard(SendFriendRequest request) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkGreyCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.primary,
            child: Text(
              "A",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: request.requester,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.white,
                ),
                CustomText(
                  title: _formatTime(request.requestedAt),
                  fontSize: 12,
                  textColor: Colors.white60,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(connectionProvider.notifier).cancelRequest(request.id);
              // Refresh list after action
              Future.delayed(const Duration(milliseconds: 500), () {
                ref
                    .read(sentConnectionRequestsProvider.notifier)
                    .getSentRequests();
              });
            },
            child: const CustomText(
              title: 'Cancel',
              fontSize: 14,
              textColor: AppColors.error,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 64, color: Colors.white24),
          const SizedBox(height: 16),
          CustomText(title: message, fontSize: 16, textColor: Colors.white60),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: AppColors.error),
          const SizedBox(height: 16),
          CustomText(title: message, fontSize: 16, textColor: Colors.white60),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
