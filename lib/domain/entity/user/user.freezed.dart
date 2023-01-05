// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get uid => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  bool? get created => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  firebase.User? get firebaseUser => throw _privateConstructorUsedError;
  Profile? get appleProfile => throw _privateConstructorUsedError;
  Profile? get googleProfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? uid,
      String? lastname,
      String? firstname,
      String? email,
      String? avatar,
      bool? created,
      String? token,
      @JsonKey(ignore: true) firebase.User? firebaseUser,
      Profile? appleProfile,
      Profile? googleProfile});

  $ProfileCopyWith<$Res>? get appleProfile;
  $ProfileCopyWith<$Res>? get googleProfile;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? lastname = freezed,
    Object? firstname = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? created = freezed,
    Object? token = freezed,
    Object? firebaseUser = freezed,
    Object? appleProfile = freezed,
    Object? googleProfile = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseUser: freezed == firebaseUser
          ? _value.firebaseUser
          : firebaseUser // ignore: cast_nullable_to_non_nullable
              as firebase.User?,
      appleProfile: freezed == appleProfile
          ? _value.appleProfile
          : appleProfile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      googleProfile: freezed == googleProfile
          ? _value.googleProfile
          : googleProfile // ignore: cast_nullable_to_non_nullable
              as Profile?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get appleProfile {
    if (_value.appleProfile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.appleProfile!, (value) {
      return _then(_value.copyWith(appleProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get googleProfile {
    if (_value.googleProfile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.googleProfile!, (value) {
      return _then(_value.copyWith(googleProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? lastname,
      String? firstname,
      String? email,
      String? avatar,
      bool? created,
      String? token,
      @JsonKey(ignore: true) firebase.User? firebaseUser,
      Profile? appleProfile,
      Profile? googleProfile});

  @override
  $ProfileCopyWith<$Res>? get appleProfile;
  @override
  $ProfileCopyWith<$Res>? get googleProfile;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? lastname = freezed,
    Object? firstname = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? created = freezed,
    Object? token = freezed,
    Object? firebaseUser = freezed,
    Object? appleProfile = freezed,
    Object? googleProfile = freezed,
  }) {
    return _then(_$_User(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseUser: freezed == firebaseUser
          ? _value.firebaseUser
          : firebaseUser // ignore: cast_nullable_to_non_nullable
              as firebase.User?,
      appleProfile: freezed == appleProfile
          ? _value.appleProfile
          : appleProfile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      googleProfile: freezed == googleProfile
          ? _value.googleProfile
          : googleProfile // ignore: cast_nullable_to_non_nullable
              as Profile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  const _$_User(
      {this.uid,
      this.lastname,
      this.firstname,
      this.email,
      this.avatar,
      this.created,
      this.token,
      @JsonKey(ignore: true) this.firebaseUser,
      this.appleProfile,
      this.googleProfile})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? uid;
  @override
  final String? lastname;
  @override
  final String? firstname;
  @override
  final String? email;
  @override
  final String? avatar;
  @override
  final bool? created;
  @override
  final String? token;
  @override
  @JsonKey(ignore: true)
  final firebase.User? firebaseUser;
  @override
  final Profile? appleProfile;
  @override
  final Profile? googleProfile;

  @override
  String toString() {
    return 'User(uid: $uid, lastname: $lastname, firstname: $firstname, email: $email, avatar: $avatar, created: $created, token: $token, firebaseUser: $firebaseUser, appleProfile: $appleProfile, googleProfile: $googleProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.firebaseUser, firebaseUser) ||
                other.firebaseUser == firebaseUser) &&
            (identical(other.appleProfile, appleProfile) ||
                other.appleProfile == appleProfile) &&
            (identical(other.googleProfile, googleProfile) ||
                other.googleProfile == googleProfile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, lastname, firstname, email,
      avatar, created, token, firebaseUser, appleProfile, googleProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {final String? uid,
      final String? lastname,
      final String? firstname,
      final String? email,
      final String? avatar,
      final bool? created,
      final String? token,
      @JsonKey(ignore: true) final firebase.User? firebaseUser,
      final Profile? appleProfile,
      final Profile? googleProfile}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get uid;
  @override
  String? get lastname;
  @override
  String? get firstname;
  @override
  String? get email;
  @override
  String? get avatar;
  @override
  bool? get created;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  firebase.User? get firebaseUser;
  @override
  Profile? get appleProfile;
  @override
  Profile? get googleProfile;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
