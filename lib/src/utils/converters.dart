import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeConvertString implements JsonConverter<DateTime, String> {
  const DateTimeConvertString();

  @override
  DateTime fromJson(String json) {
    DateFormat format = DateFormat("dd/MM/yyyy");
    return format.parse(json);
  }

  @override
  String toJson(DateTime object) {
    DateFormat format = DateFormat("dd/MM/yyyy");
    return format.format(object);
  }
}
