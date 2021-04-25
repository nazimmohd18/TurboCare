import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
import 'VehicleTransmission.dart';
import '../Controller/DetailsControlller.dart';
import 'package:get/get.dart';

class VehicleFuel extends StatefulWidget {
  static const routeName = 'VehicleFuel';

  @override
  _VehicleFuelState createState() => _VehicleFuelState();
}

class _VehicleFuelState extends State<VehicleFuel> {

  final  DetailsController detailsController = Get.put(DetailsController());


  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: violet,
        title: Text('Select Fuel Type',style: TextStyle(fontSize: 24),),
      ),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        padding: EdgeInsets.all(deviceWidth* .05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FuelType(fuel: 'Petrol',),
              FuelType(fuel: 'Diesel'),
              FuelType(fuel: 'CNG'),
              FuelType(fuel: 'Petrol + CNG'),
              FuelType(fuel: 'Electric'),
              FuelType(fuel: 'Hybrid'),
            ],
          ),
        ),
      ),
    );
  }
}

class FuelType extends StatelessWidget {

  final String fuel;
  FuelType({@required this.fuel});

  void goToVehicleTransmission(BuildContext context) {
    Navigator.pushNamed(context, VehicleTransmission.routeName);
  }

  final  DetailsController detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return InkWell(onTap:(){
      goToVehicleTransmission(context);
      detailsController.fuelController.text = fuel.toString();
    },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title:  Text(fuel,style: TextStyle(fontSize: 18),),
        trailing: Icon(Icons.arrow_forward_ios_outlined,color: grey,),
      ),
    );
  }
}
