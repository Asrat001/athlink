import 'dart:convert';
import 'dart:developer' as developer;

void logger(dynamic data) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String formattedJson = encoder.convert(data);
  developer.log(formattedJson);
}
