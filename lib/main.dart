import 'package:flutter/material.dart';
import 'package:practice/profile_screen.dart';
import 'package:practice/settings_screen.dart';
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
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    UserListScreen(),      // Home screen
    SettingsScreen(),      // Settings screen
    ProfileScreen(),       // Profile screen
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
