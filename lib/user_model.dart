class UserModel {
  final String name;
  final String email;
  final String picture;
  final String gender;
  final String location;
  final String city;
  final String dob;
  final String registeredDate;

  UserModel({
    required this.name,
    required this.email,
    required this.picture,
    required this.gender,
    required this.location,
    required this.city,
    required this.dob,
    required this.registeredDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: "${json['name']['first']} ${json['name']['last']}",
      email: json['email'],
      picture: json['picture']['large'],
      gender: json['gender'],
      location: json['location']['country'],
      city: json['location']['city'],
      dob: json['dob']['date'],
      registeredDate: json['registered']['date'],
    );
  }
}