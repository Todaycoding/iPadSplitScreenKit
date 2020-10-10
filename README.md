# iPadSplitScreenKit

> **iPad 分屏基础组件**

[![CI
Status](https://img.shields.io/travis/Todaycoding/iPadSplitScreenKit.svg?style=flat)](https://travis-ci.org/Todaycoding/iPadSplitScreenKit)
[![Version](https://img.shields.io/cocoapods/v/iPadSplitScreenKit.svg?style=flat)](https://cocoapods.org/pods/iPadSplitScreenKit)
[![License](https://img.shields.io/cocoapods/l/iPadSplitScreenKit.svg?style=flat)](https://cocoapods.org/pods/iPadSplitScreenKit)
[![Platform](https://img.shields.io/cocoapods/p/iPadSplitScreenKit.svg?style=flat)](https://cocoapods.org/pods/iPadSplitScreenKit)

> OC/Swift项目均可使用【参考下文Install部分】，提供能力来快速适配IPad项目的分屏，悬浮屏，横竖屏等

###  iPad 屏幕横竖屏演算

> 以下皆指屏幕相对宽度

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


Author
------

DevdragonLi, dragonLi_52171@163.com

License
-------

iPadSplitScreenKit available under the MIT license. See the LICENSE
file for more info.
