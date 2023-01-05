import 'dart:convert';

import 'package:calendz_app/data/entity/profile/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? uid;
  final String? lastname;
  final String? firstname;
  final String? email;
  final String? avatar;
  final bool? created;
  final String? token;
  final Profile? appleProfile;
  final Profile? googleProfile;
  const User({
    this.uid,
    this.lastname,
    this.firstname,
    this.email,
    this.avatar,
    this.created,
    this.token,
    this.appleProfile,
    this.googleProfile,
  });

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static _toJsonIri(dynamic data) {
    String text = data.runtimeType.toString();
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
    String result = text
        .replaceAllMapped(exp, (Match m) => ('_' + m.group(0)!))
        .toLowerCase();
    if (data != null) {
      return 'api/${result + 's'}/${data.id}';
    }
    return null;
  }

  static List<User> listFromJson(dynamic str) =>
      List<User>.from(str.map((x) => User.fromJson(x)));

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'lastname': lastname,
      'firstname': firstname,
      'email': email,
      'avatar': avatar,
      'created': created,
      'token': token,
      'appleProfile': appleProfile?.toMap(),
      'googleProfile': googleProfile?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      lastname: map['lastname'],
      firstname: map['firstname'],
      email: map['email'],
      avatar: map['avatar'],
      created: map['created'],
      token: map['token'],
      appleProfile: map['appleProfile'] != null
          ? Profile.fromMap(map['appleProfile'])
          : null,
      googleProfile: map['googleProfile'] != null
          ? Profile.fromMap(map['googleProfile'])
          : null,
    );
  }
}
