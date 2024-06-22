import 'package:device_sound_profile_platform_interface/device_sound_profile_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The iOS implementation of [DeviceSoundProfilePlatform].
class DeviceSoundProfileIOS extends DeviceSoundProfilePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_sound_profile_ios');

  /// Registers this class as the default instance of [DeviceSoundProfilePlatform]
  static void registerWith() {
    DeviceSoundProfilePlatform.instance = DeviceSoundProfileIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
