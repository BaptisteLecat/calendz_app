import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:calendz_app/data/entity/profile/profile.dart' as data;
part 'profile.freezed.dart';
part 'profile.g.dart';

@Freezed()
class Profile with _$Profile {
  const Profile._();
  const factory Profile({
    String? uid,
    String? email,
    String? photoUrl,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  static const empty = Profile();

  static List<Profile> listFromMapData(dynamic str) {
    return List<Profile>.from(str.map((model) => Profile.fromDataModel(model)));
  }

  static fromDataModel(data.Profile dataModel) {
    return Profile.fromJson(dataModel.toMap());
  }

  data.Profile toDataModel() {
    return data.Profile.fromJson(this.toJson());
  }

  dynamic getProp(String propertyName) {
    var _mapRep = toJson();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }
}
