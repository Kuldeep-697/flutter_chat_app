import 'package:api_integration/models/user_dob.dart';
import 'package:api_integration/models/user_image.dart';
import 'package:api_integration/models/user_location.dart';
import 'package:api_integration/models/user_name.dart';

class Login {
  final String uuid;
  final String username;
  final String password;
  final String salt;
  final String md5;
  final String sha1;
  final String sha256;

  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });
}

class Registered {
  final String date;
  final int age;

  Registered({
    required this.date,
    required this.age,
  });
}

class Id {
  final String name;
  final String value;

  Id({
    required this.name,
    required this.value,
  });
}

class User {
  final String gender;
  final UserName name;
  final UserLocation location;
  final String email;
  // final Login login;
  final UserDob dob;
  // final Registered registered;
  final String phone;
  final String cell;
  // final Id id;
  final UserPicture picture;
  final String nat;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    //required this.login,
    required this.dob,
    //required this.registered,
    required this.phone,
    required this.cell,
    //required this.id,
    required this.picture,
    required this.nat,
  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
