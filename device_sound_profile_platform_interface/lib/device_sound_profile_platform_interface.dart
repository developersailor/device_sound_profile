import 'package:device_sound_profile_platform_interface/src/method_channel_device_sound_profile.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of device_sound_profile must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `DeviceSoundProfile`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [DeviceSoundProfilePlatform] methods.
abstract class DeviceSoundProfilePlatform extends PlatformInterface {
  /// Constructs a DeviceSoundProfilePlatform.
  DeviceSoundProfilePlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceSoundProfilePlatform _instance =
      MethodChannelDeviceSoundProfile();

  /// The default instance of [DeviceSoundProfilePlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceSoundProfile].
  static DeviceSoundProfilePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [DeviceSoundProfilePlatform] when they register themselves.
  static set instance(DeviceSoundProfilePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
