import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
import 'VehicleNumber.dart';
import 'package:get/get.dart';
import '../Controller/DetailsControlller.dart';

class HomePage extends StatefulWidget {
  static const routeName = "Home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DetailsController myController = Get.put(DetailsController());

  void goToVehicleNumber(BuildContext context) {
    Navigator.pushNamed(context, VehicleNumber.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: violet,
        title: Text(
          'Vehicles',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: violet,
        onPressed: () {
          goToVehicleNumber(context);
        },
      ),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        padding: EdgeInsets.all(deviceWidth * .05),
        child:
     myController.makeController.text != "" ?  ListView(
          children: [
            Container(
              width: deviceWidth,
              height: deviceWidth * .15,
              padding: EdgeInsets.symmetric(vertical: deviceWidth * .015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        myController.vehicleNumberController.text,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        myController.makeController.text +
                            " " +
                            myController.modelController.text,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: grey,
                  )
                ],
              ),
            ),
            Divider(
              color: grey,
            )
          ],
        ): Center(
       child: Container(
         width: deviceWidth* .8,
         height: deviceHeight* .1,
         padding: EdgeInsets.all(deviceWidth* .025),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: Colors.white,
             boxShadow: [
         BoxShadow(
         color: Colors.grey.withOpacity(0.5),
         spreadRadius: 3,
         blurRadius: 3,
         offset: Offset(0, 3),
       ),
       ]
         ),
         child: Center(child: Text("Please Add Vehicle!",
         style: TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.bold,

         ),)),
       ),
     ),
      ),
    );
  }
}
