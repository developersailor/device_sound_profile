#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'device_sound_profile_ios'
  s.version          = '0.0.1'
  s.summary          = 'An iOS implementation of the device_sound_profile plugin.'
  s.description      = <<-DESC
  An iOS implementation of the device_sound_profile plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :type => 'BSD', :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }  
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Mute', '~> 0.6.0'
  s.platform = :ios, '9.0'
  s.vendored_frameworks = 'DeviceSoundProfile.framework'
  s.ios.preserve_paths = 'DeviceSoundProfile.framework'
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
