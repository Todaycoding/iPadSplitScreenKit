Pod::Spec.new do |s|
  s.name         = "iPadSplitScreenKit"
  s.version      = "1.2.0"
  s.summary      = "iPadSplitScreenKit:提供iPad分屏及横竖屏相关基础能力"
  
  s.description  = "
  iPadSplitScreenKit（iPad分屏组件）
    随时获取是否全屏状态，是否横屏状态，当前屏幕具体状态 （当前实际用户可见显示最大宽度，高度）
    支持APP启动分屏模式适配
    首次渲染时机捕获【打点，布局等】
    布局不同样式,场景下:通用逻辑部分，大小屏逻辑
                   "
  s.homepage         = 'https://github.com/Todaycoding/iPadSplitScreenKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DevDragonli' => 'Dragonli_52171@163.com' }
  s.source           = { :git => 'https://github.com/Todaycoding/iPadSplitScreenKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  
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
