import 'package:practice/user.dart';
import 'package:practice/user_model.dart';
import 'package:practice/user_repository.dart';

class UserUseCase {
  final UserRepository _userRepository;

  UserUseCase(this._userRepository);

  Future<List<User>> getUsers() async {
    final List<UserModel> userModels = await _userRepository.fetchUsers();

    // Map UserModel to User
    return userModels.map((userModel) => User(
      name: userModel.name,
      email: userModel.email,
      picture: userModel.profileImageUrl,
    )).toList();
  }
}