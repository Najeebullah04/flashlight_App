import 'package:flutter/material.dart';

Icon getBatteryIcon(int percentage, bool isCharging) {
  if (isCharging) {
    return Icon(Icons.battery_charging_full_outlined, color: Colors.white);
  } else if (percentage >= 95) {
    return Icon(Icons.battery_6_bar_sharp, color: Colors.green);
  } else if (percentage >= 80) {
    return Icon(Icons.battery_5_bar_sharp, color: Colors.green[400]);
  } else if (percentage >= 60) {
    return Icon(Icons.battery_4_bar_sharp, color: Colors.amber[300]);
  } else if (percentage >= 40) {
    return Icon(Icons.battery_3_bar_sharp, color: Colors.amber[400]);
  } else if (percentage >= 20) {
    return Icon(Icons.battery_2_bar_sharp, color: Colors.amber[400]);
  } else if (percentage >= 1) {
    return Icon(Icons.battery_1_bar, color: Colors.red[400]);
  } else {
    return Icon(Icons.battery_alert_rounded);
  }
}
