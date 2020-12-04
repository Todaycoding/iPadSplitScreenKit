//
//  iPadSplitScreenStatusTool.h
//  iPadSplitScreenKit
//
//  Created by DevDragonLi on 9/10/2020.
//

#import <Foundation/Foundation.h>
#import <iPadSplitScreenKit/iPadSplitScreenDefineHeader.h>

/// BOOL  【判断当前是否全屏模式】
#define SPLITISFULLSCREEN (iPadSplitScreenStatusTool.defaultool.fullScreen)

/// 屏幕发生分屏/横竖屏切换行为，会通知抛出 【时机：此单利已配置完成】
FOUNDATION_EXTERN NSString * _Nonnull const SplitScreenChangeNotification;

NS_ASSUME_NONNULL_BEGIN

@interface iPadSplitScreenStatusTool : NSObject

/// NOTE：获取当前是小屏幕还是大屏幕状态
/// 【点击事件弹框展示等使用】
/// 【获取时机：APP首屏渲染后】
@property (nonatomic, assign, readonly, getter=isFullScreen) BOOL fullScreen;

/// NOTE：获取是否为横屏显示形态【YES 即为横屏状态，否则为竖屏状态】
/// 【获取时机：APP启动后 Any 】
@property (nonatomic, assign, readonly, getter=isInterfaceOrientationLandscape)BOOL interfaceOrientationLandscape;

/// NOTE：获取当前最详细的屏幕显示形态【参考 `ZDInterfaceType` 枚举类型】
/// 【获取时机：viewDidLoad函数中/之后生命周期函数中获取】
@property (nonatomic, assign, readonly)SplitScreenInterfaceType currentScreenInterfaceType;

/// NOTE：获取当前最详细的屏幕的相对显示【布局时，获取当前屏幕最大宽度等使用】
/// 【获取时机：APP首屏渲染后】
@property (nonatomic, assign, readonly)CGFloat currentScreenWidth;

/// NOTE：获取当前最详细的屏幕的相对显示【布局时，获取当前屏幕最大高度等使用】
/// 【获取时机：APP首屏渲染后】
@property (nonatomic, assign, readonly)CGFloat currentScreenHeight;

+ (instancetype)defaultool;

- (void)updateCurrentInterfaceOrientation;

#pragma mark -以下函数不建议外界调用

- (void)updateCurrentInterfaceSize:(CGSize)currentsize;

- (void)updateScreenInterfaceAttributes;

@end

NS_ASSUME_NONNULL_END
