// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String?,
      lastname: json['lastname'] as String?,
      firstname: json['firstname'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      created: json['created'] as bool?,
      token: json['token'] as String?,
      appleProfile: json['appleProfile'] == null
          ? null
          : Profile.fromJson(json['appleProfile'] as Map<String, dynamic>),
      googleProfile: json['googleProfile'] == null
          ? null
          : Profile.fromJson(json['googleProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'email': instance.email,
      'avatar': instance.avatar,
      'created': instance.created,
      'token': instance.token,
      'appleProfile': instance.appleProfile,
      'googleProfile': instance.googleProfile,
    };
