// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../widgets/popup_menu.dart';
import '../utils/flashlight_util.dart';
import 'package:battery_plus/battery_plus.dart';

enum SampleItem { item1, item2, item3 }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SampleItem? selectedItem;
  bool _isOn = false;
  var battery = Battery();
  int percentage = 0;
  bool isCharging = false ;

  @override
  void initState() {
    super.initState();
    super.initState();
    getBatteryPerentage();
  }

  void getBatteryPerentage() async {
    final level = await battery.batteryLevel;
     final chargingStatus = await battery.onBatteryStateChanged.first;
    percentage = level;

    setState(() {
       percentage = level;
      isCharging = chargingStatus == BatteryState.charging;
    });
  }

  Icon getBatteryIcon(int percentage, bool isCharging) {
    if (isCharging) {
      return Icon(Icons.battery_charging_full, color: Colors.green);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_constructors
        body: SafeArea(
      child: Container(
        color: Colors.black12,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 55.0,
                ),
                Expanded(
                    flex: 2,
                    child: TextButton.icon(
                      onPressed: () {
                        print('TextButton pressed');
                      },
                      icon: getBatteryIcon(percentage , isCharging),
                      label: Text('$percentage%',
                          style: TextStyle(color: Colors.black)),
                    )
                    ),
                Expanded(
                  flex: 0,
                  child: PopUpmenu(
                    onSelected: (SampleItem item) {
                      setState(() {
                        selectedItem = item;
                      });
                    },
                    selectedItem: selectedItem ?? SampleItem.item1,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 300.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      setState(() {
                        _isOn = !_isOn;
                      });
                      try {
                        await FlashlightUtil.flashlightUtilToggle(_isOn);
                      } catch (e) {
                        setState(() {
                          _isOn = !_isOn;
                        });
                      }
                    },
                    icon: Icon(Icons.power_settings_new))
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
