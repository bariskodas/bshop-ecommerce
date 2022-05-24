import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

// ignore: non_constant_identifier_names
Padding SensorCard({
    String? xAxis = "X Axis",
    String? yAxis = "Y Axis",
    String? zAxis = "Z Axis",
   required String title,
  required IconData icon,
  required double x,y,z
  }) {
    return Padding(
          padding:  Constants.hPadding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(title, style: const TextStyle(color: Colors.grey),),
          const Divider(), 
          Row(children: [
            //icon
            Icon(icon, size: 64, color: Colors.grey),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              // X Axis
              Row(
                children: [
                  Text(xAxis.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  Text(x.toString())
                ],
              ),
              // Y Axis
              Row(
                children: [
                  Text(yAxis.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  Text(y.toString())
                ],
              ),
              // Z Axis
              Row(
                children: [
                  Text(zAxis.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  Text(z.toString())
                ],
              ),
            ],)
          ]),
          const Divider(),
            ],
          ),
        );
  }
