import 'package:calendz_app/domain/entity/entity.dart';
import 'package:calendz_app/data/firestore/repository/user_repository/user_repository.dart'
    as dataUserRepository;

class UserRepository {
  final dataUserRepository.UserRepository _userRepository =
      dataUserRepository.UserRepository();

  Future<User> getOne({required String docId}) async {
    return User.fromDataModel(await _userRepository.fetchOne(docId: docId));
  }

  Future<List<User>> getAll() async {
    return User.listFromMapData(await _userRepository.fetchAll());
  }

  Future<User> create(User user) async {
    return User.fromDataModel(
        await _userRepository.insert(entity: user.toDataModel()));
  }

  Future<User> update(User user) async {
    return User.fromDataModel(
        await _userRepository.update(entity: user.toDataModel()));
  }

  Future<bool> delete(User user) async {
    return await _userRepository.remove(docId: user.uid.toString());
  }

  Future<void> resetPassword(String email) async {
    await _userRepository.resetPassword(email: email);
  }
}
