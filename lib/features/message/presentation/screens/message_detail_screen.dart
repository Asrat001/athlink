import 'dart:async';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/presentation/providers/providers.dart';
import 'package:athlink/features/message/presentation/providers/states/chat_state.dart';
import 'package:athlink/features/message/presentation/providers/states/uploading_state-provider.dart';
import 'package:athlink/features/message/presentation/widgets/chat_bubble_file.dart';
import 'package:athlink/features/message/presentation/widgets/chat_bubble_image.dart';
import 'package:athlink/features/message/presentation/widgets/chat_bubble_text.dart';
import 'package:athlink/features/message/presentation/widgets/chat_bubble_video.dart';
import 'package:athlink/features/message/presentation/widgets/chat_bubble_voice.dart';
import 'package:athlink/features/message/presentation/widgets/chat_card_google_meet.dart';
import 'package:athlink/features/message/presentation/widgets/chat_card_proposal.dart';
import 'package:athlink/features/message/presentation/widgets/chat_header.dart';
import 'package:athlink/features/message/presentation/widgets/chat_input_bar.dart';
import 'package:athlink/features/message/presentation/widgets/chat_separator.dart';
import 'package:athlink/features/message/presentation/widgets/meet_confirmation_dialog.dart';
import 'package:athlink/features/message/presentation/widgets/proposal_selection_bottom_sheet.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class MessageDetailScreen extends ConsumerStatefulWidget {
  final String conversationId;
  final String name;
  final bool isOnline;
  final String logo;

  const MessageDetailScreen({
    super.key,
    required this.conversationId,
    required this.name,
    this.isOnline = true,
    this.logo =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Quartz_logo.svg/512px-Quartz_logo.svg.png',
  });

  @override
  ConsumerState<MessageDetailScreen> createState() =>
      _MessageDetailScreenState();
}

class _MessageDetailScreenState extends ConsumerState<MessageDetailScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollDebounce;
  int _lastMessageCount = 0;

  late AnimationController _meetAnimationController;
  late Animation<Offset> _meetOffsetAnimation;

  final GlobalKey _meetIconKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  SelectableProposalItem? _draftProposal;

  @override
  void initState() {
    super.initState();

    _meetAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _meetOffsetAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _meetAnimationController,
            curve: Curves.easeOut,
          ),
        );

    _textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (_textController.text.isNotEmpty) {
      ref.read(chatProvider(widget.conversationId).notifier).startTyping();
    }
  }

  @override
  void dispose() {
    _meetAnimationController.dispose();
    _textController.dispose();
    _scrollController.dispose();
    _scrollDebounce?.cancel();
    _overlayEntry?.remove();
    super.dispose();
  }

  void _scrollToBottom() {
    // if (_scrollController.hasClients) {
    //   _scrollController.animateTo(
    //     _scrollController.position.maxScrollExtent,
    //     duration: const Duration(milliseconds: 300),
    //     curve: Curves.easeOut,
    //   );
    // }
  }

  void _sendText(String text) {
    if (text.trim().isEmpty) return;
    ref
        .read(chatProvider(widget.conversationId).notifier)
        .sendMessage(text.trim());

    _textController.clear();
  }

  void _sendVoiceMessage(String path, Duration duration) async {
    final file = (filePath: path, fileName: 'voice_message.m4a');

    final attachments = await ref
        .read(chatProvider(widget.conversationId).notifier)
        .uploadFile([file]);

    if (attachments != null && attachments.isNotEmpty) {
      ref
          .read(chatProvider(widget.conversationId).notifier)
          .sendMessage("", type: 'audio', mediaUrls: attachments);

      // Reset upload state
      ref.read(uploadStateProvider.notifier).state = const AsyncValue.data(
        null,
      );
    }
  }

  void _sendProposalMessage(SelectableProposalItem proposal) {
    if (proposal.id.isEmpty) {
      setState(() {
        _draftProposal = null;
      });
      return;
    }

    setState(() {
      _draftProposal = null;
    });
  }

  void _handleFileUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true, // Enable multi-file selection
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'xls',
        'xlsx',
        'txt',
        'ppt',
        'pptx',
      ],
    );

    if (result != null && result.files.isNotEmpty) {
      final files = result.files
          .where((file) => file.path != null)
          .map((file) => (filePath: file.path!, fileName: file.name))
          .toList();

      if (files.isNotEmpty) {
        final attachments = await ref
            .read(chatProvider(widget.conversationId).notifier)
            .uploadFile(files);

        if (attachments != null && attachments.isNotEmpty) {
          ref
              .read(chatProvider(widget.conversationId).notifier)
              .sendMessage("", type: 'document', mediaUrls: attachments);

          // Reset upload state
          ref.read(uploadStateProvider.notifier).state = const AsyncValue.data(
            null,
          );
        }
      }
    }
  }

  void _handleImageVideoUpload() async {
    final ImagePicker picker = ImagePicker();
    final XFile? media = await picker.pickMedia();

    if (media != null) {
      final file = (filePath: media.path, fileName: media.name);

      final attachments = await ref
          .read(chatProvider(widget.conversationId).notifier)
          .uploadFile([file]);

      if (attachments != null && attachments.isNotEmpty) {
        // Determine type based on extension
        final extension = media.path.split('.').last.toLowerCase();
        final type = ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(extension)
            ? 'image'
            : 'video';

        ref
            .read(chatProvider(widget.conversationId).notifier)
            .sendMessage("", type: type, mediaUrls: attachments);

        // Reset upload state
        ref.read(uploadStateProvider.notifier).state = const AsyncValue.data(
          null,
        );
      }
    }
  }

  void _shareGoogleMeetLink() {
    _removeOverlay();
  }

  void _showMeetConfirmationOverlay() {
    if (_overlayEntry != null) {
      _removeOverlay();
      return;
    }

    final RenderBox renderBox =
        _meetIconKey.currentContext!.findRenderObject() as RenderBox;
    final iconPosition = renderBox.localToGlobal(Offset.zero);
    final iconSize = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: iconPosition.dy + iconSize.height + 8,
          right: 12,
          child: SlideTransition(
            position: _meetOffsetAnimation,
            child: MeetConfirmationDialog(
              onShare: _shareGoogleMeetLink,
              onCancel: _removeOverlay,
              name: widget.name,
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
    _meetAnimationController.forward();
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _meetAnimationController.reverse().then((_) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      });
    }
  }

  void _showProposalSelectionSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: ProposalSelectionBottomSheet(
            onProposalSelected: (proposal) {
              setState(() {
                _draftProposal = proposal;
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildListItem(ChatMessage m) {
    switch (m.type) {
      case 'dateSeparator':
        return ChatSeparator(label: m.proposalTitle ?? '', isHelper: false);
      case 'helperMessage':
        return ChatSeparator(label: m.proposalSubtitle ?? '', isHelper: true);
      case 'text':
        return ChatBubbleText(message: m);
      case 'proposal':
        return ChatCardProposal(message: m);
      case 'googleMeet':
        return ChatCardGoogleMeet(message: m);
      case 'document':
        return ChatBubbleFile(message: m);
      case 'audio':
        return ChatBubbleVoice(message: m);
      case 'image':
        return ChatBubbleImage(message: m);
      case 'video':
        return ChatBubbleVideo(message: m);
      default:
        return ChatBubbleText(message: m); // Fallback to text
    }
  }

  Widget _buildMessageList(List<ChatMessage> messages, {bool hasMore = false}) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // Only check on scroll end to prevent rapid firing
        if (notification is ScrollEndNotification && hasMore) {
          final position = _scrollController.position;
          // Load more when scrolled to TOP (where older messages are)
          if (position.pixels <= 100) {
            _scrollDebounce?.cancel();
            _scrollDebounce = Timer(const Duration(milliseconds: 500), () {
              ref
                  .read(chatProvider(widget.conversationId).notifier)
                  .loadMoreMessages();
            });
          }
        }
        return false;
      },
      child: ListView.builder(
        reverse: true,
        controller: _scrollController,
        // NO reverse - normal list with oldest at top, newest at bottom
        padding: const EdgeInsets.only(bottom: 12, top: 8),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          // Messages are now in chronological order (oldest first)
          // index 0 = oldest (at top), index last = newest (at bottom)
          final m = messages[index];
          return _buildListItem(m);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider(widget.conversationId));

    ref.listen(uploadStateProvider, (previous, next) {
      next.when(
        data: (attachments) {
          // Logic moved to specific handlers (_handleFileUpload, _sendVoiceMessage)
        },
        loading: () {
          // Show loading indicator
          AppHelpers.showLoadingToast(context, "Uploading the file");
        },
        error: (error, stackTrace) {
          AppHelpers.showErrorToast(context, "Failed to upload the file");
        },
      );
    });

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: GestureDetector(
        onTap: _removeOverlay,
        child: SafeArea(
          child: Column(
            children: [
              ChatHeader(
                name: widget.name,
                isOnline: widget.isOnline,
                logo: widget.logo.isEmpty ? "" : widget.logo,
                meetIconKey: _meetIconKey,
                onMeetPressed: _showMeetConfirmationOverlay,
              ),
              const Divider(height: 1, color: AppColors.divider),
              Expanded(
                child: chatState.maybeWhen(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: (messages, typingUsers) => messages.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : _buildMessageList(messages.reversed.toList()),
                  loaded: (messages, typingUsers, hasMore, currentPage) {
                    // Scroll to bottom on initial load OR when new messages arrive
                    final shouldScrollToBottom =
                        _lastMessageCount == 0 ||
                        (messages.length > _lastMessageCount &&
                            currentPage == 1);

                    if (shouldScrollToBottom) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _scrollToBottom();
                      });
                    }
                    _lastMessageCount = messages.length;

                    return _buildMessageList(
                      messages.reversed.toList(),
                      hasMore: hasMore,
                    );
                  },
                  error: (message, messages, typingUsers) => Column(
                    children: [
                      if (messages.isNotEmpty)
                        Expanded(
                          child: _buildMessageList(messages.reversed.toList()),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'Error: $message',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  orElse: () => const SizedBox(),
                ),
              ),
              // Typing Indicator
              chatState.maybeWhen(
                loaded: (messages, typingUsers, hasMore, currentPage) {
                  if (typingUsers.isEmpty) return const SizedBox.shrink();
                  return _buildTypingIndicator(typingUsers);
                },
                orElse: () => const SizedBox.shrink(),
              ),
              ChatInputBar(
                textController: _textController,
                onSendText: _sendText,
                onFileUpload: _handleFileUpload,
                onImageUpload: _handleImageVideoUpload, // Pass the new handler
                onSendVoice: _sendVoiceMessage,
                onShowProposalSelector: _showProposalSelectionSheet,
                onSendProposal: _sendProposalMessage,
                draftProposal: _draftProposal,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypingIndicator(Map<String, String> typingUsers) {
    if (typingUsers.isEmpty) return const SizedBox.shrink();

    final names = typingUsers.values.toList();
    final text = names.length == 1
        ? '${names.first} is typing...'
        : '${names.length} people are typing...';

    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 4),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
