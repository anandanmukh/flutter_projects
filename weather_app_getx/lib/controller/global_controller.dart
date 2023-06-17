import "package:geolocator/geolocator.dart";
import "package:get/get.dart";
import "package:weather_app_getx/api/fetch_weather.dart";
import "package:weather_app_getx/model/weather_data_current.dart";

import "../model/weather_data.dart";

class GlobalController extends GetxController {
  // create the required variables
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitue = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  // create the instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitue;
  RxDouble getLongitude() => _longitude;
  // final weatherData = WeatherDataCurrent(current: none).obs;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    getLocation();
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location Not Enabled");
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    // getting the current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) => {
              // update our lattitude and logitude
              _lattitue.value = value.latitude,
              _longitude.value = value.longitude,

              // calling our weather api
              // return FetchWeatherApi().processData(value.latitude, value.longitude).then((value) => {
              //   _isLoading.value = false,
              // });
            });
  }
}
