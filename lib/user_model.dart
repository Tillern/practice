class UserModel {
  final String name;
  final String email;
  final String profileImageUrl;

  UserModel(
      {required this.name,
      required this.email,
      required this.profileImageUrl});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        name: "${json['name']['first']} ${json['name']['last']}",
        email: json['email'],
        profileImageUrl: json['picture']['thumbnail']);
  }
}
