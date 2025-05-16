// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Note _$NoteFromJson(Map<String, dynamic> json) => _Note(
      id: json['id'] as String?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      time: json['time'] as String?,
      isDone: json['isDone'] as bool?,
    );

Map<String, dynamic> _$NoteToJson(_Note instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'time': instance.time,
      'isDone': instance.isDone,
    };
