import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'sensor_card.dart';

class MagnetometerWidget extends StatelessWidget {
  const MagnetometerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MagnetometerEvent>(
      stream: SensorsPlatform.instance.magnetometerEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return SensorCard(
              icon: Icons.electrical_services,
              title: "MAGNETIC FIELD",
              x: data.x,
              y: data.y,
              z: data.z);
        }
        return const SizedBox();
      },
    );
  }
}
