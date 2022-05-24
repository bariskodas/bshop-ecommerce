import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'sensor_card.dart';

class UserAccelerometerWidget extends StatelessWidget {
  const UserAccelerometerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserAccelerometerEvent>(
      stream: SensorsPlatform.instance.userAccelerometerEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return SensorCard(
              icon: Icons.sports_gymnastics,
              title: "USER ACCELERATION",
              x: data.x,
              y: data.y,
              z: data.z);
        }
        return const SizedBox();
      },
    );
  }
}
