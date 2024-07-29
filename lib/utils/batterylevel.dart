import "package:battery_plus/battery_plus.dart";
class BatteryUtil {
  
  static Future<int> getBatteryLevel() async{
    final Battery battery = Battery();
    try{
       final int battreyLevel = await battery.batteryLevel;
      return battreyLevel;
    }catch(e){
       throw Exception('Eror fetching Battery Level : $e');
    }
  }
}