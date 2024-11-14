import 'package:flutter/cupertino.dart';
import 'package:practice/user.dart';
import 'package:practice/user_usecase.dart';

class UserProvider with ChangeNotifier {
  final UserUseCase _userUseCase;
  List<User> _users = [];
  bool _isLoading = false;

  List<User> get users => _users;
  bool get isLoading => _isLoading;

  UserProvider(this._userUseCase);

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    _users = await _userUseCase.getUsers();

    _isLoading = false;
    notifyListeners();
  }
}