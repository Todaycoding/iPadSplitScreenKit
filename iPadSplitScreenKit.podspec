Pod::Spec.new do |s|
  s.name         = "iPadSplitScreenKit"
  s.version      = "1.1.5"
  s.summary      = "iPadSplitScreenKit"
  
  s.description  = <<-DESC
iPadSplitScreenKit（iPad分屏组件）
                   DESC
  s.homepage         = 'https://github.com/Todaycoding/iPadSplitScreenKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DevDragonli' => 'Dragonli_52171@163.com' }
  s.source           = { :git => 'https://github.com/Todaycoding/iPadSplitScreenKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  
  s.default_subspec = 'Swift'
  
  s.swift_version = '5.0'
  
  s.subspec 'Swift' do |ss|
    ss.source_files  = 'iPadSplitScreenKit/**/*.swift'
  end

  s.subspec 'ObjC' do |ss|
      ss.source_files = 'iPadSplitScreenKit/ObjC/**/*'
      ss.public_header_files = 'iPadSplitScreenKit/ObjC/**/*.h'
  end

end
