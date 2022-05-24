
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
// Map<String, dynamic> deviceData = {};
  List deviceInfoKeys = [];
  List deviceInfoValues = [];
  @override
  void initState() {
    getDeviceInfo().then((value) {
      Map<String, dynamic> data = value;
      setState(() {
        for (var element in data.keys) {
          deviceInfoKeys.add(element);
          deviceInfoValues.add(data[element]);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return deviceInfoKeys.length < 2
          ? const CircularProgressIndicator.adaptive()
          : SingleChildScrollView(
            child: Padding(
              padding: Constants.hPadding16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("${deviceInfoKeys[0]}: ${deviceInfos[0]}"),
                    for (var i = 0; i < deviceInfoKeys.length; i++) Row(
        crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Expanded(
                          flex: 2,
                          child: Text("${deviceInfoKeys[i].toString()}: ", style: const TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                          flex: 3,
                          child: Text(deviceInfoValues[i].toString())),
                      ],
                    ),
                  ],
                ),
            ),
          );
  }
}

Future getDeviceInfo() async {
  DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  BaseDeviceInfo _deviceInfo = await _deviceInfoPlugin.deviceInfo;
  Map<String, dynamic> deviceInfo = _deviceInfo.toMap();
  // ignore: unused_local_variable
  for (var element in deviceInfo.keys) {}
  return deviceInfo;
}
