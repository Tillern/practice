import 'package:flutter/material.dart';
import 'package:practice/user_list_screen.dart';
import 'package:practice/user_provider.dart';
import 'package:practice/user_repository.dart';
import 'package:practice/user_usecase.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => UserRepository()),
        ProxyProvider<UserRepository, UserUseCase>(
          update: (_, repository, __) => UserUseCase(repository),
        ),
        ChangeNotifierProxyProvider<UserUseCase, UserProvider>(
          create: (_) => UserProvider(UserUseCase(UserRepository())),
          update: (_, useCase, provider) => provider!..fetchUsers(),
        ),
      ],
      child: MaterialApp(
        home: UserListScreen(),
      ),
    );
  }
}
