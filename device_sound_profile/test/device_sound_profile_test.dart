import 'package:device_sound_profile/device_sound_profile.dart';
import 'package:device_sound_profile_platform_interface/device_sound_profile_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceSoundProfilePlatform extends Mock
    with MockPlatformInterfaceMixin
    implements DeviceSoundProfilePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DeviceSoundProfile', () {
    late DeviceSoundProfilePlatform deviceSoundProfilePlatform;

    setUp(() {
      deviceSoundProfilePlatform = MockDeviceSoundProfilePlatform();
      DeviceSoundProfilePlatform.instance = deviceSoundProfilePlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => deviceSoundProfilePlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => deviceSoundProfilePlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}
