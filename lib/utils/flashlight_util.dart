import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class FlashlightUtil {
  static Future<void> flashlightUtilToggle(bool isOn) async {
    try {
      if (isOn) {
        await TorchLight.enableTorch();
      } else {
        await TorchLight.disableTorch();
      }
    } catch (e) {
      debugPrint('debug: $e');
    }
  }
}
