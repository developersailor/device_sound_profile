import 'package:device_sound_profile_platform_interface/device_sound_profile_platform_interface.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';

/// An implementation of [DeviceSoundProfilePlatform] that uses method channels.
class MethodChannelDeviceSoundProfile extends DeviceSoundProfilePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_sound_profile');

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
