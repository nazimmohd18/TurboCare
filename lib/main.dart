import 'package:flutter/material.dart';
import 'Screens/HomePage.dart';
import 'Screens/VehicleNumber.dart';
import 'Screens/VehicleMake.dart';
import 'Screens/VehicleModel.dart';
import 'Screens/VehicleFuel.dart';
import 'Screens/VehicleTransmission.dart';
import 'Screens/VehicleProfile.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
     home: HomePage(),
      routes: {

      VehicleNumber.routeName: (context) => VehicleNumber(),
        VehicleMake.routeName: (context) => VehicleMake(),
        VehicleModel.routeName: (context) => VehicleModel(),
        VehicleFuel.routeName: (context) => VehicleFuel(),
        VehicleTransmission.routeName: (context) => VehicleTransmission(),
        VehicleProfile.routeName: (context) => VehicleProfile(),
        HomePage.routeName: (context) => HomePage(),

      },
    );
  }
}
