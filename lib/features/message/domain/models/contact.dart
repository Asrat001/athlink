import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

enum ContactType {
  athlete,
  sponsor,
}

@freezed
abstract class Contact with _$Contact {
  const factory Contact({
    required String id,
    required String name,
    required String logo,
    required ContactType type,
    String? email,
    String? phoneNumber,
    @Default(false) bool isOnline,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}
