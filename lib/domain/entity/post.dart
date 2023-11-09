import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Less {
  final String auditorium;
  final String beginLesson;
  final String endLesson;
  final String building;
  final String date;
  final String dayOfWeekString;
  final String discipline;
  final String kindOfWork;
  final String lecturer;
  final String stream;

  Less( {
    required this.auditorium,
    required this.beginLesson,
    required this.endLesson,
    required this.building,
    required this.date,
    required this.dayOfWeekString,
    required this.discipline,
    required this.kindOfWork,
    required this.lecturer,
    required this.stream,
  });

  factory Less.fromJson(Map<String, dynamic> json) => _$LessFromJson(json);
  Map<String, dynamic> toJson() => _$LessToJson(this);
}