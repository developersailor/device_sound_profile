import Flutter
import UIKit
import Mute

public class DeviceSoundProfilePlugin: NSObject, FlutterPlugin {
  var str:String = "normal"
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_sound_profile_ios", binaryMessenger: registrar.messenger())
    let instance = DeviceSoundProfilePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   switch call.method {
           case "getRingerMode":
                Mute.shared.notify = {
                  [weak self] m in
                  self?.str = m ? "vibrate" : "normal"
                 }
             result(self.str);
           default:
             break;
         }
     }
  }

