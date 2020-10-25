# iPadSplitScreenKit

> **iPad APP 分屏基础能力组件**

[![Version](https://img.shields.io/cocoapods/v/iPadSplitScreenKit.svg?style=flat)](https://cocoapods.org/pods/iPadSplitScreenKit)
[![License](https://img.shields.io/cocoapods/l/iPadSplitScreenKit.svg?style=flat)](https://cocoapods.org/pods/iPadSplitScreenKit)
[![Platform](https://img.shields.io/cocoapods/p/iPadSplitScreenKit.svg?style=flat)](https://cocoapods.org/pods/iPadSplitScreenKit)


## 【分屏】&&【横竖屏】

> ObjC/Swift项目(**纯OC/Swift/混编**)均可使用【参考下文Install部分】，提供能力来快速适配IPad项目的分屏，悬浮屏，横竖屏等

-  随时获取是否全屏状态，是否横屏状态，当前屏幕具体状态 （当前实际用户可见显示最大宽度，高度）✅
- 支持APP启动分屏模式适配✅
	- 首次渲染时机捕获【打点，布局等】
- 布局不同样式/场景下:通用逻辑部分，大小屏逻辑 ✅

#### [官网教程：在 iPad 上使用多任务处理功能](https://support.apple.com/zh-cn/HT207582)
- 不同样式，需要APP内部适配处理不同UI。
- 针对APP启动（可以分屏模式启动），也需要处理。
- 可运行Demo体验【当前为2/3横屏模式为全屏展示，其他为小屏幕模式，此处后期支持自定义】。

- ![](https://support.apple.com/library/content/dam/edam/applecare/images/zh_CN/iOS/ios13-ipad-pro-multitasking-split-view-animation.gif)


## Installation

> iPadSplitScreenKit is available through [Cocoapods](https://cocoapods.org/pods/iPadSplitScreenKit). To install it, simply add the following line to your Podfile:

> Objc和SwiftPod 可同时安装，也可单独安装某一语言。

```ruby

// Default Swift 
pod 'iPadSplitScreenKit','~>1.1.0'

// ObjC
pod 'iPadSplitScreenKit/ObjC','~>1.1.0'

```

## Example

> To run the exampleproject, clone the repo, and run `pod install` from the Example directory first.


### Main API

```ObjC

`iPadSplitScreenStatusTool`

/// NOTE：获取当前是小屏幕还是大屏幕状态
/// 【点击事件弹框展示等使用】
/// 【获取时机：APP首屏渲染后】
@property (nonatomic, assign, readonly, getter=isFullScreen) BOOL fullScreen;

/// NOTE：获取是否为横屏显示形态【YES 即为横屏状态，否则为竖屏状态】
/// 【获取时机：APP启动后 Any 】
@property (nonatomic, assign, readonly, getter=isInterfaceOrientationLandscape)BOOL interfaceOrientationLandscape;

/// NOTE：获取当前最详细的屏幕显示形态【参考 `SplitScreenInterfaceType` 枚举类型】
/// 【获取时机：viewDidLoad函数中/之后生命周期函数中获取】
@property (nonatomic, assign, readonly)SplitScreenInterfaceType currentScreenInterfaceType;

/// NOTE：获取当前最详细的屏幕的相对显示【布局时，获取当前屏幕最大宽度等使用】
/// 【获取时机：APP首屏渲染后】
@property (nonatomic, assign, readonly)CGFloat currentScreenWidth;

`iPadSplitScreenVC`

/// 当前界面共同视图/逻辑添加此处【仅调用一次】
/// 【原：viewDidLoad公用/调通UI/逻辑迁移至此函数】
/// 【Example：界面的CollectionView为大小屏的通用视图，则此处添加，不需要ipadFullScreen和ipadSmallScreen函数处理】
- (void)ipadCommonSetup;

/// iPad 全屏模式【仅调用一次】
- (void)ipadFullScreen;

/// iPad 小屏模式【仅调用一次】
- (void)ipadSmallScreen;

/// 小屏幕切换到大屏幕【处理逻辑】
- (void)ipadSmallToFullScreenConfigurations;

/// 大屏幕切换到小屏幕【处理逻辑】
- (void)ipadFullToSmallScreenConfigurations;

/// 每次屏幕改变均调用此函数【分屏操作，横竖屏改变，子类控制器可通过此函数获取时机】
/// @param changeType changeType
/// @param currentSize currentSize 
- (void)ipadInterfaceOrientationChanged:(ZDInterfaceChangeType)changeType
                            currentSize:(CGSize)currentSize;


```

```Swift

/// 当前界面共同视图/逻辑添加此处【仅调用一次】
/// 【原：viewDidLoad公用/调通UI/逻辑迁移至此函数】
/// 【Example：界面的CollectionView为大小屏的通用视图，则此处添加，不需要ipadFullScreen和ipadSmallScreen函数处理】
open func ipadCommonSetup()  {
    
}

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
   
/// 每次屏幕改变均调用此函数【分屏操作，横竖屏改变，子类控制器可通过此函数获取时机】
open func ipadInterfaceOrientationChanged(changeType:ScreenInterfaceChangeType,currentSize:CGSize) {
   
}   
   
```

### iPadSplitScreen 使用说明
 
 - 界面控制器继承此控制器类

 - viewDidLoad拆分到`ipadFullScreen`或者`ipadSmallScreen`实现【仅UI逻辑：布局，交互等】。
    
 -  viewDidLoad中其他代码可迁移至 `ipadCommonSetup`！！！【原viewDidLoad打点，通知等逻辑不变】

 -  屏幕出现需要改变布局时刻【移除当前部分视图，保存当前session数据等场景,请ipadSmallToFull/ipadSmallToFull中处理。

 -  当前屏幕旋转，改变大小，若不需要改变布局，则相关函数不会触发，悉知。
 
 
 - `ipadInterfaceOrientationChanged`函数界面渲染后，**每次改变均会调用2次！！！**，需要通过枚举过滤时机
 
 ```
【需要等待屏幕旋转改变，大小屏切换函数执行后，再处理逻辑，则参考如下】
 
 - (void)ipadInterfaceOrientationChanged:(ZDInterfaceChangeType)changeType
                             currentSize:(CGSize)currentSize {
    if (changeType != ZDInterfaceChangeLatter) {
        return;
    }
    // you custom code
 }
 
 
 【当前是否从小屏幕转化为小屏幕，或者大屏幕转化为大屏幕需要调整细节】
 
 - (void)ipadInterfaceOrientationChanged:(ZDInterfaceChangeType)changeType
                             currentSize:(CGSize)currentSize {
     if (changeType != ZDInterfaceChangeLatter) {
         return;
     }
 
     if (!ZDISFullScreen) {
       // 当前切换到小屏幕的逻辑调整
     }  else {
      
    }
 }
 
 ```
 
 #### 辅助说明：
 
 - 判断当前是否全屏【OC使用此宏即可】 ： SPLITISFULLSCREEN


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


Author 
------

[DevDragonLi](https://github.com/DevDragonLi), dragonLi_52171@163.com

License
-------

iPadSplitScreenKit available under the MIT license. See the LICENSE
file for more info.
