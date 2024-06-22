import 'package:device_sound_profile_platform_interface/src/method_channel_device_sound_profile.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const kPlatformName = 'platformName';

  group('$MethodChannelDeviceSoundProfile', () {
    late MethodChannelDeviceSoundProfile methodChannelDeviceSoundProfile;
    final log = <MethodCall>[];

    setUp(() async {
      methodChannelDeviceSoundProfile = MethodChannelDeviceSoundProfile();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        methodChannelDeviceSoundProfile.methodChannel,
        (methodCall) async {
          log.add(methodCall);
          switch (methodCall.method) {
            case 'getPlatformName':
              return kPlatformName;
            default:
              return null;
          }
        },
      );
    });

    tearDown(log.clear);

    test('getPlatformName', () async {
      final platformName = await methodChannelDeviceSoundProfile.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(platformName, equals(kPlatformName));
    });
  });
}
