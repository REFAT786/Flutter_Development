import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather_app/features/splash_screen.dart';
import 'package:weather_app/features/weather/widgets/custom_hourly_forecast_widget.dart';
import 'package:weather_app/features/weather/widgets/custom_more_day_forecast_widget.dart';
import 'package:http/http.dart' as http;
import '../../../util/images/images.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  late Position position;

  String apiKey = '4d8970b1639987e246a8e06838072e88';
  double tempNow = 56;
  String weatherStatus = "Cloudy";
  String locationName = "San Francisco,CA";
  double tempFeelsLike = 56;
  double highTemp = 65;
  double lowTemp = 54;
  double lat = 23.8;
  double lon = 90.4;
  String weatherApiURL="";
  String forecastApiURL="";
  String moreDaysForecastApiURL="";
  //String tenDaysForecastApiURL="";
//https://api.openweathermap.org/data/2.5/forecast?lat=23.8&lon=90.4&cnt=4&units=metric&exclude=daily&appid=4d8970b1639987e246a8e06838072e88
  Map<String, dynamic>? currentWeatherMap;
  Map<String, dynamic>? forecastWeatherMap;
  Map<String, dynamic>? moreDaysForecastWeatherMap;

  @override
  void initState() {
    // TODO: implement initState
    determinePosition();
    super.initState();
  }

  Future<void> determinePosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showLocationDialog();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location permissions are permanently denied');
      }

      position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          locationName = "${place.locality}, ${place.country}";
        });
        fetchWeatherData();
      }
    } catch (e) {
      setState(() {
        locationName = "Unable to get location.";
      });
      print("Error determining position: $e");
    }
  }

  void _showLocationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Services Disabled'),
        content: const Text('Please enable location services to use this feature.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Geolocator.openLocationSettings();
              Navigator.of(context).pop();
            },
            child: const Text('Enable'),
          ),
        ],
      ),
    );
  }

  Future<void> fetchWeatherData() async {
    weatherApiURL = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey";
    forecastApiURL = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&units=metric&exclude=hourly&appid=$apiKey";
    moreDaysForecastApiURL = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&units=metric&exclude=hourly&appid=$apiKey";
    try {
      var responses = await Future.wait([
        http.get(Uri.parse(weatherApiURL)),
        http.get(Uri.parse(forecastApiURL)),
        http.get(Uri.parse(moreDaysForecastApiURL)),
      ]);

      setState(() {
        currentWeatherMap = Map<String, dynamic>.from(jsonDecode(responses[0].body));
        forecastWeatherMap = Map<String, dynamic>.from(jsonDecode(responses[1].body));
        moreDaysForecastWeatherMap = Map<String, dynamic>.from(jsonDecode(responses[2].body));
        print(currentWeatherMap);
        print(forecastWeatherMap);
        print(moreDaysForecastWeatherMap);
      });
    } catch (e) {
      print("Error fetching weather data: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    String currentDate = Jiffy.now().format(pattern: 'MMMM do');
    String currentTime = Jiffy.now().format(pattern: 'h:mm a');

    return Scaffold(
      body: currentWeatherMap!=null && forecastWeatherMap!=null?
      Container(
        padding: const EdgeInsets.only(top: 30, bottom: 0, left: 15, right: 15),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff3d4a5a),
            Color(0xff3d4a5a),
            Color(0xff74808c),
            Color(0xff3d4a5a),
            Color(0xff3d4a5a)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff243340),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  locationName,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: AssetImage(Images.profileImage),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Now",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text("$currentDate | $currentTime",
                    style: const TextStyle(fontSize: 15, color: Colors.grey))
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      "${currentWeatherMap!['main']['temp'].toInt()}°C",
                      style: const TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    Image.network("https://openweathermap.org/img/wn/${currentWeatherMap!['weather'][0]['icon']}@2x.png",color: Colors.white,height: 45,width: 45,)
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${currentWeatherMap!['weather'][0]['main']}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    Text("Feels like ${currentWeatherMap!['main']['feels_like'].toInt()}°",
                        style: const TextStyle(color: Colors.white))
                  ],
                )
              ],
            ),
            Text(
              "High: ${currentWeatherMap!['main']['temp_max']}° . Low: ${currentWeatherMap!['main']['temp_min']}°",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Hourly forecast (Today)",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 137,
                      //padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff0d1d2a),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        itemCount: forecastWeatherMap!["list"].length,
                        itemBuilder: (context, index) {
                          index=index+1;
                          return Jiffy.parse('${forecastWeatherMap!['list'][index]['dt_txt']}').isSame(Jiffy.now(),unit: Unit.day )
                            ?CustomHourlyForecastWidget(
                              temperature: forecastWeatherMap!['list'][index]['main']['temp'],
                              cloudImage: "https://openweathermap.org/img/wn/${forecastWeatherMap!['list'][index]['weather'][0]['icon']}@2x.png",
                              cloudText: Jiffy.parse('${forecastWeatherMap!['list'][index]['dt_txt']}').format(pattern: 'h:mm a')):null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "5-days forecast",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 5),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (moreDaysForecastWeatherMap!["list"].length / 7).floor(),
                      itemBuilder: (context, index) {
                        index = index * 7; // Use every 8th index
                        final dateText = moreDaysForecastWeatherMap!['list'][index]['dt_txt'];
                        final isToday = Jiffy.parse(dateText).isSame(Jiffy.now(), unit: Unit.day);
                        return CustomMoreDayForecastWidget(
                          day: isToday
                              ? "Today"
                              : Jiffy.parse(dateText).format(pattern: 'MMM do, yy | h:mm a'),
                          cloudImage:
                          "https://openweathermap.org/img/wn/${moreDaysForecastWeatherMap!['list'][index]['weather'][0]['icon']}@2x.png",
                          highTemp: moreDaysForecastWeatherMap!['list'][index]['main']['temp_max'],
                          lowTemp: moreDaysForecastWeatherMap!['list'][index]['main']['temp_min'],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
          :
      const SplashScreen()
    );
  }
}
