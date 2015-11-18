Pod::Spec.new do |s|
  s.name = 'Iris'
  s.version = '1.0.1'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'A Swift framework for working with Imgix.'
  s.source = { :git => 'https://github.com/hodinkee/iris.git', :tag => "v#{s.version}" }

  s.social_media_url = 'http://twitter.com/cocoahero'
  s.authors = { 'Jonathan Baker' => 'jonathan@jonathanbaker.me', 'Caleb Davenport' => 'caleb@calebd.me' }
  s.homepage = 'https://github.com/hodinkee/iris'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.framework = 'Foundation'
  s.requires_arc = true
  s.source_files = 'Iris/*.{h,m,swift}'
end
