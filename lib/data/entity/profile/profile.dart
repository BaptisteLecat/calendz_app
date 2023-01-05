import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final String? uid;
  final String? photoUrl;
  final String? email;
  const Profile({
    this.uid,
    this.photoUrl,
    this.email,
  });

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

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

  static List<Profile> listFromJson(dynamic str) =>
      List<Profile>.from(str.map((x) => Profile.fromJson(x)));

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'photoUrl': photoUrl,
      'email': email,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      uid: map['uid'],
      photoUrl: map['photoUrl'],
      email: map['email'],
    );
  }
}
