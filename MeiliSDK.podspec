Pod::Spec.new do |s|
  s.name                           = 'MeiliSDK'
  s.version = ''
  s.summary                        = 'Use Meili Platform'
  # s.license                        = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage                       = 'https://meili.travel/'
  s.authors                        = { 'Meili' => 'support+github@meili.com' }
  s.platform                       = :ios
  s.swift_version		               = '5.9'
  s.ios.deployment_target               = '16.0'
  s.source = { :http => 'https://github.com/meili-travel-tech/ux-native-ios/releases/download/1.0.40-alpha/MeiliSDK-1.0.40-alpha.xcframework.zip' }
  s.ios.vendored_frameworks = ''
end
