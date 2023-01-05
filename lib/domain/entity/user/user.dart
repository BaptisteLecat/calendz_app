import 'package:calendz_app/domain/entity/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calendz_app/data/entity/user/user.dart' as data;
part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {
  const User._();
  const factory User({
    String? uid,
    String? lastname,
    String? firstname,
    String? email,
    String? avatar,
    bool? created,
    String? token,
    @JsonKey(ignore: true) firebase.User? firebaseUser,
    Profile? appleProfile,
    Profile? googleProfile,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  static const empty = User();

  static List<User> listFromMapData(dynamic str) {
    return List<User>.from(str.map((model) => User.fromDataModel(model)));
  }

  static fromDataModel(data.User dataModel) {
    return User.fromJson(dataModel.toMap());
  }

  data.User toDataModel() {
    return data.User.fromJson(this.toJson());
  }

  dynamic getProp(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }
}
