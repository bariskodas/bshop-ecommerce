import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'sensor_card.dart';

class AccelerometerWidget extends StatelessWidget {
  const AccelerometerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AccelerometerEvent>(
      stream: SensorsPlatform.instance.accelerometerEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return SensorCard(
              icon: Icons.screen_rotation_rounded,
              title: "ACCELERATION",
              x: data.x,
              y: data.y,
              z: data.z);
        }
        return const Text("No data. Maybe you are using on simulator.");
      },
    );
  }
}
