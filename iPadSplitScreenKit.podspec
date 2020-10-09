Pod::Spec.new do |s|
  s.name         = "iPadSplitScreenKit"
  s.version      = "1.0.0"
  s.summary      = "iPadSplitScreenKit"
  
  s.description  = <<-DESC
iPadSplitScreenKit（iPad分屏组件）
                   DESC
  s.homepage         = 'https://github.com/Todaycoding/iPadSplitScreenKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DevDragonli' => 'Dragonli_52171@163.com' }
  s.source           = { :git => 'https://github.com/Todaycoding/iPadSplitScreenKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.swift_version = '5.0'
  
  s.source_files  = 'iPadSplitScreenKit/**/*'

  # s.public_header_files = 'ColorPicker/Protocol/*.h','ColorPicker/Define/ZDColorPickTypeHeader.h'

end
