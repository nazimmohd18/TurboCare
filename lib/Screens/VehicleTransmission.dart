import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
import 'VehicleProfile.dart';
import 'package:get/get.dart';
import '../Controller/DetailsControlller.dart';

class VehicleTransmission extends StatefulWidget {
  static const routeName = 'VehicleTransmission';

  @override
  _VehicleTransmissionState createState() => _VehicleTransmissionState();
}

class _VehicleTransmissionState extends State<VehicleTransmission> {
  void goToVehicleProfile(BuildContext context) {
    Navigator.pushNamed(context, VehicleProfile.routeName);
  }

  final  DetailsController detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: violet,
        title: Text('Select Transmission',style: TextStyle(fontSize: 24),),
      ),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        padding: EdgeInsets.all(deviceWidth* .05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(onTap: (){
             goToVehicleProfile(context);
             detailsController.transmissionController.text = "Manual";
              },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title:  Text('Manual',style: TextStyle(fontSize: 18),),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,color: grey,),
                ),
              ),
              InkWell(onTap: (){
                goToVehicleProfile(context);
                detailsController.transmissionController.text = "Automatic";
              },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title:  Text('Automatic',style: TextStyle(fontSize: 18),),
                  trailing: Icon(Icons.arrow_forward_ios_outlined,color: grey,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
