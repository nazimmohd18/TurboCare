import 'package:flutter/material.dart';
import '../Utils/Colors.dart';
// import 'VehicleMake.dart';
import './CategoryScreen.dart';
import 'package:get/get.dart';
import '../Controller/DetailsControlller.dart';

class VehicleNumber extends StatefulWidget {
  static const routeName = 'VehicleNumber';

  @override
  _VehicleNumberState createState() => _VehicleNumberState();
}

class _VehicleNumberState extends State<VehicleNumber> {


  final GlobalKey<FormState> _formKey = GlobalKey();

final  TextEditingController _vehicleController = TextEditingController();

final  DetailsController detailsController = Get.put(DetailsController());

  String _numberErrorText;

Future<void> _submit() async {
  try {
    _formKey.currentState.save();
    if (!_formKey.currentState.validate()) {
      return;
    }

    Get.to(
      CategoryScreen(),
    );
    detailsController.vehicleNumberController.text =
        _vehicleController.text;

  } catch (e) {
    print(e);
  }
}

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: violet,
        title: Text(
          'Create new vehicle profile',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios_outlined),
        backgroundColor: violet,
        onPressed: () {
          _submit();
          // Get.to(
          //   CategoryScreen(),
          // );
          // detailsController.vehicleNumberController.text =
          //     _vehicleController.text;
// goToVehicleMake(context);
        },
      ),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * .05, vertical: deviceWidth * .075),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'VEHICLE NUMBER',
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: deviceWidth * .025,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * .025),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: _vehicleController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Vehicle Number is Required";
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorText: _numberErrorText,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
