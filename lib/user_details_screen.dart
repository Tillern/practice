import 'package:flutter/material.dart';
import 'package:practice/user.dart';
import 'package:intl/intl.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      return DateFormat('MMMM dd, yyyy').format(date);
    } catch (e) {
      return 'Invalid Date'; // Handle parsing errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipOval(
                child: Image.network(
                  user.picture,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Name: ${user.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ${user.email}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Gender: ${user.gender}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Location: ${user.city}, ${user.location}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Date of Birth: ${_formatDate(user.dob)}', // Format dob
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Registered Date: ${_formatDate(user.registeredDate)}', // Format registered date
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}