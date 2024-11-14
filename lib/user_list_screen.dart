import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/user_provider.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: userProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: userProvider.users.length,
        itemBuilder: (context, index) {
          final user = userProvider.users[index];
          return ListTile(
            leading: Image.network(user.picture),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userProvider.fetchUsers();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
