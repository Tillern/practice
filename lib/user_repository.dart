import 'dart:convert';

import 'package:practice/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  final String _baseUrl = 'https://randomuser.me/api/?results=100';

  Future<List<UserModel>> fetchUsers() async{
    final response = await http.get(Uri.parse(_baseUrl));

    if(response.statusCode == 200){
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => UserModel.fromJson(json)).toList();
    }else{
      throw Exception("Failed to fetch users!");
    }
  }
}