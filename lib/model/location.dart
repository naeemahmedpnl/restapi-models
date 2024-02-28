

class UserLocation {
final String city;
final String state;
final String country;
final String postcode;
final LocationStreet street;
final LocationCordinate coordinates;
final LocationTimezone timezone;


UserLocation({
  required this.city,
  required this.state,
  required this.country,
  required this.postcode,
  required this.street,
  required this.coordinates,
  required this.timezone
});


factory UserLocation.fromMap(Map<String, dynamic> json){
    final timezone = LocationTimezone.fromMap(json['timezone']);
    final coordinates = LocationCordinate.fromMap(json['coordinates']);
    final street = LocationStreet.fromMap(json['street']);

    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      street: street,
      coordinates: coordinates,
      timezone: timezone,
    );
}
}




class LocationStreet{
  final String name;
  final int Number;
  LocationStreet({
    required this.name,
    required this.Number
  }); 
  factory LocationStreet.fromMap(Map<String, dynamic>json ){
    return LocationStreet(
      name: json['name'],
      Number: json['number']);
  }
  }
class LocationCordinate{
  final String latitude;
  final String longitude;
  LocationCordinate({
    required this.latitude,
    required this.longitude
  });

  factory LocationCordinate.fromMap(Map<String, dynamic>json){
    return LocationCordinate(
      latitude: json['latitude'],
      longitude: json['longitude']
    );
  }
}

class LocationTimezone{
  final String offset;
  final String description;
  LocationTimezone({
    required this.offset,
    required this.description
  });

 factory LocationTimezone.fromMap(Map<String, dynamic>json){
  return LocationTimezone(
    offset: json['offset'],
    description: json['description']
  ); }
}