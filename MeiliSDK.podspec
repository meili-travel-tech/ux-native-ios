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
  s.source = { :http => '' }
  s.ios.vendored_frameworks = ''
end
