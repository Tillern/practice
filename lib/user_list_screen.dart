import 'package:flutter/material.dart';
import 'package:practice/user_provider.dart';
import 'package:provider/provider.dart';
import 'user_details_screen.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: userProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: userProvider.users.length,
        itemBuilder: (context, index) {
          final user = userProvider.users[index];

          Color cardColor = user.gender == 'female' ? Colors.lightGreen[100]! : Colors.lightBlue[100]!;

          return Card(
            color: cardColor,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              // Make the image circular
              leading: ClipOval(
                child: Image.network(
                  user.picture,
                  width: 50, // Adjust size as needed
                  height: 50, // Adjust size as needed
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailsScreen(user: user),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userProvider.fetchUsers();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

