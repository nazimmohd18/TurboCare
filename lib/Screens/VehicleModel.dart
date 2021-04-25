import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
import 'VehicleFuel.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Controller/DetailsControlller.dart';

class VehicleModel extends StatefulWidget {
  static const routeName = 'VehicleModel';

  final String make;
  final String category;
  VehicleModel({this.make, this.category});

  @override
  _VehicleModelState createState() => _VehicleModelState();
}

class _VehicleModelState extends State<VehicleModel> {
  void goToVehicleFuel(BuildContext context) {
    Navigator.pushNamed(context, VehicleFuel.routeName);
  }

  final  DetailsController detailsController = Get.put(DetailsController());

  var data;
  Future<List> getModelList() async {
    final String url = "https://test.turbocare.app/turbo/care/v1/models?class=";

    final response = await http.get(
        Uri.parse(url +
            widget.category.toString() +
            "&make=" +
            widget.make.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print('Data from Vehicle Model: ' + data.toString());
      print(data.length);
      return data;
    } else {
      throw Exception("Unable to load data");
    }
  }

  Future modelList;
  @override
  initState() {
    super.initState();
    modelList = getModelList();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: violet,
        title: Text(
          'Select Model',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: FutureBuilder(
        future: modelList,
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
                          'No model available!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(deviceWidth * .05),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        // padding: EdgeInsets.symmetric(vertical: deviceWidth* .025),
                        child: InkWell(
                          onTap: () {
                            // // Get.to(VehicleModel(
                            //   make: data[index].toString(),
                            // ));
                            detailsController.modelController.text = data[index].toString();
                             goToVehicleFuel(context);
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
                    },
                    // children: [
                    //   InkWell(onTap: (){
                    //     goToVehicleFuel(context);
                    //   },
                    //     child: Container(
                    //       padding: EdgeInsets.symmetric(vertical: deviceWidth* .025),
                    //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(widget.make.toString(),style: TextStyle(fontSize: 18),),
                    //           Icon(Icons.arrow_forward_ios_outlined,color: grey,),
                    //
                    //         ],
                    //       ),
                    //     ),
                    //   )
                    // ],
                  ),
      ),
    );
  }
}
