# device_sound_profile_platform_interface

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

A common platform interface for the `device_sound_profile` plugin.

This interface allows platform-specific implementations of the `device_sound_profile` plugin, as well as the plugin itself, to ensure they are supporting the same interface.

# Usage

To implement a new platform-specific implementation of `device_sound_profile`, extend `DeviceSoundProfilePlatform` with an implementation that performs the platform-specific behavior.

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis