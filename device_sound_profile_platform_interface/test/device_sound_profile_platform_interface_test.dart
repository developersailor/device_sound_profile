import 'package:device_sound_profile_platform_interface/device_sound_profile_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class DeviceSoundProfileMock extends DeviceSoundProfilePlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('DeviceSoundProfilePlatformInterface', () {
    late DeviceSoundProfilePlatform deviceSoundProfilePlatform;

    setUp(() {
      deviceSoundProfilePlatform = DeviceSoundProfileMock();
      DeviceSoundProfilePlatform.instance = deviceSoundProfilePlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await DeviceSoundProfilePlatform.instance.getPlatformName(),
          equals(DeviceSoundProfileMock.mockPlatformName),
        );
      });
    });
  });
}
