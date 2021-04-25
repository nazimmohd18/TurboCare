import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
import './VehicleModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Controller/DetailsControlller.dart';

class VehicleMake extends StatefulWidget {
  static const routeName = 'VehicleMake';

  final String category;
  VehicleMake({this.category});

  @override
  _VehicleMakeState createState() => _VehicleMakeState();
}

class _VehicleMakeState extends State<VehicleMake> {
  void goToVehicleModel(BuildContext context) {
    Navigator.pushNamed(context, VehicleModel.routeName);
  }

  final  DetailsController detailsController = Get.put(DetailsController());

  var data;
  Future<List> getMakeList() async {
    final String url = "https://test.turbocare.app/turbo/care/v1/makes?class=";

    final response = await http.get(Uri.parse(url + widget.category.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);

      print('Data from Vehicle Make: ' + data.toString());
      print(data.length);
      return data;
    } else {
      throw Exception("Unable to load data");
    }
  }

  Future makeList;
  @override
  initState() {
    super.initState();
    makeList = getMakeList();
  }

  @override
  Widget build(BuildContext context) {
    // final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: violet,
        title: Text(
          "Select Make"
          // widget.vehicleNumber.toString()
          ,
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: FutureBuilder(
        future: makeList,
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: new AlwaysStoppedAnimation<Color>(violet),
                ),
              )
            : data.length == 0
                ? Center(
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        child: Text(
                          'No maker available!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(deviceWidth * .05),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        // padding: EdgeInsets.symmetric(vertical: deviceWidth* .025),
                        child: InkWell(
                          onTap: () {
                            detailsController.makeController.text = data[index].toString();
                            Get.to(VehicleModel(
                              make: data[index].toString(),
                              category: widget.category.toString(),
                            ));
                            // goToVehicleModel(context);
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              data[index].toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: grey,
                            ),
                          ),
                        ),
                      );
                    }),
      ),
    );
  }
}
