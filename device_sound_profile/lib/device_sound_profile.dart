import 'package:device_sound_profile_platform_interface/device_sound_profile_platform_interface.dart';

DeviceSoundProfilePlatform get _platform => DeviceSoundProfilePlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}
