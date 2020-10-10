# iPadSplitScreenKit

> **iPad 分屏基础组件**

[![Version](https://img.shields.io/cocoapods/v/iPadSplitScreenKit.svg?style=flat)](https://cocoapods.org/pods/iPadSplitScreenKit)
[![License](https://img.shields.io/cocoapods/l/iPadSplitScreenKit.svg?style=flat)](https://cocoapods.org/pods/iPadSplitScreenKit)
[![Platform](https://img.shields.io/cocoapods/p/iPadSplitScreenKit.svg?style=flat)](https://cocoapods.org/pods/iPadSplitScreenKit)

> OC/Swift项目均可使用【参考下文Install部分】，提供能力来快速适配IPad项目的分屏，悬浮屏，横竖屏等

- [官网教程：在 iPad 上使用多任务处理功能](https://support.apple.com/zh-cn/HT207582)
	- 不同样式，需要APP内部适配处理不同UI。
	- 针对APP启动（可以分屏模式启动），也需要处理。
	- 可运行过程Demo体验。

- ![](https://support.apple.com/library/content/dam/edam/applecare/images/zh_CN/iOS/ios13-ipad-pro-multitasking-drag-drop-animation.gif)

###  iPad 屏幕横竖屏演算

> 以下皆指屏幕相对宽度，对于苹果的临界数据，来进行内部处理的计算逻辑。

-  横屏
	-  1/3： < 0.40
	-   1/2： 0.40 < 0.6
	-  2/3：0.6  < 1.0
-  竖屏
	-  小：0.5 （1/2）
	-  大：0.7 (2/3)

-  横屏数据 (宽度和对比比例)

	-  375  678    981   1366  iPad pro 12.9

	-  0.274  0.496  0.71 1.00
 
	-  320     507     694       1024  ipad mini 5
	-  0.3125   0.495   0.677   1.00
 
-  竖屏
	-  320     438   768  mini
	-  0.41    0.57  1.00


## Installation

> iPadSplitScreenKit is available through [iPadSplitScreenKit](https://cocoapods.org/pods/iPadSplitScreenKit). To install it, simply add the following line to your Podfile:

> Objc和SwiftPod 可同时安装，也可以单独安装指定语言。

```ruby

// Default Swift 
pod 'iPadSplitScreenKit'

// OC
pod 'iPadSplitScreenKit/ObjC'

```

## Example

> To run the exampleproject, clone the repo, and run `pod install` from the Example directory first.


### Main API

```ObjC

/// iPad 全屏模式【仅调用一次】
- (void)ipadFullScreen;

/// iPad 小屏模式【仅调用一次】
- (void)ipadSmallScreen;

/// 小屏幕切换到大屏幕【处理逻辑】
- (void)ipadSmallToFullScreenConfigurations;

/// 大屏幕切换到小屏幕【处理逻辑】
- (void)ipadFullToSmallScreenConfigurations;

```

```Swift

	///  iPad 全屏模式【仅调用一次】
    open func ipadFullScreen()  {
    
    }
    /// iPad 小屏模式【仅调用一次】
    open func ipadSmallScreen()  {
    }
    
    /// 小屏幕切换到大屏幕【处理逻辑】
    open func ipadSmallToFullScreenConfigurations()  {
        
    }
    
    /// 大屏幕切换到小屏幕【处理逻辑】
    open func ipadFullToSmallScreenConfigurations()  {
        
    }
    
```

### iPadSplitScreen 使用说明
 
- 界面控制器继承此控制器类
 - viewDidLoad拆分到ipadFullScreen或者ipadSmallScreen实现【仅UI逻辑：布局，交互等】。
 - viewDidLoad中逻辑代码通用不需要改动！！！【 Example viewDidLoad打点，通知等逻辑不变】
 - 屏幕出现需要改变布局时刻【移除当前部分视图，保存当前session数据等场景,请ipadSmallToFull/ipadSmallToFull中处理。
 - 当前屏幕旋转，改变大小，若不需要改变布局，则相关函数不会触发，悉知。

 #### 辅助说明：
 - 判断当前是否全屏【OC使用此宏即可】 ： SPLITISFULLSCREEN


Author
------

DevdragonLi, dragonLi_52171@163.com

License
-------

iPadSplitScreenKit available under the MIT license. See the LICENSE
file for more info.
