import 'package:random_user_api/features/user/model/user_dob.dart';
import 'package:random_user_api/features/user/model/user_location.dart';
import 'package:random_user_api/features/user/model/user_name_model.dart';

class UserModel {
  final UserName name;
  final String gender;
  final UserLocation location;
  final String email;
  final UserDob dob;

  UserModel(
      {required this.gender,
      required this.name,
      required this.location,
      required this.email,
      required this.dob});

  factory UserModel.fromMap(Map<String, dynamic> json) {
    final name = UserName.fromMap(json['name'] ?? '');
    final location = UserLocation.fromMap(json['location']);
    final dob = UserDob.fromMap(json['dob']);
    return UserModel(
        gender: json['gender'] ?? '',
        name: name,
        location: location,
        email: json['email'],
        dob: dob);
        
  }
  String get fullName {
    return '${name.title}. ${name.first} ${name.last}';
  }
}
