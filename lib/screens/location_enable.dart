import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matunda/screens/dashboard_screen.dart';

class EnableLocation extends StatefulWidget {
  const EnableLocation({super.key});
  @override
  State<EnableLocation> createState() => _EnableLocationState();
}

class _EnableLocationState extends State<EnableLocation> {
  // String requestLocationsStatus = '';
  // final location =Location();

  // Future<void> _requestLocationPermission() async {
  //   setState(() {
  //     requestLocationsStatus = 'Requesting location...';
  //   });
  //    bool serviceEnabled;
  //     PermissionStatus permissionGranted;

  //   serviceEnabled =await location.serviceEnabled();
  //   if(!serviceEnabled){
  //     serviceEnabled =await location.requestService();

  //     if(!serviceEnabled){
  //       requestLocationsStatus='Location is disabled..';
  //     }
  //     return;
  //   }

  //   permissionGranted= await location.hasPermission();
  //   if(permissionGranted==PermissionStatus.isDenied)

  // final status = await Permission.location.request();
  // if (status.isGranted) {
  //   setState(() {
  //     requestLocationsStatus = 'Permission granted..';
  //   });
  //   final position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   double latitude = position.latitude;
  //   double longitude = position.longitude;
  //   print('latitude:$latitude,longitude:$longitude');
  // } else {
  //   if (status.isDenied) {
  //     setState(() {
  //       requestLocationsStatus = 'Permission denied!';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            SvgPicture.asset(
              'assets/svg/location.svg',
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enable your Location',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'To search for the best  nearet store we, want to know your exactly location',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 35, 94, 37)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color.fromARGB(255, 35, 94, 37),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Dashboard()));
                    },
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            'Use current location',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            TextButton(

                /// on pressed skip and go to homepanel
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Dashboard()));
                },
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Dashboard()));
                  },
                  child: Text(
                    'Skip for now',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
