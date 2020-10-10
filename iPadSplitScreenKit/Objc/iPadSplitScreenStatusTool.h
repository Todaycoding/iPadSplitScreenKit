//
//  iPadSplitScreenStatusTool.h
//  iPadSplitScreenKit
//
//  Created by DevDragonLi on 9/10/2020.
//

#import <Foundation/Foundation.h>
#import "iPadSplitScreenDefineHeader.h"

/// Bool 类型
#define ZDISFULLSCREEN (ZDScreenStatusTool.tool.fullScreen)

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

+ (instancetype)tool;


@end

NS_ASSUME_NONNULL_END
