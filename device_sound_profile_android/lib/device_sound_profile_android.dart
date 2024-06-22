import 'package:device_sound_profile_platform_interface/device_sound_profile_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The Android implementation of [DeviceSoundProfilePlatform].
class DeviceSoundProfileAndroid extends DeviceSoundProfilePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_sound_profile_android');

  /// Registers this class as the default instance of [DeviceSoundProfilePlatform]
  static void registerWith() {
    DeviceSoundProfilePlatform.instance = DeviceSoundProfileAndroid();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
