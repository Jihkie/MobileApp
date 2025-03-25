// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:open_shock/main.dart';
import 'package:open_shock/screens/SettingScreen.dart';
import 'package:open_shock/utils/AppColors.dart';
import 'package:open_shock/utils/AppComman.dart';

import '../component/OwnHubListComponent.dart';


String help_msg = "Name this hub, and select your hub "
  "running a bluetooth-compatible version of the firmware.\n"
  "Why?: If you wish to move the hub, this would allow "
  "you to keep the hub online without access to a wifi "
  "network, reconfiguring to a new network, or running "
  "a hotspot.";

class BluetoothHubFragment extends StatefulWidget {
  static String tag = '/BluetoothHubFragment';
  String? title;

  BluetoothHubFragment({this.title});

  @override
  BluetoothHubFragmentState createState() => BluetoothHubFragmentState();
}

class BluetoothHubFragmentState extends State<BluetoothHubFragment> {
  int sceneIndex = 0;

  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(AppContainerColor);
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bluetooth Hub", style: boldTextStyle(color: white, size: 24)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppContainerColor,
          actions: [
            IconButton(
              color: AppContainerColor,
              icon: Icon(Icons.help_outline, color: white),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppContainerColor,
                      content: Text(help_msg, style: primaryTextStyle(color: white),)
                    );
                  }
                );
              },
            ),
          ],
        ),
        backgroundColor: AppContainerColor,
        body: Container(
          width: context.width(),
          height: context.height(),
          decoration: BoxDecoration(
            color: AppScaffoldDarkColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Title(color: white,
                child: Text("Hub name:",
                  style: boldTextStyle(color: white, size: 25)
                ),
              ),
              AppTextField(
                textStyle: primaryTextStyle(color: white),
                cursorColor: white,
                textFieldType: TextFieldType.OTHER,
                initialValue: "BT Hub",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

