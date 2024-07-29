// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../widgets/popup_menu.dart';
import 'package:torch_light/torch_light.dart';

enum SampleItem { item1, item2, item3 }

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SampleItem? selectedItem;
  bool _isOn = false;
  Future<void> _toggleFlashlight() async {
    setState(() {
      _isOn = !_isOn;
    });

    try {
      if (_isOn) {
        await TorchLight.enableTorch();
      } else {
        await TorchLight.disableTorch();
      }
    } catch (e) {
      setState(() {
        _isOn = !_isOn; // Revert the state if there's an error
      });
      print('Error: $e');
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
                      icon: Icon(Icons.battery_1_bar_outlined,
                          color: Colors.amber),
                      label: Text('10%', style: TextStyle(color: Colors.amber)),
                    )),
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
                    onPressed: _toggleFlashlight,
                    icon: Icon(Icons.power_settings_new_rounded))
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
