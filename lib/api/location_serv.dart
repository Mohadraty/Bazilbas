import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationService {
  LatLng? userLocation;
  Future<LocationPermission> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  currentLocation() async {
    LocationPermission permission = await requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      String locationDetails = '${position.latitude}, ${position.longitude}';

      return locationDetails;
    }
  }

  double calcDistance(LatLng userLocation, LatLng placeLocation) {
    const distance = Distance();
    return distance.as(LengthUnit.Meter, userLocation, placeLocation);
  }
}
