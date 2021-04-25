import 'package:flutter/material.dart';
import 'package:turbocare/Screens/HomePage.dart';
import '../Utils/Colors.dart';
import 'package:get/get.dart';
import '../Controller/DetailsControlller.dart';

class VehicleProfile extends StatefulWidget {
  static const routeName = 'VehicleProfile';

  @override
  _VehicleProfileState createState() => _VehicleProfileState();
}

class _VehicleProfileState extends State<VehicleProfile> {

  DetailsController myController = Get.put(DetailsController());


  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: violet,

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: violet,
        child: Icon(Icons.home),
        onPressed: (){
          Get.offAll(HomePage());
        },
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(deviceWidth* .05),
            alignment: Alignment.bottomLeft,
            width: deviceWidth,
            height: deviceHeight* .3,
            color: violet,
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              myController.modelController.text + " "+myController.fuelController.text,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),),
                SizedBox(height: deviceWidth* .02,),
                Text(
                  myController.vehicleNumberController.text,
                  // 'MH12PN7781',
                  style: TextStyle(color: Colors.white,fontSize: 16),),
              ],
            ),
          ),
          Container(
            width: deviceWidth,
            padding: EdgeInsets.all(deviceWidth* .1),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                children: [
                  Text('MAKE',style: TextStyle(fontSize: 16),),
                  SizedBox(height: deviceWidth* .025,),
                  Text(
                    myController.makeController.text.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  SizedBox(height: deviceWidth* .1,),
                  Text('FUEL TYPE',style: TextStyle(fontSize: 16),),
                  SizedBox(height: deviceWidth* .025,),
                  Text(
                    myController.fuelController.text.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  )
                ],
              ),
                Column(
                  children: [
                    Text('MODEL',style: TextStyle(fontSize: 16),),
                    SizedBox(height: deviceWidth* .025,),
                    Text(
                      myController.modelController.text.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                    SizedBox(height: deviceWidth* .1,),
                    Text('TRANSMISSION',style: TextStyle(fontSize: 16),),
                    SizedBox(height: deviceWidth* .025,),
                    Text(
                      myController.transmissionController.text.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                    )
                  ],
                ),

            ],),
          )
        ],
      ),
    );
  }
}
