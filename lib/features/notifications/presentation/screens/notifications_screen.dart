import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_app_bar.dart'; // From custom_widgets.dart
import 'package:athlink/shared/widgets/custom_text.dart'; // From custom_widgets.dart
import 'package:flutter/material.dart';
// IMPORTANT: Add the Slidable package import here.
import 'package:flutter_slidable/flutter_slidable.dart';

// Dummy data structure for notifications
class NotificationItem {
  final String id;
  final String name;
  final String message;
  final String timeAgo;
  final String imageUrl;
  final bool isRead;

  NotificationItem({
    required this.id,
    required this.name,
    required this.message,
    required this.timeAgo,
    required this.imageUrl,
    this.isRead = false,
  });
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Dummy Notification Data
  final List<NotificationItem> _notifications = [
    NotificationItem(
      id: 'n1',
      name: 'Shreen Sali',
      message: 'Just completed their training!',
      timeAgo: '2h',
      imageUrl:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=800&q=80',
      isRead: false,
    ),
    NotificationItem(
      id: 'n2',
      name: 'Maria Darwin',
      message: 'Won Best Athlete 2025',
      timeAgo: '4h',
      imageUrl:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=800&q=80',
      isRead: false,
    ),
    NotificationItem(
      id: 'n3',
      name: 'Farnand John',
      message: 'Achieved a new personal best!',
      timeAgo: '12h',
      imageUrl:
          'https://images.unsplash.com/photo-1545996124-1a7f9b545f7d?w=800&q=80',
      isRead: true,
    ),
    NotificationItem(
      id: 'n4',
      name: 'Athlete Name 1',
      message: 'Just completed their training!',
      timeAgo: '1d',
      imageUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=800&q=80',
      isRead: true,
    ),
    NotificationItem(
      id: 'n5',
      name: 'Athlete Name 1',
      message: 'Just completed their training!',
      timeAgo: '1d',
      imageUrl:
          'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?w=800&q=80',
      isRead: true,
    ),
  ];

  void _deleteNotification(String id) {
    setState(() {
      _notifications.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "Notifications", showBackButton: true),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final item = _notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Slidable(
                  key: ValueKey(item.id),

                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    extentRatio: 0.25,
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          _deleteNotification(item.id);
                        },
                        backgroundColor: AppColors.red,
                        foregroundColor: AppColors.white,
                        icon: Icons.delete_outline,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: _NotificationCard(item: item),
                  ),
                ),

                Divider(color: AppColors.extraLightGrey),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const _NotificationCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = item.isRead
        ? AppColors.white
        : AppColors.white.withValues(alpha: 0.95);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: backgroundColor),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAvatar(item.imageUrl, item.isRead),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: item.name,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.black,
                    ),
                    const SizedBox(height: 2),
                    CustomClippedText(
                      title: item.message,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.grey,
                      maxLines: 1, // Ensure single line for clipped text
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              CustomText(
                title: item.timeAgo,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                textColor: AppColors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String imageUrl, bool isRead) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isRead
            ? null
            : Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
                width: 2,
              ),
      ),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.lightGrey,
        backgroundImage: NetworkImage(imageUrl),
        onBackgroundImageError: (exception, stackTrace) {
          debugPrint('Image loading failed: $exception');
        },
        child: item.imageUrl.isEmpty
            ? const Icon(Icons.person, color: AppColors.grey)
            : null,
      ),
    );
  }
}
