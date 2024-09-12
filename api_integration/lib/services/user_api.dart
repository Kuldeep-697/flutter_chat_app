import 'dart:convert';
import 'package:api_integration/models/user_dob.dart';
import 'package:api_integration/models/user_image.dart';
import 'package:api_integration/models/user_location.dart';
import 'package:api_integration/models/user_name.dart';
import 'package:http/http.dart' as http;
import 'package:api_integration/models/user.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    final results = json['results'] as List;

    final users = results.map((user) {
      final username = UserName(
        title: user['name']['title'],
        first: user['name']['first'],
        last: user['name']['last']
      );

      final userDob = UserDob(
        date: DateTime.parse(user['dob']['date']), 
        age: user['dob']['age']
      );

      final street = LocationStreet(
        number: user['location']['street']['number'], 
        name: user['location']['street']['name']
      );

      final coordinates = LocationCoordinates(
        latitude: user['location']['coordinates']['latitude'], 
        longitude: user['location']['coordinates']['longitude']
      );

      final timezone = LocationTimezone(
        offset: user['location']['timezone']['offset'], 
        description:  user['location']['timezone']['description']
      );

      final userLocation = UserLocation(
        street: street, 
        city: user['location']['city'], 
        state:  user['location']['state'], 
        country:  user['location']['country'], 
        postcode:  user['location']['postcode'], 
        coordinates:  coordinates, 
        timezone: timezone
      );

      final userImage = UserPicture(
        large: user['picture']['large'], 
        medium: user['picture']['medium'], 
        thumbnail: user['picture']['thumbnail']
      );

      return User(
        gender: user['gender'],
        email: user['email'],
        phone: user['phone'],
        cell: user['cell'],
        nat: user['nat'],
        name: username, 
        dob: userDob, 
        location: userLocation, 
        picture: userImage,
      );
    }).toList();

    return users;
  }
}
