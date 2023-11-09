part of 'post.dart';

Less _$LessFromJson(Map<String, dynamic> json) {
  return Less(
    auditorium: json['auditorium'] as String,
    beginLesson: json['beginLesson'] as String,
    endLesson: json['endLesson'] as String,
    building: json['building'] as String,
    date: json['date'] as String,
    dayOfWeekString: json['dayOfWeekString'] as String,
    discipline: json['discipline'] as String,
    kindOfWork: json['kindOfWork'] as String,
    lecturer: json['lecturer'] as String,
    stream: json['stream'] as String,
  );
}

Map<String, dynamic> _$LessToJson(Less instance) => <String, dynamic> {
  'auditorium': instance.auditorium,
  'beginLesson': instance.beginLesson,
  'endLesson' : instance.endLesson,
  'building': instance.building,
  'date': instance.date,
  'dayOfWeekString': instance.dayOfWeekString,
  'discipline': instance.discipline,
  'kindOfWork': instance.kindOfWork,
  'lecturer': instance.lecturer,
  'stream': instance.stream,
};