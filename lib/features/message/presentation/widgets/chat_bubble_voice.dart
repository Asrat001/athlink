import 'dart:async';
import 'package:athlink/di.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ChatBubbleVoice extends StatefulWidget {
  final ChatMessage message;

  const ChatBubbleVoice({super.key, required this.message});

  @override
  State<ChatBubbleVoice> createState() => _ChatBubbleVoiceState();
}

class _ChatBubbleVoiceState extends State<ChatBubbleVoice> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  @override
  void didUpdateWidget(covariant ChatBubbleVoice oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.message.mediaUrl != oldWidget.message.mediaUrl) {
      _stopAndReload();
    }
  }

  Future<void> _stopAndReload() async {
    try {
      await _player.stop();
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;
        _isInitialized = false;
      });
      await _initAudio();
    } catch (e) {
      debugPrint("Error reloading audio: $e");
    }
  }

  Future<void> _initAudio() async {
    try {
      if (widget.message.mediaUrl != null) {
        final decodedUrl = Uri.decodeFull(widget.message.mediaUrl!);
        await _player.setUrl(fileBaseUrl + decodedUrl);
        _duration = widget.message.duration ?? Duration.zero;

        _player.playerStateStream.listen((state) {
          if (mounted) {
            setState(() {
              _isPlaying = state.playing;
              if (state.processingState == ProcessingState.completed) {
                _player.seek(Duration.zero);
                _player.pause();
                _isPlaying = false;
              }
            });
          }
        });

        _player.positionStream.listen((p) {
          if (mounted) {
            setState(() => _position = p);
          }
        });

        if (mounted) {
          setState(() => _isInitialized = true);
        }
      }
    } catch (e) {
      debugPrint("Error loading audio: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final min = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final sec = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$min:$sec";
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = sl<LocalStorageService>().getUserData()?.id ?? '';
    final isMe = widget.message.isFromMe(currentUserId);
    final color = isMe ? AppColors.darkBlue : AppColors.white;
    final fgColor = isMe ? AppColors.white : AppColors.darkBlue;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: isMe ? 60 : 12,
          right: isMe ? 12 : 60,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isMe
                ? const Radius.circular(16)
                : const Radius.circular(4),
            bottomRight: isMe
                ? const Radius.circular(4)
                : const Radius.circular(16),
          ),
          boxShadow: [
            if (!isMe)
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (_isInitialized) {
                  _isPlaying ? _player.pause() : _player.play();
                }
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: fgColor.withValues(alpha: 0.2),
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: fgColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 2,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 6,
                      ),
                      overlayShape: SliderComponentShape.noOverlay,
                      activeTrackColor: fgColor,
                      inactiveTrackColor: fgColor.withValues(alpha: 0.3),
                      thumbColor: fgColor,
                    ),
                    child: Slider(
                      value: _position.inMilliseconds.toDouble().clamp(
                        0,
                        _duration.inMilliseconds.toDouble(),
                      ),
                      max: _duration.inMilliseconds.toDouble(),
                      onChanged: (val) {
                        _player.seek(Duration(milliseconds: val.toInt()));
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(_position),
                        style: TextStyle(
                          fontSize: 10,
                          color: fgColor.withValues(alpha: 0.7),
                        ),
                      ),
                      Text(
                        DateFormatter.formatShort(widget.message.createdAt),
                        style: TextStyle(
                          fontSize: 10,
                          color: fgColor.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
