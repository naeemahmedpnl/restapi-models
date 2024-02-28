import 'package:restapi/model/location.dart';
import 'package:restapi/model/picture.dart';
import 'package:restapi/model/user_dob.dart';
import 'package:restapi/model/username.dart';



class User{
final String gender;
final String email;
final String phone;
final String cell;
final String nat;
final UserName name;
final UserDob dob;
final UserLocation location;
final UserPicture picture;

User({required this.gender,
required this.email, 
required this.phone, 
required this.cell, 
required this.nat,
required this.name,
required this.dob,
required this.location,
required this.picture

});

factory User.fromMap(Map<String, dynamic> e){
    
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);

  return User(    
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat : e['nat'],
      gender: e['gender'],
      dob: dob,
      name: name,
      location: location,
      picture: picture
      
      );

}

String get fullName {
      return '${name.title} ${name.first} ${name.last}';
    }

}

