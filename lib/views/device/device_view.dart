

import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'device_info/device_info_view.dart';
import 'sensors_plus/sensors_view.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({Key? key}) : super(key: key);

  @override
  State<DevicePage> createState() => _DevicePageState();
}


class _DevicePageState extends State<DevicePage> with SingleTickerProviderStateMixin{

late TabController tabController;

@override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  
@override
  void dispose() {
tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                width: double.maxFinite,
                child: TabBar(
                  controller: tabController,
                  labelColor: Constants.orangeColor,
                  indicatorColor: Constants.orangeColor,
                  tabs: const [
                  Tab(icon: Icon(Icons.device_unknown), text: "Info"),
                  Tab(icon: Icon(Icons.sensors), text: "Sensors"),
                ]),
              ),
              SizedBox(
                height: 600,
                width: double.maxFinite,
                child: TabBarView(
                  controller: tabController,
                  children: const [
                  DeviceInfoPage(),
                  SensorsPage(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


