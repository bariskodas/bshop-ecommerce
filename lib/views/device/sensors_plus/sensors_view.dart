import 'package:flutter/material.dart';
import 'widgets/accelerometer.dart';
import 'widgets/gyroscope.dart';
import 'widgets/magnetometer.dart';
import 'widgets/user_accelerometer.dart';

class SensorsPage extends StatelessWidget {
  const SensorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: const [
          AccelerometerWidget(),
          UserAccelerometerWidget(),
          GyroscopeWidget(),
          MagnetometerWidget(),
        ],
      ),
    ));
  }
}
