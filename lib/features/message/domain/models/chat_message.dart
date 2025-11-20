import 'package:athlink/features/message/domain/models/chat_message.dart';

enum ChatMessageType {
  text,
  proposal,
  googleMeet,
  dateSeparator,
  helperMessage,
  file,
  voiceMessage,
}

class ChatMessage {
  final ChatMessageType type;
  final bool fromMe;
  final String? text;
  final String? helperMessage;
  final String? time;
  final String? dateLabel;
  final String? proposalTitle;
  final String? proposalSubtitle;
  final String? proposalLogo;
  final String? meetLink;
  final String? meetThumbnail;
  final String? fileName;
  final String? fileSize;
  final String? fileType;
  final String? filePath;
  final String? audioPath;
  final Duration? duration;

  ChatMessage({
    required this.type,
    required this.fromMe,
    this.text,
    this.helperMessage,
    this.time,
    this.dateLabel,
    this.proposalTitle,
    this.proposalSubtitle,
    this.proposalLogo,
    this.meetLink,
    this.meetThumbnail,
    this.fileName,
    this.fileSize,
    this.fileType,
    this.filePath,
    this.audioPath,
    this.duration,
  });
}
