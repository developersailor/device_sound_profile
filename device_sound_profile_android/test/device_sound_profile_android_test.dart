import 'package:device_sound_profile_android/device_sound_profile_android.dart';
import 'package:device_sound_profile_platform_interface/device_sound_profile_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DeviceSoundProfileAndroid', () {
    const kPlatformName = 'Android';
    late DeviceSoundProfileAndroid deviceSoundProfile;
    late List<MethodCall> log;

    setUp(() async {
      deviceSoundProfile = DeviceSoundProfileAndroid();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(deviceSoundProfile.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      DeviceSoundProfileAndroid.registerWith();
      expect(DeviceSoundProfilePlatform.instance, isA<DeviceSoundProfileAndroid>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await deviceSoundProfile.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
