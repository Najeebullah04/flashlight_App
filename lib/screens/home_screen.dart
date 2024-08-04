// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../widgets/popup_menu.dart';
import '../utils/flashlight_util.dart';
import 'package:battery_plus/battery_plus.dart';
import '../utils/battery_icon.dart';

enum SampleItem { removeAds , sendFeedback , followUs , setting }

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
  bool isCharging = false;

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
                      icon: getBatteryIcon(percentage, isCharging),
                      label: Text('$percentage%',
                          style: TextStyle(color: Colors.black)),
                    )),
                Expanded(
                  flex: 0,
                  child: PopUpmenu(
                    onSelected: (SampleItem item) {
                      setState(() {
                        selectedItem = item;
                      });
                    },
                    selectedItem: selectedItem ?? SampleItem.removeAds,
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
