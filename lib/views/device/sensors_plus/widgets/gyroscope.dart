import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'sensor_card.dart';

class GyroscopeWidget extends StatelessWidget {
  const GyroscopeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GyroscopeEvent>(
      stream: SensorsPlatform.instance.gyroscopeEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return SensorCard(
              icon: Icons.phonelink_ring,
              title: "GYROSOCPE",
              x: data.x,
              y: data.y,
              z: data.z);
        }
        return const SizedBox();
      },
    );
  }
}
