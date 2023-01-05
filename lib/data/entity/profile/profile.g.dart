// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      uid: json['uid'] as String?,
      photoUrl: json['photoUrl'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'uid': instance.uid,
      'photoUrl': instance.photoUrl,
      'email': instance.email,
    };
