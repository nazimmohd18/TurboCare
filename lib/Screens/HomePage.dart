import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
import 'VehicleNumber.dart';

class HomePage extends StatelessWidget {
  static const routeName = "Home";

  void goToVehicleNumber(BuildContext context){
    Navigator.pushNamed(context, VehicleNumber.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
  
    appBar: AppBar(
  backgroundColor: violet,
  title: Text('Vehicles',style: TextStyle(fontSize: 24),),
),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),backgroundColor: violet,
      onPressed: (){
        goToVehicleNumber(context);
      },),
      body: Container(
        width: deviceWidth,
    height: deviceHeight,
    padding: EdgeInsets.all(deviceWidth* .05),
        child: ListView(
          children: [
            Container(
              width: deviceWidth,
              height: deviceWidth* .15,
              padding: EdgeInsets.symmetric(vertical: deviceWidth* .015),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('MH12AB1234',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),

                      Text('Maruti Suzuki Dzire',style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_outlined,color: grey,)
                ],
              ),
            ),
            Divider(color: grey,)
          ],
        ),
      ),
    );
  }
}
