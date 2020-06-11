import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude, _longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _longitude = position.longitude;
      _latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }

  double get longitude => _longitude;
  double get latitude => _latitude;
}
