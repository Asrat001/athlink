import 'dart:math';

import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/widgets/chat_bubble_file.dart';
import 'package:athlink/features/message/widgets/chat_bubble_text.dart';
import 'package:athlink/features/message/widgets/chat_bubble_voice.dart';
import 'package:athlink/features/message/widgets/chat_card_google_meet.dart';
import 'package:athlink/features/message/widgets/chat_card_proposal.dart';
import 'package:athlink/features/message/widgets/chat_header.dart';
import 'package:athlink/features/message/widgets/chat_input_bar.dart';
import 'package:athlink/features/message/widgets/chat_separator.dart';
import 'package:athlink/features/message/widgets/meet_confirmation_dialog.dart';
import 'package:athlink/features/message/widgets/proposal_selection_bottom_sheet.dart'; // Import the new bottom sheet
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/date_formatter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MessageDetailScreen extends StatefulWidget {
  final String name;
  final bool isOnline;
  final String logo;

  const MessageDetailScreen({
    super.key,
    required this.name,
    this.isOnline = true,
    this.logo =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Quartz_logo.svg/512px-Quartz_logo.svg.png',
  });

  @override
  State<MessageDetailScreen> createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  late List<ChatMessage> _messages;

  late AnimationController _meetAnimationController;
  late Animation<Offset> _meetOffsetAnimation;

  final GlobalKey _meetIconKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  SelectableProposalItem? _draftProposal; // New state for draft proposal

  final List<ChatMessage> sampleChatMessages = [
    // ... (Your existing sample messages)
    ChatMessage(
      type: ChatMessageType.dateSeparator,
      fromMe: false,
      dateLabel: "December 29",
    ),
    ChatMessage(
      type: ChatMessageType.proposal,
      fromMe: true,
      proposalTitle: "Brand Ambassador Deal",
      proposalSubtitle: "View detail",
      proposalLogo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Quartz_logo.svg/512px-Quartz_logo.svg.png",
      time: "04:33 AM",
    ),
    ChatMessage(
      type: ChatMessageType.text,
      fromMe: false,
      text:
          "Hello Ms. Maria, can you review the proposal and give us your opinion ASAP?",
      time: "04:34 AM",
    ),
    ChatMessage(
      type: ChatMessageType.text,
      fromMe: true,
      text: "Hello Mr. Tutord. I am super happy to join your team",
      time: "06:41 PM",
    ),
    ChatMessage(
      type: ChatMessageType.googleMeet,
      fromMe: true,
      meetLink: "https://meet.google.com/fzn-uakc-rst",
      meetThumbnail:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Google_Meet_icon_%282020%29.svg/2048px-Google_Meet_icon_%282020%29.svg.png",
      time: "12:23 PM",
    ),
  ].reversed.toList();

  @override
  void initState() {
    super.initState();
    _messages = List.from(sampleChatMessages);

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
    final msg = ChatMessage(
      type: ChatMessageType.text,
      fromMe: true,
      text: text.trim(),
      time: formatTime(DateTime.now()),
    );
    setState(() {
      _messages.insert(0, msg);
      _textController.clear();
    });
  }

  void _sendVoiceMessage(String path, Duration duration) {
    final msg = ChatMessage(
      type: ChatMessageType.voiceMessage,
      fromMe: true,
      audioPath: path,
      duration: duration,
      time: formatTime(DateTime.now()),
    );
    setState(() {
      _messages.insert(0, msg);
    });
  }

  // New method to send a proposal message
  void _sendProposalMessage(SelectableProposalItem proposal) {
    if (proposal.id.isEmpty) {
      // Check for empty ID to clear draft
      setState(() {
        _draftProposal = null;
      });
      return;
    }

    final msg = ChatMessage(
      type: ChatMessageType.proposal,
      fromMe: true,
      proposalTitle: proposal.title,
      proposalSubtitle: proposal.subtitle ?? "View detail",
      proposalLogo: proposal.logoUrl,
      time: formatTime(DateTime.now()),
    );
    setState(() {
      _messages.insert(0, msg);
      _draftProposal = null; // Clear the draft after sending
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
      PlatformFile file = result.files.single;
      final fileSizeKB = (file.size / 1024).toStringAsFixed(1);
      final fileNameWithoutExtension = file.name.substring(
        0,
        file.name.lastIndexOf('.'),
      );
      final fileExtension = file.extension?.toUpperCase() ?? 'FILE';

      final msg = ChatMessage(
        type: ChatMessageType.file,
        fromMe: true,
        fileName: fileNameWithoutExtension,
        fileSize: "$fileSizeKB KB",
        fileType: fileExtension,
        filePath: file.path,
        time: formatTime(DateTime.now()),
      );

      setState(() {
        _messages.insert(0, msg);
      });
    }
  }

  void _shareGoogleMeetLink() {
    final random = Random();
    final linkPart =
        '${random.nextInt(999).toString().padLeft(3, '0')}-${random.nextInt(9999).toString().padLeft(4, '0')}-${random.nextInt(999).toString().padLeft(3, '0')}';
    final meetLink = "https://meet.google.com/$linkPart";

    final msg = ChatMessage(
      type: ChatMessageType.googleMeet,
      fromMe: true,
      meetLink: meetLink,
      meetThumbnail:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Google_Meet_icon_%282020%29.svg/2048px-Google_Meet_icon_%282020%29.svg.png",
      time: formatTime(DateTime.now()),
    );

    setState(() {
      _messages.insert(0, msg);
    });
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

  // New method to show the proposal selection bottom sheet
  void _showProposalSelectionSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Important for rounded corners
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.8, // Adjust as needed
          child: ProposalSelectionBottomSheet(
            onProposalSelected: (proposal) {
              setState(() {
                _draftProposal = proposal; // Set the draft proposal
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildListItem(ChatMessage m) {
    switch (m.type) {
      case ChatMessageType.dateSeparator:
        return ChatSeparator(label: m.dateLabel ?? '', isHelper: false);
      case ChatMessageType.helperMessage:
        return ChatSeparator(label: m.helperMessage ?? '', isHelper: true);
      case ChatMessageType.text:
        return ChatBubbleText(message: m);
      case ChatMessageType.proposal:
        return ChatCardProposal(message: m);
      case ChatMessageType.googleMeet:
        return ChatCardGoogleMeet(message: m);
      case ChatMessageType.file:
        return ChatBubbleFile(message: m);
      case ChatMessageType.voiceMessage:
        return ChatBubbleVoice(message: m);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                logo: widget.logo,
                meetIconKey: _meetIconKey,
                onMeetPressed: _showMeetConfirmationOverlay,
              ),
              const Divider(height: 1, color: AppColors.divider),
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.only(bottom: 12, top: 8),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final m = _messages[index];
                    return _buildListItem(m);
                  },
                ),
              ),
              ChatInputBar(
                textController: _textController,
                onSendText: _sendText,
                onFileUpload: _handleFileUpload,
                onSendVoice: _sendVoiceMessage,
                onShowProposalSelector:
                    _showProposalSelectionSheet, // Pass the new method
                onSendProposal: _sendProposalMessage, // Pass the new method
                draftProposal: _draftProposal, // Pass the draft proposal state
              ),
            ],
          ),
        ),
      ),
    );
  }
}
