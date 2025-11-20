import 'dart:async';
import 'package:athlink/features/message/widgets/proposal_selection_bottom_sheet.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class ChatInputBar extends StatefulWidget {
  final TextEditingController textController;
  final Function(String) onSendText;
  final VoidCallback onFileUpload;
  final Function(String path, Duration duration) onSendVoice;
  final Function(SelectableProposalItem) onSendProposal;
  final VoidCallback onShowProposalSelector;
  final SelectableProposalItem? draftProposal;

  const ChatInputBar({
    super.key,
    required this.textController,
    required this.onSendText,
    required this.onFileUpload,
    required this.onSendVoice,
    required this.onSendProposal,
    required this.onShowProposalSelector,
    this.draftProposal,
  });

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  late final AudioRecorder _audioRecorder;
  bool _isRecording = false;
  Timer? _timer;
  int _recordDuration = 0;

  @override
  void initState() {
    super.initState();
    _audioRecorder = AudioRecorder();
    widget.textController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        final dir = await getApplicationDocumentsDirectory();
        final path =
            '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';

        await _audioRecorder.start(const RecordConfig(), path: path);

        setState(() {
          _isRecording = true;
          _recordDuration = 0;
        });

        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() => _recordDuration++);
        });
      } else {
        await Permission.microphone.request();
      }
    } catch (e) {
      debugPrint("Error starting record: $e");
    }
  }

  Future<void> _stopRecording({bool send = true}) async {
    try {
      final path = await _audioRecorder.stop();
      _timer?.cancel();

      if (send && path != null) {
        widget.onSendVoice(path, Duration(seconds: _recordDuration));
      }

      setState(() {
        _isRecording = false;
        _recordDuration = 0;
      });
    } catch (e) {
      debugPrint("Error stopping record: $e");
    }
  }

  String _formatDuration(int seconds) {
    final min = (seconds ~/ 60).toString().padLeft(2, '0');
    final sec = (seconds % 60).toString().padLeft(2, '0');
    return "$min:$sec";
  }

  @override
  Widget build(BuildContext context) {
    final hasText = widget.textController.text.trim().isNotEmpty;
    final hasDraftProposal = widget.draftProposal != null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        // REMOVED FIXED HEIGHT - LET THE CONTENT DETERMINE HEIGHT
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.grey.withValues(alpha: .4),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ), // Added vertical padding
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use min to wrap content
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasDraftProposal)
              _DraftProposalDisplay(
                proposal: widget.draftProposal!,
                onClear: () {
                  widget.onSendProposal(
                    SelectableProposalItem(id: '', title: ''),
                  );
                },
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // File Button (Hidden if recording or has draft proposal)
                if (!_isRecording && !hasDraftProposal)
                  IconButton(
                    onPressed: widget.onFileUpload,
                    icon: SvgPicture.asset("assets/images/file.svg"),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),

                // Input Area or Recording Timer
                Expanded(
                  child: _isRecording
                      ? Row(
                          children: [
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.fiber_manual_record,
                              color: Colors.red,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _formatDuration(_recordDuration),
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () => _stopRecording(send: false),
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.inter(color: Colors.red),
                              ),
                            ),
                          ],
                        )
                      : ConstrainedBox(
                          // Constrain the textfield height
                          constraints: const BoxConstraints(
                            minHeight: 36,
                            maxHeight: 100,
                          ), // Min height for single line, max for multiline
                          child: TextField(
                            controller: widget.textController,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (text) {
                              if (hasDraftProposal) {
                                widget.onSendProposal(widget.draftProposal!);
                              } else {
                                widget.onSendText(text);
                              }
                            },
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                            maxLines: null, // Allow multiple lines
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: "Type your message here...",
                              hintStyle: GoogleFonts.inter(
                                fontSize: 14,
                                color: AppColors.grey600,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                              contentPadding: hasDraftProposal
                                  ? const EdgeInsets.only(bottom: 0, top: 4)
                                  : const EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                ),

                if (hasText || hasDraftProposal) ...[
                  InkWell(
                    onTap: () {
                      if (hasDraftProposal) {
                        widget.onSendProposal(widget.draftProposal!);
                      } else {
                        widget.onSendText(widget.textController.text);
                      }
                    },
                    child: SvgPicture.asset("assets/images/send.svg"),
                  ),
                ] else if (_isRecording) ...[
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => _stopRecording(send: true),
                    child: const Icon(
                      Icons.arrow_upward,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ] else ...[
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: widget.onShowProposalSelector,
                    child: const Icon(Icons.add, color: AppColors.darkBlue),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: _startRecording,
                    child: const Icon(
                      Icons.mic_none,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DraftProposalDisplay extends StatelessWidget {
  final SelectableProposalItem proposal;
  final VoidCallback onClear;

  const _DraftProposalDisplay({required this.proposal, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          if (proposal.logoUrl != null && proposal.logoUrl!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage("assets/images/logo.png"),
                backgroundColor: AppColors.white,
              ),
            ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: proposal.title,

                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.black,
                ),

                CustomText(
                  title: "View Detail",
                  textColor: AppColors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onClear,
            child: const Icon(Icons.close, size: 18, color: AppColors.grey600),
          ),
        ],
      ),
    );
  }
}
