import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/presentation/providers/providers.dart';
import 'package:athlink/features/message/presentation/providers/states/chat_state.dart';
import 'package:athlink/features/message/presentation/widgets/chat_bubble_file.dart';
import 'package:athlink/features/message/presentation/widgets/chat_bubble_text.dart';
import 'package:athlink/features/message/presentation/widgets/chat_bubble_voice.dart';
import 'package:athlink/features/message/presentation/widgets/chat_card_google_meet.dart';
import 'package:athlink/features/message/presentation/widgets/chat_card_proposal.dart';
import 'package:athlink/features/message/presentation/widgets/chat_header.dart';
import 'package:athlink/features/message/presentation/widgets/chat_input_bar.dart';
import 'package:athlink/features/message/presentation/widgets/chat_separator.dart';
import 'package:athlink/features/message/presentation/widgets/meet_confirmation_dialog.dart';
import 'package:athlink/features/message/presentation/widgets/proposal_selection_bottom_sheet.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  }

  @override
  void dispose() {
    _meetAnimationController.dispose();
    _textController.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  void _sendText(String text) {
    if (text.trim().isEmpty) return;
    ref
        .read(chatProvider(widget.conversationId).notifier)
        .sendMessage(text.trim());

    _textController.clear();
  }

  void _sendVoiceMessage(String path, Duration duration) {
    // TODO: Implement voice message upload via API
    // For now, skip voice upload until implemented
  }

  void _sendProposalMessage(SelectableProposalItem proposal) {
    if (proposal.id.isEmpty) {
      setState(() {
        _draftProposal = null;
      });
      return;
    }

    // TODO: Implement proposal sending via API
    // For now, keep the draft state
    setState(() {
      _draftProposal = null;
    });
  }

  void _handleFileUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
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

    if (result != null && result.files.single.path != null) {
      // TODO: Implement file upload via API
      // For now, skip file upload until implemented
    }
  }

  void _shareGoogleMeetLink() {
    // TODO: Implement Google Meet link sharing via API
    // For now, skip until implemented
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
      case 'file':
        return ChatBubbleFile(message: m);
      case 'voiceMessage':
        return ChatBubbleVoice(message: m);
      default:
        return ChatBubbleText(message: m); // Fallback to text
    }
  }

  Widget _buildMessageList(List<ChatMessage> messages) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.only(bottom: 12, top: 8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final m = messages[messages.length - 1 - index];
        return _buildListItem(m);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider(widget.conversationId));

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
                      : _buildMessageList(messages),
                  loaded: (messages, typingUsers, hasMore, currentPage) {
                    return NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            notification.metrics.extentAfter < 200 &&
                            hasMore) {
                          ref
                              .read(
                                chatProvider(widget.conversationId).notifier,
                              )
                              .loadMoreMessages();
                        }
                        return false;
                      },
                      child: _buildMessageList(messages),
                    );
                  },
                  error: (message, messages, typingUsers) => Column(
                    children: [
                      if (messages.isNotEmpty)
                        Expanded(child: _buildMessageList(messages)),
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
              ChatInputBar(
                textController: _textController,
                onSendText: _sendText,
                onFileUpload: _handleFileUpload,
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
}
