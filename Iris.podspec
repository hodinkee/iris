Pod::Spec.new do |s|
  s.name = 'Iris'
  s.version = '1.0.2-beta'
  s.license = 'MIT'
  s.summary = 'A Swift framework for working with Imgix.'
  s.homepage = 'https://github.com/hodinkee/iris'
  s.social_media_url = 'http://twitter.com/cocoahero'
  s.authors = { 'Jonathan Baker' => 'http://twitter.com/cocoahero' }
  s.source = { :git => 'https://github.com/arturgrigor/iris.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'Iris/*.{h,m,swift}'
end
