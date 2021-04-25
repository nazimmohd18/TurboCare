import 'package:flutter/material.dart';

import '../Utils/Colors.dart';
import 'package:get/get.dart';
import './VehicleMake.dart';



class CategoryScreen extends StatelessWidget {
  static const routeName = "CategoryScreen";
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: violet,
        title: Text('Select Vehicle Category'),
      ),
      body: ListView(
        padding: EdgeInsets.all(deviceWidth* .05),
        children: [
      Container(

      child: InkWell(onTap: (){
        Get.to( VehicleMake(
            category: '2w'),
          // vehicleNumber: _vehicleController.text,
        );
    },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text("Two Wheeler",style: TextStyle(fontSize: 18),),
        trailing:  Icon(Icons.arrow_forward_ios_outlined,color: grey,),
      ),
    ),
    ),
          Container(

            child: InkWell(onTap: (){
               Get.to( VehicleMake(
                  category: '4w'),
                  // vehicleNumber: _vehicleController.text,
                );


            },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Four Wheeler",style: TextStyle(fontSize: 18),),
                trailing:  Icon(Icons.arrow_forward_ios_outlined,color: grey,),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
