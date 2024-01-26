class UserLocation {
  final Street street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final CoOrdinates coOrdinates;
  final TimeZone timeZone;

  UserLocation(
      {required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.coOrdinates,
      required this.timeZone});

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final street = Street.fromMap(json['street']);
    final coOrdinates = CoOrdinates.fromMap(json['coordinates']);
    final timeZone = TimeZone.fromMap(json['timezone']);
    return UserLocation(
        street: street,
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        country: json['country'] ?? '',
        postcode: json['postcode'].toString(),
        coOrdinates: coOrdinates,
        timeZone: timeZone);
  }
}

class Street {
  final String streetNumber;
  final String streetName;

  Street({required this.streetNumber, required this.streetName});

  factory Street.fromMap(Map<String, dynamic> json) {
    return Street(
        streetNumber: json['number'].toString(),
        streetName: json['name'] ?? '');
  }
}

class CoOrdinates {
  final String latitude;
  final String longitude;

  CoOrdinates({required this.latitude, required this.longitude});

  factory CoOrdinates.fromMap(Map<String, dynamic> json) {
    return CoOrdinates(
        latitude: json['latitude'] ?? '', longitude: json['longitude'] ?? '');
  }
}

class TimeZone {
  final String offSet;
  final String description;

  TimeZone({required this.offSet, required this.description});

  factory TimeZone.fromMap(Map<String, dynamic> json) {
    return TimeZone(
        offSet: json['offset'] ?? '', description: json['description'] ?? '');
  }
}
