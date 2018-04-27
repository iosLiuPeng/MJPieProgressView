Pod::Spec.new do |s|
  s.name             = 'MJPieProgressView'
  s.version          = '1.0.0'
  s.summary          = 'Pie chart, Pie progress bar.'
  s.homepage         = 'https://github.com/iosLiuPeng/MJPieProgressView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iosLiuPeng' => '392009255@qq.com' }
  s.source           = { :git => 'https://github.com/iosLiuPeng/MJPieProgressView.git', :tag => s.version.to_s }
  s.platform     = :ios 
  s.ios.deployment_target = '7.0'
  s.source_files = 'Classes/*.{h,m}'
  s.frameworks = 'UIKit'
  # s.resource_bundles = {
  #   'view' => ['Assets/*.png']
  # }
end
