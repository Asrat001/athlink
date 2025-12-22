import 'package:athlink/features/message/domain/models/chat_attachment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simple state provider to track upload status
// Returns AsyncValue<String?> where String is the file URL
final uploadStateProvider = StateProvider<AsyncValue<List<ChatAttachment>?>>((ref) {
  return const AsyncValue.data(null);
});
